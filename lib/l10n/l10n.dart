import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../utils/enums/enums.dart';
import '../utils/extenstions/string_extension.dart';

class L10n {
  L10n._();

  static final all = [
    Locale(LanguageCode.en.name),
    Locale(LanguageCode.fil.name),
    Locale(LanguageCode.de.name),
  ];

  static String getFlag(String languageCode) {
    switch (languageCode.convertToLanguageCode) {
      case LanguageCode.fil:
        return '🇵🇭';
      case LanguageCode.de:
        return '🇩🇪';
      case LanguageCode.en:
      default:
        return '🇺🇸';
    }
  }

  static Iterable<LocalizationsDelegate<dynamic>>? setLocalizationDelegate() {
    return const [
      // The auto generated file
      AppLocalizations.delegate,
      // Will put all translations of Material & Cupertino
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      // Will write text if it's on left/right side depending on country
      GlobalWidgetsLocalizations.delegate,
    ];
  }

  static Locale? Function(Locale?, Iterable<Locale>)?
      setLocaleResolutionCallback() {
    return (currentLocal, supportedLocales) {
      for (var locale in supportedLocales) {
        if (currentLocal != null &&
            currentLocal.languageCode == locale.languageCode) {
          return currentLocal;
        }
      }
      return supportedLocales.first;
    };
  }
}
