import 'package:flutter/material.dart';

import '../../../../utils/constants/string_const.dart';
import '../../../../utils/constants/widget_const.dart';

class ViewAllButton extends StatelessWidget {
  final void Function()? onTap;

  const ViewAllButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(
        Radius.circular(WidgetBorderRadius.border12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: WidgetMargin.marginS,
          vertical: WidgetMargin.marginS,
        ),
        child: Text(
          StringConst.viewAll,
          style: theme.textTheme.bodySmall?.copyWith(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
