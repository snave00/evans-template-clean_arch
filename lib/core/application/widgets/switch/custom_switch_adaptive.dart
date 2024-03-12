import 'package:flutter/material.dart';

class CustomSwitchAdaptive extends StatelessWidget {
  final bool value;
  final void Function(bool value) onChanged;

  const CustomSwitchAdaptive({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: value,
      applyCupertinoTheme: true,
      onChanged: onChanged,
    );
  }
}
