// official modules
import 'package:flutter/material.dart';

// color setting
class AppColors {
  static var colorScheme = const ColorScheme(
    primary: shrinePink400,
    secondary: shrinePink50,
    surface: shrineSurfaceWhite,
    background: shrineBackgroundWhite,
    error: shrineErrorRed,
    onPrimary: shrinePink100,
    onSecondary: shrinePink300,
    onSurface: shrineBrown900,
    onBackground: shrineBrown900,
    onError: shrineSurfaceWhite,
    brightness: Brightness.light,
  );
}

// constants
const Color shrinePink50 = Color(0xFFFEEAE6);
const Color shrinePink100 = Color(0xFFFEDBD0);
const Color shrinePink300 = Color(0xFFFBB8AC);
const Color shrinePink400 = Color(0xFFEAA4A4);
const Color shrineBrown900 = Color(0xFF442B2D);
const Color shrineBrown600 = Color(0xFF7D4F52);
const Color shrineErrorRed = Color(0xFFC5032B);
const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;
const defaultLetterSpacing = 0.03;
