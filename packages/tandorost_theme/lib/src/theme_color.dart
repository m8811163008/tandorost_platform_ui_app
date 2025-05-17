import 'package:flutter/material.dart';

enum ThemeColor {
  oxfordBlue(Color(0xff011638)),
  pictonBlue(Color(0xff29A9E4)),
  pigmentGreen(Color(0xff4CAF50)),
  charcoal(Color(0xff364156)),
  white(Colors.white);

  final Color color;
  const ThemeColor(this.color);
}
