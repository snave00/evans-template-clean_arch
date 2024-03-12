// import 'package:firebase_auth/firebase_auth.dart';

// import '../../../utils/constants/error_constants.dart';

// class MapFirebaseAuthError {
//   final FirebaseAuthException firebaseAuthException;
//   MapFirebaseAuthError({
//     required this.firebaseAuthException,
//   });

//   @override
//   String toString() {
//     switch (firebaseAuthException.code) {
//       case 'email-already-in-use':
//         return ErrorConstants.emailAlreadyInUse;
//       case 'network-request-failed':
//         return ErrorConstants.networkGeneralErrorMessage;
//       case 'invalid-email':
//         return ErrorConstants.inValidEmail;
//       case 'user-not-found':
//         return ErrorConstants.userNotFound;
//       case 'too-many-requests':
//         return ErrorConstants.tooManyRequest;
//       default:
//         return firebaseAuthException.message ??
//             ErrorConstants.firebaseGeneralErrorMessage;
//     }
//   }
// }
