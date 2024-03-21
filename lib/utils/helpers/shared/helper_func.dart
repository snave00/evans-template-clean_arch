import 'package:flutter/material.dart';

import '../../../core/presentation/widgets/progress/custom_circular_progress.dart';

// * Close keyboard or remove current focus node
void closeKeyboard() {
  // FocusScope.of(context).unfocus();
  FocusManager.instance.primaryFocus?.unfocus();
}

// * Shows a loading progress indicator dialog
Future<void> showProgressDialog({required BuildContext context}) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (ctx) {
      return const CustomCircularProgress(
        progressSize: ProgressSize.large,
      );
    },
  );
}

// * Shows an adaptive time picker for both Android & iOS
// Future<({TimeOfDay? timeOfDay, DateTime timeSeconds})> showAdaptiveTimePicker({
//   required BuildContext context,
//   required ThemeData theme,
//   required TimeOfDay initialTime,
// }) async {
//   TimeOfDay? adaptiveSelectedTime;
//   DateTime selectedTimeSeconds = DateTime.now(); // remove date, hour, minute

//   if (Platform.isIOS) {
//     // iOS
//     await showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(WidgetBorder.border20),
//         ),
//       ),
//       builder: (ctx) {
//         return DatePickerIosBottomSheet(
//           onDonePressed: () {
//             Navigator.pop(context);
//           },
//           child: CupertinoDatePicker(
//             mode: CupertinoDatePickerMode.time,
//             initialDateTime: initialTime.convertToDateTime,
//             onDateTimeChanged: (value) {
//               debugPrint('DADA: $value');
//               adaptiveSelectedTime = value.convertToTimeOfDay;
//               // remove date, hour, minute
//               selectedTimeSeconds = DateTime.now();
//             },
//           ),
//         );
//       },
//     );
//   } else {
//     // Android
//     final pickedTime = await showTimePicker(
//       context: context,
//       initialTime: initialTime,
//     );

//     adaptiveSelectedTime = pickedTime;
//     // remove date, hour, minute
//     selectedTimeSeconds = DateTime.now();
//   }

//   return (timeOfDay: adaptiveSelectedTime, timeSeconds: selectedTimeSeconds);
// }

// * Shows a Help dialog
// Future<void> showHelpDialog({
//   required BuildContext context,
//   String? title,
//   String? content,
// }) async {
//   await showDialog(
//     context: context,
//     builder: (ctx) {
//       return HelpDialog(
//         title: title,
//         content: content,
//       );
//     },
//   );
// }

// * Shows a delete warning dialog
// Future<void> showDeleteAlertDialog({
//   required BuildContext context,
//   String? title,
//   String? content,
//   required void Function(BuildContext dialogContext) onYesPressed,
// }) async {
//   await showDialog(
//     context: context,
//     builder: (builderContext) => DeleteAlertDialog(
//       title: title,
//       content: content,
//       onYesPressed: () {
//         onYesPressed(builderContext);
//       },
//     ),
//   );
// }

// * Shows a info alert dialog
// Future<void> showInfoAlertDialog({
//   required BuildContext context,
//   String? title,
//   String? content,
//   bool barrierDismissible = true,
//   bool showCloseButton = true,
// }) async {
//   await showDialog(
//     context: context,
//     barrierDismissible: barrierDismissible,
//     builder: (ctx) => InfoAlertDialog(
//       title: title,
//       content: content,
//       showCloseButton: showCloseButton,
//     ),
//   );
// }

// * Shows a general warning dialog
// Future<void> showWarningAlertDialog({
//   required BuildContext context,
//   String? title,
//   String? content,
//   String? positiveButtonText,
//   String? negativeButtonText,
//   required void Function()? onPositiveButtonPressed,
// }) async {
//   await showDialog(
//     context: context,
//     builder: (ctx) => WarningAlertDialog(
//       title: title,
//       content: content,
//       onPositiveButtonPressed: onPositiveButtonPressed,
//       positiveButtonText: positiveButtonText,
//       negativeButtonText: negativeButtonText,
//     ),
//   );
// }

// * Shows a loading progress indicator dialog
// Future<void> showAdaptiveErrorAlertDialog({
//   required BuildContext context,
//   required ThemeData theme,
//   String? title,
//   String? content,
// }) async {
//   if (Platform.isIOS) {
//     await showCupertinoDialog(
//       context: context,
//       barrierDismissible: true,
//       builder: (builderContext) {
//         return CupertinoAlertDialog(
//           title: Text(
//             title ?? StringConstants.oops,
//             style: theme.textTheme.titleSmall,
//           ),
//           content: (content != null)
//               ? Text(
//                   content,
//                   style: theme.textTheme.bodySmall,
//                 )
//               : null,
//           actions: [
//             CupertinoDialogAction(
//               child: Text(
//                 StringConstants.close,
//                 style: theme.textTheme.bodyMedium?.copyWith(
//                   color: Colors.blue,
//                 ),
//               ),
//               onPressed: () {
//                 // use builderCtx to avoid popping the parent page
//                 Navigator.pop(builderContext);
//               },
//             ),
//           ],
//         );
//       },
//     );
//   } else {
//     return await showDialog(
//       context: context,
//       builder: (builderContext) => AlertDialog(
//         title: Text(
//           title ?? StringConstants.oops,
//         ),
//         content: content != null ? Text(content) : null,
//         actions: [
//           CustomTextButton(
//             child: const Text(
//               StringConstants.close,
//             ),
//             onPressedCallback: () {
//               // use builderCtx to avoid popping the parent page
//               Navigator.pop(builderContext);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// * Shows a custom bottom sheet
// Future<T?> showCustomBottomSheet<T>({
//   required BuildContext context,
//   bool? expand,
//   double? initialChildSize,
//   double? maxChildSize,
//   bool? hasScrollBar,
//   bool useRootNavigator = false,
//   // * Put null if you don't want to make it draggable
//   required Widget Function(
//     ScrollController? scrollController,
//   ) scrollView,
// }) async {
//   return await showModalBottomSheet(
//     context: context,
//     useRootNavigator: useRootNavigator, // to show on top of bottom nav
//     isScrollControlled: true,
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(
//         top: Radius.circular(WidgetBorder.border20),
//       ),
//     ),
//     builder: (ctx) => CustomBottomSheet(
//       expand: expand,
//       initialChildSize: initialChildSize,
//       maxChildSize: maxChildSize,
//       hasScrollBar: hasScrollBar,
//       scrollView: scrollView,
//     ),
//   );
// }

// * Shows a custom list bottom sheet
// Future<T?> showCustomListBottomSheet<T>({
//   required BuildContext context,
//   bool? expand,
//   double? initialChildSize,
//   double? maxChildSize,
//   Widget? header,
//   bool isDraggable = true,
//   required Widget? Function(BuildContext ctx, int index) itemBuilder,
//   required int itemCount,
// }) async {
//   return await showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(WidgetBorder.border20),
//         ),
//       ),
//       builder: (ctx) {
//         return CustomListBottomSheet(
//           expand: expand,
//           initialChildSize: initialChildSize,
//           maxChildSize: maxChildSize,
//           header: header,
//           isDraggable: isDraggable,
//           itemBuilder: itemBuilder,
//           itemCount: itemCount,
//         );
//       });
// }

// * Shows a regular snack bar success or fail/error
void showSnackBar({
  required BuildContext context,
  required ThemeData theme,
  required String message,
  required bool isSuccess,
}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: isSuccess ? Colors.white : theme.colorScheme.onError,
          ),
        ),
        backgroundColor:
            isSuccess ? theme.colorScheme.primary : theme.colorScheme.error,
      ),
    );
}

// * Shows a custom snack bar success or fail/error
// void showCustomSnackBar({
//   required BuildContext context,
//   required bool isSuccess,
//   String? title,
//   String? subtitle,
// }) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: CustomSnackBarContent(
//         isSuccess: isSuccess,
//         title: title,
//         subtitle: subtitle,
//       ),
//       // behavior: SnackBarBehavior.floating,
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       duration: const Duration(seconds: 3),
//     ),
//   );
// }


