import 'package:evans_template/core/application/widgets/icon/emoji_icon_widget.dart';
import 'package:evans_template/utils/constants/string_const.dart';
import 'package:evans_template/utils/constants/widget_const.dart';
import 'package:flutter/material.dart';

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
            const SizedBox(height: WidgetMargin.marginS),
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
