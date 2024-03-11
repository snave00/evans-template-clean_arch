import '../logs/custom_log.dart';
import 'string_extension.dart';

extension DoubleExtenstion on double {
  // Format Amount double into 2 decimal places only
  double get formatTo2Decimal {
    try {
      double formattedDouble = toString().formatAmountString.convertToDouble;
      return formattedDouble;
    } catch (e) {
      Log.logError(runtimeType.toString(), 'formatTo2Decimal ${e.toString()}');
      return 0.0;
    }
  }
}
