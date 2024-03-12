import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressedCallback;
  final ButtonStyle? style;
  final Widget child;

  const CustomElevatedButton({
    super.key,
    required this.onPressedCallback,
    this.style,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressedCallback,
      style: style,
      child: child,
    );
  }
}
