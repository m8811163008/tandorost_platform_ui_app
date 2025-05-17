import 'package:flutter/material.dart';
import 'package:tandorost_theme/src/size_extension.dart';

extension BuildContextExtenstion on BuildContext {
  ThemeData get themeData => Theme.of(this);
  SizeExtenstion get sizeExtenstion => themeData.extension<SizeExtenstion>()!;
}
