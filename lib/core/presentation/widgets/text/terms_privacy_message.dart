import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/string_const.dart';

class TermsPrivacyMessage extends StatelessWidget {
  const TermsPrivacyMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: StringConst.termsPrivacyMessage,
        style: theme.textTheme.labelSmall,
        children: <TextSpan>[
          TextSpan(
            text: StringConst.termsOfUse,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                // await LaunchUrlHelper.goToTermsOfUse();
              },
          ),
          const TextSpan(text: ' ${StringConst.and} '),
          TextSpan(
            text: StringConst.privacyPolicy,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                // await LaunchUrlHelper.goToPrivacyPolicy();
              },
          ),
        ],
      ),
    );
  }
}
