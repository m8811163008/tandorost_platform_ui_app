import 'package:flutter/material.dart';
import 'package:tandorost_platform_ui_app/navigation.dart';
import 'package:tandorost_theme/tandorost_theme.dart';
import 'package:tandorost_components/tandorost_components.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final remote_api = RemoteApi(
  //   get_user_language: () => Future.value(Language.english),
  //   get_access_token:
  //       () => Future.value(
  //         'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwOTIxMjgwNTIzMCIsInVzZXJfaWQiOiIxMjBjZmY1Mi03YTVjLTRhOTYtOWJjMC1mZjQ1MTVjYTkwZmEiLCJleHAiOjE3NDcxNDYwMTl9.cbFxpHvjqsql-i5LP9No6MXbsOvI0ukOnAMl93lWwys',
  //       ),
  // );

  runApp(TandorostPlatform());
}

class TandorostPlatform extends StatelessWidget {
  const TandorostPlatform({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme(locale: Locale('fa')).lightTheme,
      routerConfig: Navigation.goRouter(context),
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        ComponentLibraryLocalizations.delegate,
      ],
      supportedLocales: const [Locale("fa")],
      locale: const Locale("fa"),
    );
  }
}
