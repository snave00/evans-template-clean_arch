import 'package:flutter/material.dart';

import 'app_colors.dart';

// ! If primary color was modified, make sure to change also the color -
// ! in flutter native splash in pubspec.yml
final lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.lightPrimary,
  onPrimary: const Color(0xFFE4F7F3),
  primaryContainer: const Color(0xFF6EFAD4),
  onPrimaryContainer: const Color(0xFF002019),
  secondary: const Color(0xFF4B635B),
  onSecondary: const Color(0xFFFFFFFF),
  secondaryContainer: const Color(0xFFCDE9DE),
  onSecondaryContainer: const Color(0xFF072019),
  tertiary: const Color(0xFF416276),
  onTertiary: const Color(0xFFFFFFFF),
  tertiaryContainer: const Color(0xFFC4E7FF),
  onTertiaryContainer: const Color(0xFF001E2D),
  error: const Color(0xFFBA1A1A),
  errorContainer: const Color(0xFFFFDAD6),
  onError: const Color(0xFFFFFFFF),
  onErrorContainer: const Color(0xFF410002),
  background: const Color(0xFFFBFDFA),
  onBackground: const Color(0xFF191C1B),
  surface: const Color(0xFFFBFDFA),
  onSurface: const Color(0xFF191C1B),
  surfaceVariant: AppColors.greyColor,
  onSurfaceVariant: const Color(0xFF3F4945),
  outline: const Color(0xFF6F7975),
  onInverseSurface: const Color(0xFFEFF1EE),
  inverseSurface: const Color(0xFF2E312F),
  inversePrimary: const Color(0xFF4CDDB9),
  shadow: const Color(0xFF000000),
  surfaceTint: const Color(0xFF006B56),
  outlineVariant: const Color(0xFFBFC9C4),
  scrim: const Color(0xFF000000),
);

final darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: AppColors.darkPrimary,
  onPrimary: const Color(0xFFE4F7F3),
  primaryContainer: const Color(0xFF005141),
  onPrimaryContainer: const Color(0xFF6EFAD4),
  secondary: const Color(0xFFB2CCC2),
  onSecondary: const Color(0xFF1D352E),
  secondaryContainer: const Color(0xFF344C44),
  onSecondaryContainer: const Color(0xFFCDE9DE),
  tertiary: const Color(0xFFA9CBE2),
  onTertiary: const Color(0xFF0E3446),
  tertiaryContainer: const Color(0xFF284B5E),
  onTertiaryContainer: const Color(0xFFC4E7FF),
  error: const Color(0xFFFFB4AB),
  errorContainer: const Color(0xFF93000A),
  onError: const Color(0xFF690005),
  onErrorContainer: const Color(0xFFFFDAD6),
  background: const Color(0xFF191C1B),
  onBackground: const Color(0xFFE1E3E0),
  surface: const Color(0xFF191C1B),
  onSurface: const Color(0xFFE1E3E0),
  surfaceVariant: const Color(0xFF303234),
  onSurfaceVariant: const Color(0xFFBFC9C4),
  outline: const Color(0xFF89938E),
  onInverseSurface: const Color(0xFF191C1B),
  inverseSurface: const Color(0xFFE1E3E0),
  inversePrimary: const Color(0xFF006B56),
  shadow: const Color(0xFF000000),
  surfaceTint: const Color(0xFF222325),
  outlineVariant: const Color(0xFF3F4945),
  scrim: const Color(0xFF000000),
);
