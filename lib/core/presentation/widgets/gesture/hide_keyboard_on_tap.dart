import 'package:flutter/material.dart';

// * Hides keyboard when tapped outside
class HideKeyboardOnTap extends StatelessWidget {
  final Widget child;
  const HideKeyboardOnTap({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        return FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}
