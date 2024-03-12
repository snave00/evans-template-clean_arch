import 'package:flutter/material.dart';

class CustomOutlinedButtonIcon extends StatelessWidget {
  final VoidCallback? onPressedCallback;
  final ButtonStyle? style;
  final Widget icon;
  final Widget label;

  const CustomOutlinedButtonIcon({
    super.key,
    required this.onPressedCallback,
    this.style,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressedCallback,
      style: style,
      icon: icon,
      label: label,
    );
  }
}
