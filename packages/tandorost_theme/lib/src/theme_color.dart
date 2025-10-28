import 'package:flutter/material.dart';

enum ThemeColor {
  // --- Primary Colors (The Beat) ---
  // The main brand color (Electric Blue feels like a good lead).
  primary(Color(0xFFEC1A85)), // Electric Blue: #007FFF

  // A striking, contrasting color for emphasis (Vivid Magenta).
  secondary(Color(0xFF9ACA42)),

  // An alternative, bright accent (Radiant Yellow).
  tertiary(Color(0xFFF7D72A)),

  // --- On Colors (Text/Icons on top of primary/secondary/etc.) ---
  // Text/Icons on top of the primary/secondary/accent colors.
  onColor(Color(0xffffffff)),

  // --- Background/Neutral Colors (The Space) ---
  // The main background color for a light theme (Cool Grey).
  surface(Color(0xFFF9FFFD)), // Cool Grey: #ED4730
  surfaceContainer(Color(0xffffffff)), // Cool Grey: #ED4730

  // A color for text or surfaces that need to stand out on the background (Deep Charcoal).
  onSurface(Color(0xFF262626));

  final Color color;
  const ThemeColor(this.color);
}
