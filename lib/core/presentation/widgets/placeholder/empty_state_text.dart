import 'package:flutter/material.dart';

import '../../../../utils/constants/string_const.dart';
import '../../../../utils/constants/widget_const.dart';
import '../icon/emoji_icon_widget.dart';
import '../spacing/spacing.dart';

class EmptyStateText extends StatelessWidget {
  final Widget? emptyStateIcon;
  final String emptyStateText;

  const EmptyStateText({
    super.key,
    this.emptyStateIcon,
    required this.emptyStateText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(WidgetPadding.paddingS),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            emptyStateIcon ?? _buildDefaultIcon(theme: theme),
            const Spacing.vertical(size: SpacingSize.s),
            Text(
              emptyStateText,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDefaultIcon({required ThemeData theme}) {
    return const EmojiIconWidget(
      emoji: StringConst.emptyStateIcon,
      emojiSize: EmojiSize.medium,
    );
  }
}
