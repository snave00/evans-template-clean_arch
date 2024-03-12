import 'package:flutter/material.dart';

import '../../../../utils/constants/widget_const.dart';

class CustomFilledButtonTonal extends StatelessWidget {
  final VoidCallback? onPressedCallback;
  final bool expanded;
  final Widget child;

  const CustomFilledButtonTonal({
    super.key,
    required this.onPressedCallback,
    this.expanded = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: onPressedCallback,
      style: FilledButton.styleFrom(
        minimumSize: expanded ? const Size.fromHeight(WidgetSize.s48) : null,
      ),
      child: child,
    );
  }
}
