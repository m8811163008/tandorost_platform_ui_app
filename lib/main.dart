import 'package:authentication/authentication.dart';
import 'package:fitness_nutrition/fitness_nutrition.dart';
import 'package:flutter/material.dart';
import 'package:food_input/food_input.dart';
import 'package:food_report/food_report.dart';
import 'package:local_storage/local_storage.dart';
import 'package:payment_repository/payment.dart';
import 'package:profile/profile.dart';
import 'package:remote_api/remote_api.dart';
import 'package:tandorost_components/tandorost_components.dart';
import 'package:image_repository/image_repository.dart';
import 'package:tandorost_platform_ui_app/navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final remote_api = RemoteApi(
  //   get_user_language: () => Future.value(Language.english),
  //   get_access_token:
  //       () => Future.value(
  //         'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwOTIxMjgwNTIzMCIsInVzZXJfaWQiOiIxMjBjZmY1Mi03YTVjLTRhOTYtOWJjMC1mZjQ1MTVjYTkwZmEiLCJleHAiOjE3NDcxNDYwMTl9.cbFxpHvjqsql-i5LP9No6MXbsOvI0ukOnAMl93lWwys',
  //       ),
  // );
  final sharePref = await SharedPreferences.getInstance();

  runApp(DependencyManager(sharedPreferences: sharePref));
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
    remoteApi.accessTokenProvider = authenticationRep.accessTokenProvider;
    remoteApi.userLanguageProvider = profileRep.userLanguage;

    final foodInputRep = FoodInputRepository(remoteApi: remoteApi);

    final paymentRep = PaymentRepository(remoteApi: remoteApi);

    final imageRepository = ImageRepository(remoteApi: remoteApi);
    final fitnessNutrition = FitnessNutrition(remoteApi: remoteApi);
    final foodReport = FoodReport(remoteApi: remoteApi);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => foodInputRep,
          dispose: (value) async => await value.dispose(),
          lazy: true,
        ),
        RepositoryProvider(create: (_) => profileRep, lazy: true),
        RepositoryProvider(create: (_) => authenticationRep, lazy: true),
        RepositoryProvider(create: (_) => imageRepository, lazy: true),
        RepositoryProvider(create: (_) => fitnessNutrition, lazy: true),
        RepositoryProvider(create: (_) => foodReport, lazy: true),
        RepositoryProvider(create: (_) => paymentRep, lazy: true),
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
          create:
              (context) => UserAccountCubit(
                imageRepository: RepositoryProvider.of<ImageRepository>(
                  context,
                ),
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
    return LayoutBuilder(
      builder: (context, constraints) {
        return MaterialApp.router(
          theme:
              AppTheme(
                locale: const Locale('fa'),
                screenWidth: constraints.maxWidth,
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
      },
    );
  }
}
