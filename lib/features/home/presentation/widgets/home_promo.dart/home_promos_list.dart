import 'package:flutter/material.dart';

import '../../../../../core/presentation/widgets/icon/emoji_icon_widget.dart';
import '../../../../../core/presentation/widgets/placeholder/empty_state_text.dart';
import '../../../../../core/presentation/widgets/progress/custom_circular_progress.dart';
import '../../../../../core/presentation/widgets/spacing/spacing.dart';
import '../../../../../utils/constants/string_const.dart';
import '../../../../../utils/constants/widget_const.dart';
import '../../../../promos/domain/entities/promo_entity.dart';
import '../../../../promos/presentation/widgets/item/promo_item.dart';
import '../../../cubit/home_cubit.dart';

class HomePromosList extends StatelessWidget {
  final List<PromoEntity> promos;
  final HomePromosStatus homePromosStatus;

  const HomePromosList({
    super.key,
    required this.promos,
    required this.homePromosStatus,
  });

  @override
  Widget build(BuildContext context) {
    if (homePromosStatus == HomePromosStatus.getPromosLoading) {
      return _buildLoadingState();
    }

    if (promos.isEmpty) {
      return _buildEmptyState();
    }

    return _buildLoadedState(
      context: context,
      promos: promos,
    );
  }

  Widget _buildLoadedState({
    required BuildContext context,
    required List<PromoEntity> promos,
  }) {
    return SizedBox(
      height: WidgetSize.s140,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const Spacing.horizontal(size: SpacingSize.m);
        },
        scrollDirection: Axis.horizontal,
        padding:
            const EdgeInsets.symmetric(horizontal: PagePadding.pagePadding - 3),
        itemCount: promos.length,
        itemBuilder: (ctx, index) {
          final promoEntity = promos[index];

          return PromoItem(
            promoEntity: promoEntity,
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
            emoji: StringConst.emptyStateIcon2,
            emojiSize: EmojiSize.medium,
          ),
          emptyStateText: StringConst.noPromosFound,
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
