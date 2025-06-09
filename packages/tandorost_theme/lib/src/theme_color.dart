import 'package:flutter/material.dart';

enum ThemeColor {
  tekhelet(Color(0xff631490)),
  mediumSlateBlue(Color(0xff9e6df7)),
  russianViolet(Color(0xff2e0549)),
  seasalt(Color(0xfff7f7f7)),
  black(Colors.black);

  final Color color;
  const ThemeColor(this.color);
}
