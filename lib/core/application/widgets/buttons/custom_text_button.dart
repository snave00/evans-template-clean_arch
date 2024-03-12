import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback? onPressedCallback;
  final ButtonStyle? style;
  final Widget child;

  const CustomTextButton({
    super.key,
    required this.onPressedCallback,
    this.style,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressedCallback,
      style: style,
      child: child,
    );
  }
}
