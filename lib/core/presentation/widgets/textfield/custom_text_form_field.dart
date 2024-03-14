import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../icon/chevron_down_icon.dart';
import '../spacing/spacing.dart';

class CustomTextFormField extends StatelessWidget {
  final String? title;
  final String? initialValue;
  final TextEditingController? controller;
  final InputDecoration? decoration;
  final TextStyle? style;
  final TextCapitalization textCapitalization;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String value)? onChanged;
  final bool autofocus;
  final bool readOnly;
  final bool obscureText;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;

  const CustomTextFormField({
    super.key,
    this.title,
    this.initialValue,
    this.controller,
    this.decoration,
    this.style,
    this.textCapitalization = TextCapitalization.sentences,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.autofocus = false,
    this.readOnly = false,
    this.obscureText = false,
    this.focusNode,
    this.onTap,
    this.onFieldSubmitted,
  });

  const CustomTextFormField.picker({
    super.key,
    this.title,
    this.initialValue,
    this.controller,
    this.decoration = const InputDecoration(
      suffixIcon: ChevronDownIconPicker(),
    ),
    this.style,
    this.textCapitalization = TextCapitalization.sentences,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.autofocus = false,
    this.readOnly = true,
    this.obscureText = false,
    this.focusNode,
    required this.onTap,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (title != null)
          Text(
            title ?? '',
            style: theme.textTheme.titleSmall,
          ),
        if (title != null) const Spacing.vertical(size: SpacingSize.s),
        TextFormField(
          initialValue: initialValue,
          controller: controller,
          decoration: decoration,
          style: style,
          textCapitalization: textCapitalization,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          inputFormatters: inputFormatters,
          validator: validator,
          onChanged: onChanged,
          autofocus: autofocus,
          readOnly: readOnly,
          obscureText: obscureText,
          focusNode: focusNode,
          onFieldSubmitted: onFieldSubmitted,
          onTap: onTap,
        ),
      ],
    );
  }
}
