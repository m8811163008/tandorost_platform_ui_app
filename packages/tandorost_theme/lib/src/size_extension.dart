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
  final double foodTilePieChartDimension;
  final double profileRadius;
  final double full;
  final Size chatButton;
  final Size appButton;

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
    this.profileRadius = 56,
    this.foodTilePieChartDimension = 80,
    this.chatButton = const Size.square(180),
    this.appButton = const Size.square(24),
  });

  @override
  ThemeExtension<SizeExtenstion> copyWith() {
    return SizeExtenstion();
  }

  @override
  ThemeExtension<SizeExtenstion> lerp(
    covariant ThemeExtension<SizeExtenstion>? other,
    double t,
  ) {
    if (other is! SizeExtenstion) {
      return this;
    }
    return SizeExtenstion();
  }
}
