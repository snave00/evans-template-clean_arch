import 'package:flutter/material.dart';

import '../../../../utils/constants/widget_const.dart';

// * This is used for the bottom appbar
// This solution is to avoid cut on rounded bottom of app bar when scrolling
// This is used along side with [custom_app_bar.dart]
// Place it under body:CustomScrollView( slivers:[] )
class CustomSliverAppBar extends StatelessWidget {
  final Widget child;
  final double height;

  const CustomSliverAppBar({
    super.key,
    required this.child,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: theme.colorScheme.primary,
      // floating: true,
      // pinned: true,
      // snap: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(WidgetBorderRadius.bottomAppBar),
          bottomRight: Radius.circular(WidgetBorderRadius.bottomAppBar),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size(double.maxFinite, height),
        child: child,
      ),
    );
  }
}
