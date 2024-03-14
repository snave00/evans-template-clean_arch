import 'package:flutter/material.dart';

import '../../../../../core/presentation/widgets/image/custom_cached_network_image.dart';
import '../../../../../utils/constants/widget_const.dart';
import '../../../domain/entities/store_entity.dart';

enum StoreItemLayout {
  horizontal,
  vertical,
}

class StoreItem extends StatelessWidget {
  final StoreEntity storeEntity;
  final StoreItemLayout storeItemLayout;
  final void Function()? onTap;

  const StoreItem({
    super.key,
    required this.storeEntity,
    required this.storeItemLayout,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return _buildItem(theme: theme);
  }

  Widget _buildItem({required ThemeData theme}) {
    if (storeItemLayout == StoreItemLayout.horizontal) {
      return _buildHorizontalLayout(theme: theme);
    }

    return Container();
  }

  Widget _buildHorizontalLayout({required ThemeData theme}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image
          const CustomCachedNetworkImage(
            imageUrl: 'http://via.placeholder.com/250x150',
          ),

          const SizedBox(height: WidgetMargin.marginS),

          // title
          Text(
            storeEntity.storeName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: WidgetMargin.marginXS),

          // distance & rating
        ],
      ),
    );
  }
}
