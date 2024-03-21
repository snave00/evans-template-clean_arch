import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants/widget_const.dart';
import 'app_color_scheme.dart';
import 'app_textstyle.dart';

/// * Centralized App's Theme
class AppTheme {
  AppTheme._();

  static ThemeData buildTheme(brightness) {
    var baseTheme = ThemeData(
      brightness: brightness,
      colorScheme: _isDarkMode(brightness) ? darkColorScheme : lightColorScheme,
      // colorSchemeSeed: Colors.blue,
      pageTransitionsTheme: pageTransitionsTheme,
    );

    var nunitoTextTheme = GoogleFonts.nunitoTextTheme(
      baseTheme.textTheme.copyWith(
        headlineLarge: AppTextStyle.getCustomHeadlineLarge(baseTheme),
        titleLarge: AppTextStyle.getCustomTitleLarge(baseTheme),
        titleMedium: AppTextStyle.getCustomTitleMedium(baseTheme),
        titleSmall: AppTextStyle.getCustomTitleSmall(baseTheme),
      ),
    );

    return baseTheme.copyWith(
      // text theme
      textTheme: _setTextTheme(mainTextTheme: nunitoTextTheme),

      // appbar theme
      appBarTheme: _setAppBarTheme(
        baseTheme: baseTheme,
        mainTextTheme: nunitoTextTheme,
      ),

      // filled button theme
      filledButtonTheme: _setFilledButtonTheme(mainTextTheme: nunitoTextTheme),

      // outlined button theme
      outlinedButtonTheme: _setOutlinedButtonTheme(
        baseTheme: baseTheme,
        mainTextTheme: nunitoTextTheme,
      ),

      // text button theme
      textButtonTheme: _setTextButtonTheme(baseTheme: baseTheme),

      // text field / text form field
      inputDecorationTheme: _setInputDecorationTheme(baseTheme: baseTheme),

      timePickerTheme: _setTimePickerTheme(
        baseTheme: baseTheme,
        mainTextTheme: nunitoTextTheme,
      ),

      dividerColor: baseTheme.colorScheme.surfaceVariant,
    );
  }

  static bool _isDarkMode(Brightness brightness) =>
      brightness == Brightness.dark;

  static getTextFormFieldHintStyle({required ThemeData theme}) {
    return theme.textTheme.bodyMedium?.copyWith(
      color: Colors.grey,
    );
  }

  static const pageTransitionsTheme = PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      // TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
      // TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  );

  static TextTheme? _setTextTheme({required TextTheme mainTextTheme}) {
    var notoColorEmojiTextTheme = GoogleFonts.notoColorEmoji();
    return mainTextTheme.copyWith(
      // use this displayLarge for emojis text font only
      // para mas madali icall for setting a text theme
      displayLarge: notoColorEmojiTextTheme,
    );
  }

  static AppBarTheme? _setAppBarTheme({
    required ThemeData baseTheme,
    required TextTheme mainTextTheme,
  }) {
    return baseTheme.appBarTheme.copyWith(
      centerTitle: false,
      titleTextStyle: mainTextTheme.titleSmall,
    );
  }

  static FilledButtonThemeData? _setFilledButtonTheme({
    required TextTheme mainTextTheme,
  }) {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        fixedSize: const Size.fromHeight(WidgetSize.s42),
        textStyle: mainTextTheme.titleSmall,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(WidgetBorderRadius.border12),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: WidgetPadding.padding10,
          horizontal: WidgetPadding.paddingL,
        ),
      ),
    );
  }

  static OutlinedButtonThemeData? _setOutlinedButtonTheme({
    required ThemeData baseTheme,
    required TextTheme mainTextTheme,
  }) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        fixedSize: const Size.fromHeight(WidgetSize.s42),
        textStyle: mainTextTheme.titleSmall,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(WidgetBorderRadius.border12),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: WidgetPadding.padding10,
          horizontal: WidgetPadding.paddingL,
        ),
        side: BorderSide(
          width: WidgetBorderWidth.borderWidth1,
          color: baseTheme.colorScheme.primary,
        ),
      ),
    );
  }

  static TextButtonThemeData? _setTextButtonTheme({
    required ThemeData baseTheme,
  }) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        fixedSize: const Size.fromHeight(WidgetSize.s42),
        // textStyle: nunitoTextTheme.titleSmall,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(WidgetBorderRadius.border12),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: WidgetPadding.padding10,
          horizontal: WidgetPadding.paddingL,
        ),
      ),
    );
  }

  static InputDecorationTheme? _setInputDecorationTheme({
    required ThemeData baseTheme,
  }) {
    return InputDecorationTheme(
      filled: true,
      fillColor: baseTheme.colorScheme.surfaceVariant,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(WidgetBorderRadius.border12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(WidgetBorderRadius.border12),
        borderSide: BorderSide(
          color: baseTheme.colorScheme.primary,
        ),
      ),
      contentPadding: const EdgeInsets.all(
        WidgetPadding.paddingS,
      ),
    );
  }

  static TimePickerThemeData? _setTimePickerTheme({
    required ThemeData baseTheme,
    required TextTheme mainTextTheme,
  }) {
    return baseTheme.timePickerTheme.copyWith(
      hourMinuteTextStyle: mainTextTheme.headlineLarge,
    );
  }
}
