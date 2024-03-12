import 'package:flutter/material.dart';

import '../../../../utils/constants/widget_const.dart';

class CustomAlertDialog extends StatelessWidget {
  final Widget? icon;
  final String? title;
  final String? content;
  final List<Widget> actions;

  const CustomAlertDialog({
    super.key,
    this.icon,
    this.title,
    this.content,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: WidgetPadding.paddingL,
            left: WidgetPadding.paddingL,
            right: WidgetPadding.paddingL,
            bottom: WidgetPadding.paddingS,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // icon
              if (icon != null) icon ?? Container(),
              if (icon != null) const SizedBox(height: WidgetMargin.marginM),

              // title
              if (title != null)
                Text(
                  title ?? '',
                  style: theme.textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              if (title != null) const SizedBox(height: WidgetMargin.marginS),

              // content
              if (content != null)
                Text(
                  content ?? '',
                  style: theme.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              if (content != null) const SizedBox(height: WidgetMargin.marginM),

              // button actions
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: actions,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
