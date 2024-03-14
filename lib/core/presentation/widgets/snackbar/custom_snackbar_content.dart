import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../utils/constants/string_const.dart';
import '../../../../utils/constants/widget_const.dart';
import '../spacing/spacing.dart';

class CustomSnackBarContent extends StatelessWidget {
  final bool isSuccess;
  final String? title;
  final String? subtitle;
  const CustomSnackBarContent({
    super.key,
    required this.isSuccess,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: WidgetPadding.paddingM,
        vertical: WidgetPadding.paddingS,
      ),
      height: WidgetSize.s80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSuccess ? theme.colorScheme.primary : theme.colorScheme.error,
        borderRadius: const BorderRadius.all(
          Radius.circular(WidgetBorderRadius.border12),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FaIcon(
            isSuccess
                ? FontAwesomeIcons.solidCircleCheck
                : FontAwesomeIcons.solidCircleXmark,
            color: isSuccess
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.onError,
          ),
          const Spacing.horizontal(size: SpacingSize.m),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title ?? (isSuccess ? StringConst.success : StringConst.fail),
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: isSuccess
                        ? theme.colorScheme.onPrimary
                        : theme.colorScheme.onError,
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle ?? '',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: isSuccess
                          ? theme.colorScheme.onPrimary
                          : theme.colorScheme.onError,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
