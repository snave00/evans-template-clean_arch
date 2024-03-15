import 'package:flutter/material.dart';

import '../../../../utils/constants/widget_const.dart';
import '../button/app_bar_back_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final bool hasBackButton;
  final Color? backgroundColor;
  final Color? surfaceTintColor;
  final bool? centerTitle;
  final double? titleSpacing;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;

  /// If this is used, showWarningOnBack and pop page won't work.
  /// You have to implement a custom behaviour for back button
  final void Function()? customOnBackPressed;

  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.hasBackButton = false,
    this.customOnBackPressed,
    this.backgroundColor,
    this.surfaceTintColor,
    this.centerTitle,
    this.titleSpacing,
    this.flexibleSpace,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // change only back button
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      surfaceTintColor: surfaceTintColor,
      leading: hasBackButton ? const AppBarBackButton() : null,
      title: title,
      actions: actions,
      centerTitle: centerTitle,
      titleSpacing: titleSpacing,
      flexibleSpace: flexibleSpace,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => const Size(
        double.maxFinite,
        WidgetSize.appBarHeight,
      );
}
