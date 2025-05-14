import 'package:flutter/material.dart';
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

  runApp(TandorostPlatform());
}

class TandorostPlatform extends StatelessWidget {
  const TandorostPlatform({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.light(
        useMaterial3: true,
      ).copyWith(colorScheme: ColorScheme.fromSeed(
        seedColor: Color(0xff29A9E4),
        primary: Color(0xff29A9E4),
        secondary: Color(0xff011638),
        tertiary: Color(0xff4CAF50),
        onPrimary: Color(0xff364156),
        onSecondary: Color(0xffffffff),
      )),
      routerConfig: Navigation.goRouter(context),
    );
  }
}
