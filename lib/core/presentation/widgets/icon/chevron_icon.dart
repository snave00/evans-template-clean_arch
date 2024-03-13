import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../utils/constants/widget_const.dart';

enum ChevronDirection {
  left,
  right,
}

class ChevronIcon extends StatelessWidget {
  final Color? color;
  final ChevronDirection chevronDirection;
  const ChevronIcon({
    super.key,
    this.color,
    required this.chevronDirection,
  });

  @override
  Widget build(BuildContext context) {
    return FaIcon(
      _getIcon(),
      size: WidgetSize.s12,
      color: color,
    );
  }

  IconData _getIcon() {
    switch (chevronDirection) {
      case ChevronDirection.left:
        return FontAwesomeIcons.chevronLeft;
      case ChevronDirection.right:
        return FontAwesomeIcons.chevronRight;
    }
  }
}
