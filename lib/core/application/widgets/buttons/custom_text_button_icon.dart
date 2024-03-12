import 'package:flutter/material.dart';

class CustomTextButtonIcon extends StatelessWidget {
  final VoidCallback? onPressedCallback;
  final ButtonStyle? style;
  final Widget icon;
  final Widget label;

  const CustomTextButtonIcon({
    super.key,
    required this.onPressedCallback,
    this.style,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressedCallback,
      style: style,
      icon: icon,
      label: label,
    );
  }
}
