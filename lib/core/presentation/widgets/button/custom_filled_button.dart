import 'package:flutter/material.dart';

import '../../../../utils/constants/widget_const.dart';

class CustomFilledButton extends StatelessWidget {
  final VoidCallback? onPressedCallback;
  final bool expanded;
  final ButtonStyle? style;
  final Widget child;

  const CustomFilledButton({
    super.key,
    required this.onPressedCallback,
    this.expanded = false,
    this.style,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressedCallback,
      style: style ??
          FilledButton.styleFrom(
            minimumSize:
                expanded ? const Size.fromHeight(WidgetSize.s42) : null,
          ),
      child: child,
    );
  }
}
