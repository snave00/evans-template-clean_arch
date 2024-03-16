import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../utils/constants/widget_const.dart';
import 'bouncing_button.dart';

class AddToCartIconButton extends StatelessWidget {
  final void Function()? onTap;

  const AddToCartIconButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BouncingButton(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.2),
              offset: const Offset(3, 3),
              blurRadius: 3,
            ),
          ],
        ),
        padding: const EdgeInsets.all(WidgetPadding.padding10),
        child: FaIcon(
          FontAwesomeIcons.plus,
          color: theme.colorScheme.onPrimary,
          size: WidgetSize.s16,
        ),
      ),
    );
  }
}
