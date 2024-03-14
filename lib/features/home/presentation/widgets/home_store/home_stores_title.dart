import 'package:flutter/material.dart';

import '../../../../../utils/constants/string_const.dart';
import '../../../../../utils/constants/widget_const.dart';
import '../../../../store/domain/entities/store_entity.dart';
import 'home_stores_view_all.dart';

class HomeStoresTitle extends StatelessWidget {
  final List<StoreEntity> stores;

  const HomeStoresTitle({
    super.key,
    required this.stores,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(
        left: PagePadding.pagePadding,
        right: WidgetPadding.paddingM,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              StringConst.restaurantsYouMayLike,
              style: theme.textTheme.titleMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          HomeStoresViewAll(stores: stores),
        ],
      ),
    );
  }
}
