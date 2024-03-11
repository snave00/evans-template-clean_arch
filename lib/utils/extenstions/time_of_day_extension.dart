import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../logs/custom_log.dart';

extension TimeOfDayExtension on TimeOfDay {
  // TODO: display date depending on locale
  String get formatTime {
    try {
      // date time now just serves as dummy holder. we will not use the date
      final now = DateTime.now();
      final formatted = DateFormat.jm().format(
        DateTime(
          now.year,
          now.month,
          now.day,
          hour,
          minute,
        ),
      );

      return formatted;
    } catch (e) {
      Log.logError(runtimeType.toString(), 'formatTime ${e.toString()}');
      return '';
    }
  }

  DateTime get convertToDateTime {
    try {
      // date time now just serves as dummy holder. we will not use the date
      final now = DateTime.now();
      final converted = DateTime(
        now.year,
        now.month,
        now.day,
        hour,
        minute,
      );

      return converted;
    } catch (e) {
      Log.logError(runtimeType.toString(), 'convertToDateTime ${e.toString()}');
      return DateTime.now();
    }
  }
}
