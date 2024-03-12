import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../utils/constants/string_const.dart';
import '../button/custom_text_button.dart';
import 'custom_alert_dialog.dart';

class DeleteAlertDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final void Function()? onYesPressed;
  const DeleteAlertDialog({
    super.key,
    this.title,
    this.content,
    this.onYesPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomAlertDialog(
      icon: FaIcon(
        FontAwesomeIcons.triangleExclamation,
        color: theme.colorScheme.error,
      ),
      title: title,
      content: content,
      actions: [
        Expanded(
          child: CustomTextButton(
            onPressedCallback: onYesPressed,
            style: TextButton.styleFrom(
              foregroundColor: theme.colorScheme.error,
            ),
            child: const Text(StringConst.yes),
          ),
        ),
        Expanded(
          child: CustomTextButton(
            onPressedCallback: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              foregroundColor: theme.textTheme.bodyMedium?.color,
            ),
            child: const Text(StringConst.no),
          ),
        ),
      ],
    );
  }
}
