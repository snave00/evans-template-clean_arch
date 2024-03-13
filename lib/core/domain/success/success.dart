/// * You can edit the params based in success response?
/// * or as is since it's in domain layer and must not depend on response
class Success {
  Success({this.successMessage = ''});
  final String? successMessage;
}

// abstract class Success {
//   Success(this.successMessage);
//   final String successMessage;
// }

// use this if there are other type of success message
// class SuccessVariant2 extends Success {
//   SuccessVariant2(super.successMessage);
// }

// class SuccessVariant3 extends Success {
//   SuccessVariant3(super.successMessage);
// }
