import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/presentation/widgets/spacing/spacing.dart';
import '../../../../utils/constants/widget_const.dart';
import '../cubit/cubit/store_cubit.dart';

class StoreDetailHeader extends StatelessWidget {
  const StoreDetailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: PagePadding.pagePadding,
          vertical: WidgetPadding.paddingM,
        ),
        child: BlocBuilder<StoreCubit, StoreState>(
          builder: (ctx, state) {
            final store = state.store;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // store name
                Text(
                  store.storeName,
                  style: theme.textTheme.titleMedium,
                ),

                // store desc
                Text(store.storeDesc),
                const Spacing.vertical(size: SpacingSize.xs),

                // rating & distance
                _buildRatingAndDistance(
                  theme: theme,
                  rating: store.rating,
                  distance: store.distance,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildRatingAndDistance({
    required ThemeData theme,
    required String rating,
    required String distance,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // icon
        const FaIcon(
          FontAwesomeIcons.solidStar,
          size: WidgetSize.s10,
          color: Colors.orange,
        ),
        const Spacing.horizontal(size: SpacingSize.xs),

        // rating & distance
        Expanded(
          child: Text(
            '$rating | $distance',
            style: theme.textTheme.bodySmall?.copyWith(
              color: Colors.grey,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
