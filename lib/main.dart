import 'dart:html' as webFile;
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

import 'package:remote_api/remote_api.dart';

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
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      home: Center(),
    );
  }
}
