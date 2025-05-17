import 'dart:ui';

import 'package:flutter/material.dart';

/// A class that represents the extension for defining sizes in a theme.
class SizeExtenstion extends ThemeExtension<SizeExtenstion> {
  final double none;
  final double extraSmall;
  final double small;
  final double medium;
  final double large;
  final double extraLarge;
  final double xExtraLarge;
  final double full;
  final Size chatButton;

  /// Creates a [SizeExtenstion] with the specified sizes.
  const SizeExtenstion({
    this.none = 0,
    this.extraSmall = 4,
    this.small = 8,
    this.medium = 16,
    this.large = 24,
    this.extraLarge = 32,
    this.full = double.infinity,
    this.xExtraLarge = 40,
    this.chatButton = const Size.square(180),
  });

  @override
  ThemeExtension<SizeExtenstion> copyWith({
    double? none,
    double? extraSmall,
    double? small,
    double? medium,
    double? large,
    double? extraLarge,
    double? xExtraLarge,
    double? full,
  }) {
    return SizeExtenstion(
      none: none ?? this.none,
      extraSmall: extraSmall ?? this.extraSmall,
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
      extraLarge: extraLarge ?? this.extraLarge,
      xExtraLarge: xExtraLarge ?? this.xExtraLarge,
      full: full ?? this.full,
    );
  }

  @override
  ThemeExtension<SizeExtenstion> lerp(
    covariant ThemeExtension<SizeExtenstion>? other,
    double t,
  ) {
    if (other is! SizeExtenstion) {
      return this;
    }
    return SizeExtenstion(
      none: lerpDouble(none, other.none, t)!,
      extraSmall: lerpDouble(extraSmall, other.extraSmall, t)!,
      small: lerpDouble(small, other.small, t)!,
      medium: lerpDouble(medium, other.medium, t)!,
      large: lerpDouble(large, other.large, t)!,
      extraLarge: lerpDouble(extraLarge, other.extraLarge, t)!,
      xExtraLarge: lerpDouble(xExtraLarge, other.xExtraLarge, t)!,
      full: lerpDouble(full, other.full, t)!,
    );
  }
}
