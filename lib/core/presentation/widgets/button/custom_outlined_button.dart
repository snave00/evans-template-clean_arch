import 'package:flutter/material.dart';

import '../../../../utils/constants/widget_const.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressedCallback;
  final bool expanded;
  final bool useGreyOutline;
  final Widget child;

  const CustomOutlinedButton({
    super.key,
    required this.onPressedCallback,
    this.expanded = false,
    this.useGreyOutline = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressedCallback,
      style: OutlinedButton.styleFrom(
        minimumSize: expanded ? const Size.fromHeight(WidgetSize.s42) : null,
        side: useGreyOutline ? const BorderSide(color: Colors.grey) : null,
      ),
      child: child,
    );
  }
}
