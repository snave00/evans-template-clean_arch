import 'package:flutter/material.dart';

import '../../../../../utils/constants/string_const.dart';
import '../../../../../utils/constants/widget_const.dart';
import '../../../../promos/domain/entities/promo_entity.dart';

class HomePromosTitle extends StatelessWidget {
  final List<PromoEntity> promos;

  const HomePromosTitle({
    super.key,
    required this.promos,
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
              StringConst.promos,
              style: theme.textTheme.titleMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
