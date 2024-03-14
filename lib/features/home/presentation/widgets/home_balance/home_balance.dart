import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/presentation/widgets/spacing/spacing.dart';
import '../../../../../utils/constants/string_const.dart';
import '../../../../../utils/constants/widget_const.dart';
import 'home_balance_container.dart';

class HomeBalance extends StatelessWidget {
  const HomeBalance({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: PagePadding.pagePadding,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // balance
            HomeBalanceContainer(
              title: StringConst.balance,
              amount: StringConst.dummy1kPesos,
              icon: FaIcon(
                FontAwesomeIcons.wallet,
                size: WidgetSize.s16,
                color: theme.colorScheme.primary,
              ),
            ),
            const Spacing.horizontal(size: SpacingSize.m),

            // points
            HomeBalanceContainer(
              title: StringConst.points,
              amount: StringConst.dummy100Pesos,
              icon: FaIcon(
                FontAwesomeIcons.crown,
                size: WidgetSize.s16,
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
