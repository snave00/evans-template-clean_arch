import 'package:flutter/material.dart';

import '../../../../utils/constants/widget_const.dart';

enum SpacingSize {
  xs,
  s,
  m,
  l,
  xl,
}

class Spacing extends StatelessWidget {
  final SpacingSize size;
  final bool isVertical;
  final bool isSliver;

  const Spacing.vertical({
    super.key,
    required this.size,
    this.isVertical = true,
    this.isSliver = false,
  });

  const Spacing.horizontal({
    super.key,
    required this.size,
    this.isVertical = false,
    this.isSliver = false,
  });

  @override
  Widget build(BuildContext context) {
    // normal & vertical
    if (!isSliver && isVertical) {
      return SizedBox(height: _getSize());
    }

    // normal & horizontal
    if (!isSliver && !isVertical) {
      return SizedBox(width: _getSize());
    }

    // sliver & vertical
    if (isSliver && isVertical) {
      return SliverPadding(
        padding: EdgeInsets.only(bottom: _getSize()),
      );
    }

    // sliver & horizontal
    if (isSliver && !isVertical) {
      return SliverPadding(
        padding: EdgeInsets.only(right: _getSize()),
      );
    }

    return Container();
  }

  double _getSize() {
    switch (size) {
      case SpacingSize.xs:
        return WidgetMargin.marginXS;
      case SpacingSize.s:
        return WidgetMargin.marginS;
      case SpacingSize.m:
        return WidgetMargin.marginM;
      case SpacingSize.l:
        return WidgetMargin.marginL;
      case SpacingSize.xl:
        return WidgetMargin.marginXL;
    }
  }
}
