import 'package:flutter/material.dart';

import '../../../../../utils/constants/asset_const.dart';
import '../../../../../utils/constants/string_const.dart';
import '../../../../../utils/constants/widget_const.dart';
import 'home_service_item.dart';

class HomeServices extends StatelessWidget {
  const HomeServices({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: PagePadding.pagePadding,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HomeServiceItem(
              imagePath: AssetConst.icFood,
              title: StringConst.food,
            ),
            HomeServiceItem(
              imagePath: AssetConst.icMart,
              title: StringConst.mart,
            ),
            HomeServiceItem(
              imagePath: AssetConst.icCar,
              title: StringConst.car,
            ),
            HomeServiceItem(
              imagePath: AssetConst.icCourier,
              title: StringConst.courier,
            ),
            HomeServiceItem(
              imagePath: AssetConst.icAll,
              title: StringConst.all,
            ),
          ],
        ),
      ),
    );
  }
}
