import 'package:flutter/material.dart';

enum ThemeColor {
  secondary(Color(0xff631490)),
  onSecondary(Color(0xff9e6df7)),
  primary(Color(0xffCE2D4F)),
  onPrimary(Color(0xfff7f7f7)),
  tertiary(Colors.black);

  final Color color;
  const ThemeColor(this.color);
}
