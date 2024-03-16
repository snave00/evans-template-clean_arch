import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/widgets/icon/emoji_icon_widget.dart';
import '../../../../../core/presentation/widgets/placeholder/empty_state_text.dart';
import '../../../../../core/presentation/widgets/progress/custom_circular_progress.dart';
import '../../../../../utils/constants/string_const.dart';
import '../../../../../utils/constants/widget_const.dart';
import '../../../../product/domain/entities/product_entity.dart';
import '../../../../product/presentation/widgets/item/product_item.dart';
import '../../cubit/cubit/store_cubit.dart';

class StoreDetailProductsList extends StatelessWidget {
  const StoreDetailProductsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreState>(
      builder: (ctx, state) {
        final products = state.products;
        final storeProductsStatus = state.storeProductsStatus;

        if (storeProductsStatus == StoreProductsStatus.getProductsLoading) {
          return _buildLoadingState();
        }

        if (products.isEmpty) {
          return _buildEmptyState();
        }

        return _buildLoadedState(
          context: context,
          products: products,
        );
      },
    );
  }

  Widget _buildLoadedState({
    required BuildContext context,
    required List<ProductEntity> products,
  }) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: PagePadding.pagePadding,
      ),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
          crossAxisSpacing: WidgetMargin.marginM,
          mainAxisSpacing: WidgetMargin.marginS,
        ),
        itemCount: products.length,
        itemBuilder: (ctx, index) {
          final product = products[index];

          return ProductItem(
            product: product,
            onAddTap: () {},
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return const SliverToBoxAdapter(
      child: Column(
        children: [
          EmptyStateText(
            emptyStateIcon: EmojiIconWidget(
              emoji: StringConst.emptyStateIcon6,
              emojiSize: EmojiSize.medium,
            ),
            emptyStateText: StringConst.noProductsFound,
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(WidgetPadding.paddingL),
        child: CustomCircularProgress(
          progressSize: ProgressSize.medium,
        ),
      ),
    );
  }
}
