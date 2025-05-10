import 'dart:html' as webFile;
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

import 'package:remote_api/remote_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final remote_api = RemoteApi(
    get_user_language: () => Future.value(Language.english),
    get_access_token:
        () => Future.value(
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwOTIxMjgwNTIzMCIsInVzZXJfaWQiOiJkMDVjMTFkOS0wYmUxLTQ2Y2EtYmUzMy04MWQ5NWE5MzIzMzAiLCJleHAiOjE3NDY4Nzk4MTF9.J-suZ6xKHU1F9uZux_sSTU4w_E1HNE5Z-kZDnpOeaDg',
        ),
  );
}