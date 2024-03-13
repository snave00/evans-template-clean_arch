import 'package:flutter/material.dart';

import '../../../../utils/constants/string_const.dart';
import '../../../../utils/constants/widget_const.dart';

class ProLabel extends StatelessWidget {
  const ProLabel({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(WidgetBorderRadius.borderS),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: WidgetPadding.paddingS,
      ),
      child: Text(
        StringConst.pro,
        style: theme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
