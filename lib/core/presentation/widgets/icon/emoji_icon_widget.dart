import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../utils/constants/widget_const.dart';

enum EmojiSize {
  small,
  medium,
  large,
  xlarge,
  xxlarge,
}

class EmojiIconWidget extends StatelessWidget {
  final String emoji;
  final EmojiSize emojiSize;
  const EmojiIconWidget({
    super.key,
    required this.emoji,
    required this.emojiSize,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (Platform.isAndroid) {
      return Text(
        emoji,
        textAlign: TextAlign.center,
        // display large is using noto color emoji font
        style: theme.textTheme.displayLarge?.copyWith(
          fontSize: _getEmojiSize(),
        ),
      );
    }

    // iOS and others
    return Text(
      emoji,
      textAlign: TextAlign.center,
      style: theme.textTheme.headlineMedium?.copyWith(
        fontSize: _getEmojiSize(),
      ),
    );
  }

  double _getEmojiSize() {
    switch (emojiSize) {
      case EmojiSize.small:
        // sized like chart emoji icons
        return WidgetSize.s16;
      case EmojiSize.medium:
        // sized like txn emoji and budget items
        return WidgetSize.s24;
      case EmojiSize.large:
        // sized like txn emoji and budget items
        return WidgetSize.s26;
      case EmojiSize.xlarge:
        // sized like add/update/show categories bottom sheet
        return WidgetSize.s28;
      case EmojiSize.xxlarge:
        // sized like budget detail emoji
        return WidgetSize.s32;
    }
  }
}
