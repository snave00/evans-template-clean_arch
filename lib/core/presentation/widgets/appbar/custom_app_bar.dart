import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/constants/widget_const.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final bool hasBackButton;
  final Color? backgroundColor;
  final Color? surfaceTintColor;
  final bool? centerTitle;
  final double? titleSpacing;
  final Widget? flexibleSpace;

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
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      // change only back button
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      surfaceTintColor: surfaceTintColor,
      leading: hasBackButton
          ? _buildBackButton(context: context, theme: theme)
          : null,
      title: title,
      actions: actions,
      centerTitle: centerTitle,
      titleSpacing: titleSpacing,
      flexibleSpace: flexibleSpace,
    );
  }

  @override
  Size get preferredSize => const Size(
        double.maxFinite,
        WidgetSize.appBarHeight,
      );

  Widget _buildBackButton({
    required BuildContext context,
    required ThemeData theme,
  }) {
    return Padding(
      padding: const EdgeInsets.all(WidgetPadding.paddingS),
      child: Material(
        color: theme.colorScheme.surfaceVariant,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            WidgetBorderRadius.border12,
          ),
        ),
        child: InkWell(
          onTap: () {
            // pop page
            context.pop();
          },
          borderRadius: const BorderRadius.all(
            Radius.circular(WidgetBorderRadius.border12),
          ),
          child: Container(
            width: WidgetSize.s40,
            height: WidgetSize.s40,
            alignment: Alignment.center,
            child: const FaIcon(
              FontAwesomeIcons.chevronLeft,
              size: WidgetSize.s16,
            ),
          ),
        ),
      ),
    );
  }
}
