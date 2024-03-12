import 'package:flutter/material.dart';

import '../../../../utils/constants/string_const.dart';
import '../button/custom_text_button.dart';
import 'custom_alert_dialog.dart';

class AreYouSureAlertDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final String? leftButtonText;
  final String? rightButtonText;
  final ButtonStyle? leftButtonstyle;
  final ButtonStyle? rightButtonstyle;
  final void Function()? onLeftButtonPressed;
  final void Function()? onRightButtonPressed;
  const AreYouSureAlertDialog({
    super.key,
    this.title,
    this.content,
    this.leftButtonText,
    this.rightButtonText,
    this.leftButtonstyle,
    this.rightButtonstyle,
    this.onLeftButtonPressed,
    this.onRightButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomAlertDialog(
      icon: Text(
        '🤔',
        style: theme.textTheme.headlineLarge,
      ),
      title: title ?? StringConst.areYouSure,
      content: content,
      actions: [
        Expanded(
          child: CustomTextButton(
            onPressedCallback: onLeftButtonPressed,
            style: leftButtonstyle ??
                TextButton.styleFrom(
                  foregroundColor: theme.textTheme.bodyMedium?.color,
                ),
            child: Text(leftButtonText ?? StringConst.yes),
          ),
        ),
        Expanded(
          child: CustomTextButton(
            onPressedCallback:
                onRightButtonPressed ?? () => Navigator.pop(context),
            style: rightButtonstyle ??
                TextButton.styleFrom(
                  foregroundColor: Colors.grey,
                ),
            child: Text(rightButtonText ?? StringConst.no),
          ),
        ),
      ],
    );
  }
}
