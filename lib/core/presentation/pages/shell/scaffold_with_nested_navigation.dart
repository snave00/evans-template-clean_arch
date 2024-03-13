import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

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
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // const CustomDivider(),
          NavigationBar(
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            height: WidgetSize.s60,
            selectedIndex: navigationShell.currentIndex,
            // surfaceTintColor: theme.colorScheme.background,
            // indicatorColor: Colors.transparent,
            destinations: [
              // home
              _buildNavigationDestination(
                theme: theme,
                iconData: FontAwesomeIcons.house,
                label: StringConst.home,
              ),

              // activity
              _buildNavigationDestination(
                theme: theme,
                iconData: FontAwesomeIcons.list,
                label: StringConst.activity,
              ),

              // cart
              _buildNavigationDestination(
                theme: theme,
                iconData: FontAwesomeIcons.cartShopping,
                label: StringConst.cart,
              ),

              // messages
              _buildNavigationDestination(
                theme: theme,
                iconData: FontAwesomeIcons.message,
                label: StringConst.messages,
              ),

              // account
              _buildNavigationDestination(
                theme: theme,
                iconData: FontAwesomeIcons.user,
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
    );
  }

  Widget _buildNavigationDestination({
    required ThemeData theme,
    required IconData iconData,
    required String label,
  }) {
    return NavigationDestination(
      icon: FaIcon(iconData),
      label: label,
    );
  }

  // Widget _buildNavigationDestinationSVG({
  //   required ThemeData theme,
  //   required String iconPath,
  //   required String selectedIconPath,
  //   required String label,
  //   bool isNewTransaction = false,
  // }) {
  //   return NavigationDestination(
  //     icon: SvgPicture.asset(
  //       iconPath,
  //       height: isNewTransaction ? WidgetSize.s40 : WidgetSize.s24,
  //       width: isNewTransaction ? WidgetSize.s40 : WidgetSize.s24,
  //     ),
  //     selectedIcon: isNewTransaction
  //         ? null
  //         : SvgPicture.asset(
  //             selectedIconPath,
  //             height: WidgetSize.s24,
  //             width: WidgetSize.s24,
  //             colorFilter: ColorFilter.mode(
  //               theme.colorScheme.primary,
  //               BlendMode.srcIn,
  //             ),
  //           ),
  //     label: label,
  //   );
  // }
}
