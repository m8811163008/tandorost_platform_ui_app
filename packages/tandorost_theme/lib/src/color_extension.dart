import 'package:flutter/material.dart';

/// A class that represents the extension for defining sizes in a theme.
class ColorExtenstion extends ThemeExtension<ColorExtenstion> {
  final Color energy;
  final Color fat;
  final Color carbsFruitsVeggies;
  final Color carbsOther;
  final Color protein;

  const ColorExtenstion({
    this.energy = const Color(0xff2e0549), // russianViolet
    this.fat = const Color(0xff631490), // tekhelet
    this.carbsFruitsVeggies = const Color.fromARGB(
      206,
      15,
      172,
      1,
    ), // mediumSlateBlue
    this.carbsOther = const Color.fromARGB(255, 83, 45, 0), // black
    this.protein = const Color.fromARGB(255, 194, 8, 54), // seasalt
  });

  @override
  ColorExtenstion copyWith({
    Color? energy,
    Color? fat,
    Color? carbsFruitsVeggies,
    Color? carbsOther,
    Color? protein,
  }) {
    return ColorExtenstion(
      energy: energy ?? this.energy,
      fat: fat ?? this.fat,
      carbsFruitsVeggies: carbsFruitsVeggies ?? this.carbsFruitsVeggies,
      carbsOther: carbsOther ?? this.carbsOther,
      protein: protein ?? this.protein,
    );
  }

  @override
  ColorExtenstion lerp(
    covariant ThemeExtension<ColorExtenstion>? other,
    double t,
  ) {
    if (other is! ColorExtenstion) {
      return this;
    }
    return ColorExtenstion(
      energy: Color.lerp(energy, other.energy, t)!,
      fat: Color.lerp(fat, other.fat, t)!,
      carbsFruitsVeggies:
          Color.lerp(carbsFruitsVeggies, other.carbsFruitsVeggies, t)!,
      carbsOther: Color.lerp(carbsOther, other.carbsOther, t)!,
      protein: Color.lerp(protein, other.protein, t)!,
    );
  }
}
