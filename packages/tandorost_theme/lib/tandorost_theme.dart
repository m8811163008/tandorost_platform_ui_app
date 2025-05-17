import 'package:flutter/material.dart';

class AppTheme {
  static const Color oxfordBlue = Color(0xff011638);
  static const Color pictonBlue = Color(0xff29A9E4);
  static const Color pigmentGreen = Color(0xff4CAF50);
  static const Color charcoal = Color(0xff364156);
  static const Color white = Color(0xffffffff);
  ThemeData get light_theme => ThemeData.light(useMaterial3: true).copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: pictonBlue,
      primary: pictonBlue,
      secondary: oxfordBlue,
      tertiary: pigmentGreen,
      onPrimary: charcoal,
      onSecondary: white,
    ),
  );
}

