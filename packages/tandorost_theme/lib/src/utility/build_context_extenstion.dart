import 'package:flutter/material.dart';
import 'package:tandorost_theme/src/color_extension.dart';
import 'package:tandorost_theme/src/size_extension.dart';

extension BuildContextExtenstion on BuildContext {
  ThemeData get themeData => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  SizeExtenstion get sizeExtenstion => themeData.extension<SizeExtenstion>()!;
  ColorExtenstion get colorExtenstion =>
      themeData.extension<ColorExtenstion>()!;
}
