import 'package:flutter/material.dart';

import '../enums/enums.dart';

class AppDefaults {
  // AppDefaults._();

  // * URLS
  static String defaultLanguageString = LanguageCode.en.name;
  static LanguageCode defaultLanguageEnum = LanguageCode.en;
  static String defaultThemeString = ThemeMode.system.name;
  static ThemeMode defaultThemeEnum = ThemeMode.system;

  // * Push notif
  static int defaultReminderTimeInt = 21;
  static DateTime get defaultReminderTime {
    final now = DateTime.now();
    //  9:00 PM
    return DateTime(now.year, now.month, now.day, defaultReminderTimeInt, 0);
  }
}
