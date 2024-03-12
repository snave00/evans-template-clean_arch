import 'package:flutter/material.dart';

import '../enums/enums.dart';

class AppDefaults {
  // AppDefaults._();

  // * URLS
  static String websiteLink = 'https://moneyfestapp.com/';
  static String privacyPolicyLink = 'https://moneyfestapp.com/privacy-policy/';
  static String termsOfUseLink = 'https://moneyfestapp.com/tos/';
  static String twitterLink = 'https://twitter.com/moneyfestapp';
  static String facebookPageLink =
      'https://www.facebook.com/profile.php?id=100090064077501';
  static String facebookGroupLink =
      'https://www.facebook.com/groups/962936981483384';
  static String whatsNewLink = 'https://moneyfestapp.com/whats-new/';

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
