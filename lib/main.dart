import 'dart:developer';

import 'package:authentication/authentication.dart';
import 'package:fitness_nutrition/fitness_nutrition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_input/food_input.dart';
import 'package:food_report/food_report.dart';
import 'package:local_storage/local_storage.dart';
import 'package:payment_repository/payment.dart';
import 'package:profile/profile.dart';
import 'package:remote_api/remote_api.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:tandorost/navigation.dart';
import 'package:tandorost/notification_helper.dart';
import 'package:tandorost_components/tandorost_components.dart';
import 'package:image_repository/image_repository.dart';
import 'package:coach_repository/coach_repository.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest_all.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final sharePref = await SharedPreferences.getInstance();
  FlutterError.onError = (FlutterErrorDetails details) async {
    await Sentry.captureException(details.exception, stackTrace: details.stack);
    log(
      'error in ${details.library}',
      stackTrace: details.stack,
      error: details.exception,
    );
  };
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://1d10de0455222c0ba27560b4f0071ff3@o4504084043530240.ingest.us.sentry.io/4506958323253248';
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(
      DefaultAssetBundle(
        bundle: SentryAssetBundle(),
        child: DependencyManager(sharedPreferences: sharePref),
      ),
    ),
  );
}

class DependencyManager extends StatelessWidget {
  const DependencyManager({super.key, required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    final nonSecureStorage = sharedPreferences;

    final remoteApi = RemoteApi();

    AndroidOptions _getAndroidOptions() =>
        const AndroidOptions(encryptedSharedPreferences: true);

    final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    final localStorage = LocalStorage(
      flutterSecureStorage: storage,
      sharedPreferences: nonSecureStorage,
    );
    late final authenticationRep = AuthenticationRepository(
      remoteApi: remoteApi,
      localStorage: localStorage,
    );
    final profileRep = ProfileRepository(
      remoteApi: remoteApi,
      localStorage: localStorage,
    );
    final coachRep = CoachRepository(remoteApi: remoteApi);
    remoteApi.accessTokenProvider = authenticationRep.accessTokenProvider;
    remoteApi.userLanguageProvider = profileRep.userLanguage;

    final foodInputRep = FoodInputRepository(remoteApi: remoteApi);

    final paymentRep = PaymentRepository(remoteApi: remoteApi);

    final imageRepository = ImageRepository(remoteApi: remoteApi);
    final fitnessNutrition = FitnessNutrition(
      remoteApi: remoteApi,
      localStorage: localStorage,
    );
    final foodReport = FoodReport(remoteApi: remoteApi);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => foodInputRep,
          dispose: (value) async => await value.dispose(),
          lazy: true,
        ),
        RepositoryProvider(
          create: (_) => profileRep,
          lazy: true,
          dispose: (profileRep) => profileRep.dispose(),
        ),
        RepositoryProvider(create: (_) => authenticationRep, lazy: true),
        RepositoryProvider(create: (_) => imageRepository, lazy: true),
        RepositoryProvider(
          create: (_) => fitnessNutrition,
          lazy: true,
          dispose: (fitnessNutrition) async {
            await fitnessNutrition.dispose();
          },
        ),
        RepositoryProvider(create: (_) => foodReport, lazy: true),
        RepositoryProvider(create: (_) => paymentRep, lazy: true),
        RepositoryProvider(create: (_) => coachRep, lazy: true),
        RepositoryProvider(
          create: (_) => flutterLocalNotificationsPlugin,
          lazy: true,
        ),
      ],
      child: TandorostBlocProviders(),
    );
  }
}

class TandorostBlocProviders extends StatelessWidget {
  const TandorostBlocProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserAccountCubit(
            imageRepository: RepositoryProvider.of<ImageRepository>(context),
            profileRepository: RepositoryProvider.of<ProfileRepository>(
              context,
            ),
          ),
          lazy: false,
        ),
      ],
      child: TandorostPlatform(),
    );
  }
}

class TandorostPlatform extends StatelessWidget {
  const TandorostPlatform({super.key});

  @override
  Widget build(BuildContext context) {
    final dpr = View.of(context).display.devicePixelRatio;
    final width = View.of(context).display.size.width;
    return MaterialApp.router(
      theme: AppTheme(
        locale: const Locale('fa'),
        screenWidth: dpr * width,
      ).lightTheme,
      routerConfig: Navigation.goRouter(context),
      localizationsDelegates: const [
        PersianMaterialLocalizations.delegate,
        PersianCupertinoLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        ComponentLibraryLocalizations.delegate,
      ],
      supportedLocales: const [Locale("fa", "IR")],
      locale: const Locale("fa", "IR"),
    );
  }
}
