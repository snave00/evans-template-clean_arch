import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/gesture/hide_keyboard_on_tap.dart';
import '../../../../core/presentation/widgets/pull_refresh/custom_pull_refresh.dart';
import '../../../../core/presentation/widgets/spacing/spacing.dart';
import '../widgets/home_app_bar/home_app_bar.dart';
import '../widgets/home_balance/home_balance.dart';
import '../widgets/home_promo.dart/home_promos.dart';
import '../widgets/home_search/home_search.dart';
import '../widgets/home_services/home_services.dart';
import '../widgets/home_store/home_stores.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HideKeyboardOnTap(
      child: Scaffold(
        appBar: const HomeAppBar(),
        body: SafeArea(
          child: CustomPullRefresh(
            onRefresh: () async {
              return await Future.delayed(const Duration(seconds: 1));
            },
            child: const CustomScrollView(
              slivers: [
                // search bar
                HomeSearch(),
                Spacing.vertical(size: SpacingSize.l, isSliver: true),

                // services
                HomeServices(),
                Spacing.vertical(size: SpacingSize.l, isSliver: true),

                // balance & points
                HomeBalance(),
                Spacing.vertical(size: SpacingSize.l, isSliver: true),

                // stores
                HomeStores(),
                Spacing.vertical(size: SpacingSize.l, isSliver: true),

                // promos
                HomePromos(),
                Spacing.vertical(size: SpacingSize.l, isSliver: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
