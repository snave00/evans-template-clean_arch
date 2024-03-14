import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/constants/asset_const.dart';
import '../../../../utils/constants/string_const.dart';
import '../../../../utils/constants/widget_const.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));

  void _goBranch({
    required BuildContext context,
    required int selectedIndex,
  }) async {
    navigationShell.goBranch(
      selectedIndex,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: selectedIndex == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: navigationShell,
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (Set<MaterialState> states) =>
                states.contains(MaterialState.selected)
                    ? theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.primary,
                        ) ??
                        const TextStyle()
                    : theme.textTheme.bodySmall?.copyWith(
                          color: Colors.grey,
                        ) ??
                        const TextStyle(),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // const CustomDivider(),
            NavigationBar(
              selectedIndex: navigationShell.currentIndex,
              indicatorColor: Colors.transparent,
              // labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              height: WidgetSize.s64,
              // surfaceTintColor: theme.colorScheme.background,
              destinations: [
                // home
                _buildNavigationDestinationSVG(
                  theme: theme,
                  iconPath: AssetConst.icExploreUnSelected,
                  selectedIconPath: AssetConst.icExploreSelected,
                  label: StringConst.home,
                ),

                // activity
                _buildNavigationDestinationSVG(
                  theme: theme,
                  iconPath: AssetConst.icActivityUnSelected,
                  selectedIconPath: AssetConst.icActivitySelected,
                  label: StringConst.activity,
                ),

                // cart
                _buildNavigationDestinationSVG(
                  theme: theme,
                  iconPath: AssetConst.icCartUnSelected,
                  selectedIconPath: AssetConst.icCartSelected,
                  label: StringConst.cart,
                ),

                // messages
                _buildNavigationDestinationSVG(
                  theme: theme,
                  iconPath: AssetConst.icMessageUnSelected,
                  selectedIconPath: AssetConst.icMessageSelected,
                  label: StringConst.messages,
                ),

                // account
                _buildNavigationDestinationSVG(
                  theme: theme,
                  iconPath: AssetConst.icAccountUnSelected,
                  selectedIconPath: AssetConst.icAccountSelected,
                  label: StringConst.account,
                ),
              ],
              onDestinationSelected: (selectedIndex) {
                _goBranch(
                  context: context,
                  selectedIndex: selectedIndex,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationDestinationSVG({
    required ThemeData theme,
    required String iconPath,
    required String selectedIconPath,
    required String label,
  }) {
    return NavigationDestination(
      icon: SvgPicture.asset(
        iconPath,
        height: WidgetSize.s24,
        width: WidgetSize.s24,
        colorFilter: const ColorFilter.mode(
          Colors.grey,
          BlendMode.srcIn,
        ),
      ),
      selectedIcon: SvgPicture.asset(
        selectedIconPath,
        height: WidgetSize.s24,
        width: WidgetSize.s24,
        colorFilter: ColorFilter.mode(
          theme.colorScheme.primary,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }

  // Widget _buildNavigationDestination({
  //   required ThemeData theme,
  //   required IconData iconData,
  //   required String label,
  // }) {
  //   return NavigationDestination(
  //     icon: FaIcon(iconData),
  //     label: label,
  //   );
  // }
}
