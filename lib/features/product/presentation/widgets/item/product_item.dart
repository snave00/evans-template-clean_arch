import 'package:flutter/material.dart';

import '../../../../../core/presentation/widgets/button/add_to_cart_icon_button.dart';
import '../../../../../core/presentation/widgets/button/bouncing_button.dart';
import '../../../../../core/presentation/widgets/image/custom_cached_network_image.dart';
import '../../../../../core/presentation/widgets/spacing/spacing.dart';
import '../../../../../utils/constants/widget_const.dart';
import '../../../domain/entities/product_entity.dart';

class ProductItem extends StatelessWidget {
  final ProductEntity product;
  final void Function()? onTap;
  final void Function()? onAddTap;

  const ProductItem({
    super.key,
    required this.product,
    this.onTap,
    this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return _buildItem(theme: theme);
  }

  Widget _buildItem({required ThemeData theme}) {
    return Stack(
      children: [
        BouncingButton(
          onTap: onTap,
          child: Column(
            children: [
              // image & add button -> stack
              Stack(
                children: [
                  _buildImage(),
                ],
              ),
              const Spacing.vertical(size: SpacingSize.s),

              // product name
              _buildTitle(theme: theme),

              // price
              _buildPrice(theme: theme),
              const Spacing.vertical(size: SpacingSize.s),
            ],
          ),
        ),

        // add button
        Positioned(
          top: WidgetSize.s100,
          right: WidgetPadding.paddingXS,
          child: AddToCartIconButton(
            onTap: onAddTap,
          ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return SizedBox(
      width: double.infinity,
      height: WidgetSize.s140,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          WidgetBorderRadius.border12,
        ),
        child: CustomCachedNetworkImage(
          imageUrl: product.productImage,
        ),
      ),
    );
  }

  Widget _buildTitle({required ThemeData theme}) {
    return Row(
      children: [
        const Spacing.horizontal(size: SpacingSize.xs),
        Expanded(
          child: Text(
            product.productName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }

  Widget _buildPrice({required ThemeData theme}) {
    return Row(
      children: [
        const Spacing.horizontal(size: SpacingSize.xs),
        Expanded(
          child: Text(
            product.productPrice,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
