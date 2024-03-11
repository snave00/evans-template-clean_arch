import '../enums/enums.dart';

class ErrorConst {
  // private constructor to prevent this class being instantiated
  // e.g. invoke `ErrorConstants()` accidentally
  ErrorConst._();

  // * UI Error Message
  static String uiErrorMessage = 'Something went wrong!';

  // * General Error Message
  static String generalErrorMessage =
      'We\'re sorry, but an unexpected error has occurred. Please try again later. [${ErrorCodes.g001.name}]';

  // * Cache Error Message
  static String cacheGeneralErrorMessage =
      'We\'re sorry, but it looks like there is an issue with the app\'s cache. Please try restarting the app and try again. [${ErrorCodes.c001.name}]';

  // * Network Error Message
  static String networkGeneralErrorMessage =
      'Please check your internet connection and try again. [${ErrorCodes.n001.name}]';

  static String networkGeneralErrorMessageNoCode =
      'Please check your internet connection and try again.';

  // * Server Error Message
  static const serverErrorMessage =
      'We\'re sorry, but we were unable to process your request at this time. Please try again later.';

  // * Platform Error Message
  static String platFormErrorMessage =
      'We\'re sorry, but an unexpected error has occurred. Please try again later. [${ErrorCodes.p001.name}]';
  static String platFormErrorMessageNoCode =
      'We\'re sorry, but an unexpected error has occurred. Please try again later.';

  // * Firebase General Error Message
  static const firebaseGeneralErrorMessage =
      'We\'re sorry, but we\'re unable to process your request. Please try again.';

  static String serverGeneralErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s001.name}]';
  static String server400ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s400.name}]';
  static String server401ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s401.name}]';
  static String server402ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s402.name}]';
  static String server403ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s403.name}]';
  static String server404ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s404.name}]';
  static String server405ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s405.name}]';
  static String server406ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s406.name}]';
  static String server407ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s407.name}]';
  static String server408ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s408.name}]';
  static String server409ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s409.name}]';
  static String server410ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s410.name}]';
  static String server411ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s411.name}]';
  static String server412ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s412.name}]';
  static String server413ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s413.name}]';
  static String server414ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s414.name}]';
  static String server415ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s415.name}]';
  static String server416ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s416.name}]';
  static String server417ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s417.name}]';
  static String server418ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s418.name}]';
  static String server419ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s419.name}]';
  static String server420ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s420.name}]';
  static String server421ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s421.name}]';
  static String server422ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s422.name}]';
  static String server423ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s423.name}]';
  static String server424ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s424.name}]';
  static String server426ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s426.name}]';
  static String server428ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s428.name}]';
  static String server429ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s429.name}]';
  static String server431ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s431.name}]';
  static String server500ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s500.name}]';
  static String server501ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s501.name}]';
  static String server502ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s502.name}]';
  static String server503ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s503.name}]';
  static String server504ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s504.name}]';
  static String server505ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s505.name}]';
  static String server506ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s506.name}]';
  static String server507ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s507.name}]';
  static String server508ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s508.name}]';
  static String server509ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s509.name}]';
  static String server510ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s510.name}]';
  static String server511ErrorMessage =
      '$serverErrorMessage\n[${ErrorCodes.s511.name}]';

  // * Firebase Error messages
  static String emailAlreadyInUse =
      'This email address is already associated with another account.';
  static String inValidEmail = 'Please enter a valid email address.';
  static String userNotFound = 'No user found for that email.';
  static String tooManyRequest =
      'Please wait a moment before trying again. We\'re preventing spam and ensuring a secure environment for our users.';

  // * User specific error messages
  static String premiumUsersOnly = 'This feature is for premium users only.';

  // * Data import export error
  static String fileNotValidIsar =
      'File not valid. It should be an ".isar" file';

  // not totally an error. user just cancels the action
  static String importCancelled = 'Import cancelled..';
  static String exportCancelled = 'Export cancelled..';

  // * RevenueCat / Paywall Error
  static String youDontHaveAnyActiveSubscription =
      'You don\'t have any active subscription';
  static String noPrevousPurchaseFound = 'No previous purchase found';
}
