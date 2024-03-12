import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../utils/constants/widget_const.dart';

class ChevronDownIconPicker extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  const ChevronDownIconPicker({
    super.key,
    this.padding = const EdgeInsets.all(WidgetPadding.paddingM),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: const FaIcon(
        FontAwesomeIcons.caretDown,
        size: WidgetSize.s16,
      ),
    );
  }
}
