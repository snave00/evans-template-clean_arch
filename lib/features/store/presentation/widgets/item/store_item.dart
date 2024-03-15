import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/presentation/widgets/button/bouncing_button.dart';
import '../../../../../core/presentation/widgets/image/custom_cached_network_image.dart';
import '../../../../../core/presentation/widgets/spacing/spacing.dart';
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
    return BouncingButton(
      onTap: onTap,
      child: SizedBox(
        width: WidgetSize.s140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            _buildImage(),
            const Spacing.vertical(size: SpacingSize.s),

            // title
            _buildTitle(theme: theme),

            // desc
            _buildDesc(theme: theme),
            const Spacing.vertical(size: SpacingSize.xs),

            // distance & rating
            _buildRatingAndDistance(theme: theme),
            // const Spacing.vertical(size: SpacingSize.xs),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return SizedBox(
      width: WidgetSize.s140,
      height: WidgetSize.s140,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          WidgetBorderRadius.border12,
        ),
        child: CustomCachedNetworkImage(
          imageUrl: storeEntity.storeThumbnail,
          // imageUrl: 'http://via.placeholder.com/140x140',
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
            storeEntity.storeName,
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

  Widget _buildDesc({required ThemeData theme}) {
    return Row(
      children: [
        const Spacing.horizontal(size: SpacingSize.xs),
        Expanded(
          child: Text(
            storeEntity.storeDesc,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall?.copyWith(
              color: Colors.grey,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }

  Widget _buildRatingAndDistance({required ThemeData theme}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacing.horizontal(size: SpacingSize.xs),

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
            '${storeEntity.rating} | ${storeEntity.distance}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
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
