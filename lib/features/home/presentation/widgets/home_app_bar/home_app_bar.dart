import 'package:flutter/material.dart';

import '../../../../../core/presentation/widgets/appbar/custom_app_bar.dart';
import '../../../../../core/presentation/widgets/icon/app_logo.dart';
import '../../../../../utils/constants/widget_const.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function()? onTap;
  final void Function()? onLongPress;

  const HomeAppBar({
    super.key,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomAppBar(
      title: _buildAppBarLogo(context: context, theme: theme),
      surfaceTintColor: theme.colorScheme.background,
    );
  }

  Widget _buildAppBarLogo({
    required BuildContext context,
    required ThemeData theme,
  }) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.all(WidgetSize.s8),
          child: AppLogo(appLogoType: AppLogoType.nameLogo),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(
        double.maxFinite,
        WidgetSize.appBarHeight,
      );
}
