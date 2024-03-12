import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../utils/constants/string_const.dart';
import '../button/custom_text_button.dart';
import 'custom_alert_dialog.dart';

class InfoAlertDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final bool showCloseButton;
  const InfoAlertDialog({
    super.key,
    this.title,
    this.content,
    this.showCloseButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      icon: const FaIcon(
        FontAwesomeIcons.circleInfo,
      ),
      title: title,
      content: content,
      actions: [
        if (showCloseButton)
          CustomTextButton(
            onPressedCallback: () => Navigator.pop(context),
            child: const Text(StringConst.close),
          ),
      ],
    );
  }
}
