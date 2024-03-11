import 'package:flutter/material.dart';

/// * Static textstyle that can be implemented across the app
class AppTextStyle {
  AppTextStyle._();

  static TextStyle? getCustomHeadlineLarge(ThemeData baseTheme) {
    return baseTheme.textTheme.headlineLarge?.copyWith(
      fontWeight: FontWeight.w800,
      fontSize: 32,
    );
  }

  static TextStyle? getCustomTitleLarge(ThemeData baseTheme) {
    return baseTheme.textTheme.titleLarge?.copyWith(
      fontWeight: FontWeight.w800,
      fontSize: 24,
    );
  }

  static TextStyle? getCustomTitleMedium(ThemeData baseTheme) {
    return baseTheme.textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.bold, // w700
      fontSize: 20,
    );
  }

  static TextStyle? getCustomTitleSmall(ThemeData baseTheme) {
    return baseTheme.textTheme.titleSmall?.copyWith(
      fontWeight: FontWeight.bold, // w700
      fontSize: 16,
    );
  }
}
