import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/constants/widget_const.dart';
import 'bouncing_button.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(WidgetPadding.paddingS),
      child: BouncingButton(
        onTap: () {
          // pop page
          context.pop();
        },
        child: Container(
          width: WidgetSize.s40,
          height: WidgetSize.s40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceVariant,
            borderRadius: const BorderRadius.all(
              Radius.circular(
                WidgetBorderRadius.border12,
              ),
            ),
          ),
          child: const FaIcon(
            FontAwesomeIcons.chevronLeft,
            size: WidgetSize.s16,
          ),
        ),
      ),
    );
  }
}
