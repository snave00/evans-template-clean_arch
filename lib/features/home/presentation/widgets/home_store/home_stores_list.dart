import 'package:flutter/material.dart';

import '../../../../../core/presentation/widgets/icon/emoji_icon_widget.dart';
import '../../../../../core/presentation/widgets/placeholder/empty_state_text.dart';
import '../../../../../core/presentation/widgets/progress/custom_circular_progress.dart';
import '../../../../../core/presentation/widgets/spacing/spacing.dart';
import '../../../../../utils/constants/string_const.dart';
import '../../../../../utils/constants/widget_const.dart';
import '../../../../store/domain/entities/store_entity.dart';
import '../../../../store/presentation/widgets/item/store_item.dart';
import '../../../cubit/home_cubit.dart';

class HomeStoresList extends StatelessWidget {
  final List<StoreEntity> stores;
  final HomeStatus homeStatus;

  const HomeStoresList({
    super.key,
    required this.stores,
    required this.homeStatus,
  });

  @override
  Widget build(BuildContext context) {
    if (homeStatus == HomeStatus.getStoresLoading) {
      return _buildLoadingState();
    }

    if (stores.isEmpty) {
      return _buildEmptyState();
    }

    return _buildLoadedState(
      context: context,
      stores: stores,
    );
  }

  Widget _buildLoadedState({
    required BuildContext context,
    required List<StoreEntity> stores,
  }) {
    return SizedBox(
      height: WidgetSize.s220,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const Spacing.horizontal(size: SpacingSize.m);
        },
        scrollDirection: Axis.horizontal,
        padding:
            const EdgeInsets.symmetric(horizontal: PagePadding.pagePadding - 3),
        itemCount: stores.length,
        itemBuilder: (ctx, index) {
          final storeEntity = stores[index];

          return StoreItem(
            storeEntity: storeEntity,
            storeItemLayout: StoreItemLayout.horizontal,
            onTap: () async {},
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return const Column(
      children: [
        EmptyStateText(
          emptyStateIcon: EmojiIconWidget(
            emoji: StringConst.emptyStateIcon,
            emojiSize: EmojiSize.medium,
          ),
          emptyStateText: StringConst.noRestaurantsFound,
        ),
      ],
    );
  }

  Widget _buildLoadingState() {
    return const Padding(
      padding: EdgeInsets.all(WidgetPadding.paddingL),
      child: CustomCircularProgress(
        progressSize: ProgressSize.medium,
      ),
    );
  }
}
