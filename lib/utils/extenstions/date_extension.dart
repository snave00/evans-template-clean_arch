import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../logs/custom_log.dart';

extension DateTimeExtension on DateTime {
  // Format DateTime to Formatted String using intl package
  // Converts to February/Pebrero 01, 2023 depending on Locale
  // TODO: display date depending on locale
  String get formatDate {
    try {
      final formatted = DateFormat.yMMMMd().format(this);
      return formatted;
    } catch (e) {
      Log.logError(runtimeType.toString(), 'formatDate ${e.toString()}');
      return '';
    }
  }

  // Format DateTime to Formatted String using intl package
  // Converts to February/Pebrero 01 depending on Locale
  String get formatDateWithoutYear {
    try {
      // final locale = UserDataBox.getUserData()?.userSettings?.language;
      final formatted = DateFormat.MMMMd().format(this);
      return formatted;
    } catch (e) {
      Log.logError(
          runtimeType.toString(), 'formatDateWithoutYear ${e.toString()}');
      return '';
    }
  }

  // Format DateTime to Formatted String using intl package
  // Converts to February/Pebrero 01 depending on Locale
  String get formatDateShortMonthWithoutYear {
    try {
      // final locale = UserDataBox.getUserData()?.userSettings?.language;
      final formatted = DateFormat.MMMd().format(this);
      return formatted;
    } catch (e) {
      Log.logError(runtimeType.toString(),
          'formatDateShortMonthWithoutYear ${e.toString()}');
      return '';
    }
  }

  String get formatDateMonthOnly {
    try {
      final formatted = DateFormat.yMMMM().format(this);
      return formatted;
    } catch (e) {
      Log.logError(
          runtimeType.toString(), 'formatDateMonthOnly ${e.toString()}');
      return '';
    }
  }

  String get formatDateMonthDay {
    try {
      // sample: December 01
      final formatted = DateFormat.MMMMd().format(this);
      return formatted;
    } catch (e) {
      Log.logError(
          runtimeType.toString(), 'formatDateMonthDay ${e.toString()}');
      return '';
    }
  }

  String get formatDateMontShortDay {
    try {
      // sample: Dec 01
      final formatted = DateFormat.MMMd().format(this);
      return formatted;
    } catch (e) {
      Log.logError(
          runtimeType.toString(), 'formatDateMontShortDay ${e.toString()}');
      return '';
    }
  }

  String get formatDateMonthYearShort {
    try {
      // sample: December 2023
      final formatted = DateFormat.yMMMM().format(this);
      return formatted;
    } catch (e) {
      Log.logError(
          runtimeType.toString(), 'formatDateMonthYearShort ${e.toString()}');
      return '';
    }
  }

  String get formatDateYearOnly {
    try {
      // sample: 2023
      final formatted = DateFormat.y().format(this);
      return formatted;
    } catch (e) {
      Log.logError(
          runtimeType.toString(), 'formatDateYearOnly ${e.toString()}');
      return '';
    }
  }

  DateTime get removeTime {
    try {
      var date = DateTime(year, month, day);
      return date;
    } catch (e) {
      Log.logError(runtimeType.toString(), 'removeTime ${e.toString()}');
      return DateTime.now();
    }
  }

  DateTime get safeEndDate {
    try {
      // to make sure that end date is at 11:59PM end day
      // so it can get the correct less .transactionDateTimeLessThan(endDate)
      var safeEndDate = removeTime;
      safeEndDate = safeEndDate.add(
        const Duration(
          hours: 23,
          minutes: 59,
          seconds: 59,
        ),
      );
      return safeEndDate;
    } catch (e) {
      Log.logError(runtimeType.toString(), 'safeEndDate ${e.toString()}');
      return DateTime.now();
    }
  }

  // Gets the first day of the given year
  DateTime get firstDayOfYear {
    try {
      final currentDate = this;

      DateTime firstDayOfYear = DateTime(currentDate.year, 1, 1);

      return firstDayOfYear.removeTime;
    } catch (e) {
      Log.logError(runtimeType.toString(), 'firstDayOfYear ${e.toString()}');
      return DateTime.now();
    }
  }

  // Gets the last day of the given year
  DateTime get lastDayOfYear {
    try {
      final currentDate = this;
      DateTime lastDayOfYear = DateTime(currentDate.year, 12, 31);

      return lastDayOfYear.removeTime;
    } catch (e) {
      Log.logError(runtimeType.toString(), 'lastDayOfYear ${e.toString()}');
      return DateTime.now();
    }
  }

  // Gets the first day of the given month
  DateTime get firstDayOfMonth {
    try {
      final currentDate = this;
      final firstDayOfCurrentMonth =
          DateTime(currentDate.year, currentDate.month, 1);
      return firstDayOfCurrentMonth.removeTime;
    } catch (e) {
      Log.logError(runtimeType.toString(), 'firstDayOfMonth ${e.toString()}');
      return DateTime.now();
    }
  }

  // Gets the last day of the given month
  DateTime get lastDayOfMonth {
    try {
      final currentDate = this;
      final lastDayOfCurrentMonth =
          DateTime(currentDate.year, currentDate.month + 1, 0);
      return lastDayOfCurrentMonth.removeTime;
    } catch (e) {
      Log.logError(runtimeType.toString(), 'firstDayOfMonth ${e.toString()}');
      return DateTime.now();
    }
  }

  // Adds n year to current date.
  DateTime addYear(int plusYear) {
    try {
      DateTime newYear = DateTime(
        year + plusYear,
      );
      return newYear;
    } catch (e) {
      Log.logError(runtimeType.toString(), 'addYear ${e.toString()}');
      return DateTime.now();
    }
  }

  // Adds n month to current date.
  DateTime addMonth(int plusMonth) {
    try {
      DateTime newMonth = DateTime(year, month + plusMonth, day);
      return newMonth;
    } catch (e) {
      Log.logError(runtimeType.toString(), 'addMonth ${e.toString()}');
      return DateTime.now();
    }
  }

  // Adds n week to current date. 1 week == 7 days
  DateTime addWeek(int plusWeek) {
    try {
      return add(Duration(days: plusWeek * 7));
    } catch (e) {
      Log.logError(runtimeType.toString(), 'addWeek ${e.toString()}');
      return DateTime.now();
    }
  }

  // Subtracts n week to current date. 1 week == 7 days
  DateTime subtractWeek(int plusWeek) {
    try {
      return subtract(Duration(days: plusWeek * 7));
    } catch (e) {
      Log.logError(runtimeType.toString(), 'subtractWeek ${e.toString()}');
      return DateTime.now();
    }
  }

  TimeOfDay get convertToTimeOfDay {
    try {
      final converted = TimeOfDay.fromDateTime(this);
      return converted;
    } catch (e) {
      Log.logError(runtimeType.toString(), 'convertToDateTime ${e.toString()}');
      return TimeOfDay.now();
    }
  }
}
