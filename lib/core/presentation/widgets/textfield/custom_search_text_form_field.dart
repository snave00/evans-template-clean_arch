import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../theme/app_theme.dart';
import '../../../../utils/constants/string_const.dart';
import '../../../../utils/constants/widget_const.dart';
import 'custom_text_form_field.dart';

class CustomSearchTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final void Function(String value)? onChanged;

  const CustomSearchTextFormField({
    super.key,
    this.controller,
    this.focusNode,
    this.onFieldSubmitted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomTextFormField(
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
            top: WidgetPadding.paddingM,
            left: WidgetPadding.paddingM,
          ),
          child: FaIcon(
            FontAwesomeIcons.magnifyingGlass,
            size: WidgetSize.s16,
            color: theme.colorScheme.onPrimaryContainer,
          ),
        ),
        hintText: StringConst.searchForDishes,
        hintStyle: AppTheme.getTextFormFieldHintStyle(theme: theme),
      ),
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
    );
  }
}
