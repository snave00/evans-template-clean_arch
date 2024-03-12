import '../../../utils/constants/error_const.dart';

/// * Put customized error message here
class NetworkException implements Exception {
  @override
  String toString() {
    return ErrorConst.networkGeneralErrorMessage;
  }
}
