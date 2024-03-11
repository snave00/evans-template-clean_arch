import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../theme/app_colors.dart';
import '../enums/enums.dart';
import '../constants/string_const.dart';
import '../logs/custom_log.dart';

extension StringExtension on String {
  String capitalize() {
    try {
      final capitalized =
          '${this[0].toUpperCase()}${substring(1).toLowerCase()}';

      return capitalized;
    } catch (e) {
      Log.logError(runtimeType.toString(), 'capitalize ${e.toString()}');
      return this;
    }
  }

  // Converts Hex String to Color
  Color get convertToColor {
    if (isEmpty) return AppColors.lightPrimary;
    int colorInt = int.parse(this, radix: 16);
    Color color = Color(colorInt);
    return color;
  }

  // Converts ThemeMode String to ThemeMode Enum
  ThemeMode get convertToThemeMode {
    return ThemeMode.values
        .firstWhere((e) => e.toString() == 'ThemeMode.$this');
  }

  // Converts LanguageCode String to LanguageCode Enum
  LanguageCode get convertToLanguageCode {
    return LanguageCode.values
        .firstWhere((e) => e.toString() == 'LanguageCode.$this');
  }

  // Converts Amount String to Double. (10,000.00 to 10000.00)
  double get convertToDouble {
    try {
      var stringAmount = replaceAll(',', '');
      double doubleAmount = double.parse(stringAmount);
      return doubleAmount;
    } catch (e) {
      Log.logError(runtimeType.toString(), 'convertToDouble ${e.toString()}');
      return 0.00;
    }
  }

  // Format Amount String with commas (10000.0 to 10,000.00)
  String get formatAmountString {
    try {
      var convertedAmountDouble = convertToDouble;
      var formatter = NumberFormat('#,##0.00');
      return formatter.format(convertedAmountDouble);
    } catch (e) {
      Log.logError(
          runtimeType.toString(), 'formatAmountString ${e.toString()}');
      return StringConst.zeroCurrency;
    }
  }

  // Converts String to DateTime
  DateTime get convertToDateTime {
    try {
      var parsedDate = DateTime.parse(this);
      return parsedDate;
    } catch (e) {
      Log.logError(runtimeType.toString(), 'convertToDateTime ${e.toString()}');
      return DateTime.now();
    }
  }
}
