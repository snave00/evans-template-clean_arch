import 'package:flutter/material.dart';

import '../../../../../core/presentation/widgets/spacing/spacing.dart';
import '../../../../../utils/constants/widget_const.dart';

class HomeBalanceContainer extends StatelessWidget {
  final String title;
  final String amount;
  final Widget? icon;

  const HomeBalanceContainer({
    super.key,
    required this.title,
    required this.amount,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(
            WidgetBorderRadius.border12,
          ),
        ),
        padding: const EdgeInsets.all(
          WidgetPadding.padding10,
        ),
        child: Row(
          children: [
            _buildLabel(theme),
            icon ?? Container(),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(ThemeData theme) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: theme.textTheme.bodyMedium,
          ),
          const Spacing.vertical(size: SpacingSize.s),
          Text(
            amount,
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
