import 'package:flutter/material.dart';

/// A class that represents the extension for defining sizes in a theme.
class ColorExtenstion extends ThemeExtension<ColorExtenstion> {
  final Color energy;
  final Color fat;
  final Color carbsFruitsVeggies;
  final Color carbsOther;
  final Color protein;

  const ColorExtenstion({
    this.energy = const Color(0xFF29A9E4), // Picton Blue
    this.fat = const Color(0xFF364156), // Charcoal
    this.carbsFruitsVeggies = const Color(0xFF4CAF50), // Pigment Green
    this.carbsOther = const Color(0xFF011638), // Oxford Blue
    this.protein = const Color(0xFF033990), // Oxford Blue 600
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
