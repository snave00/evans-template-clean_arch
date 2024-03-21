import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/gesture/hide_keyboard_on_tap.dart';
import '../widgets/store_detail_app_bar/store_detail_sliver_app_bar.dart';
import '../widgets/store_detail_header.dart';
import '../widgets/store_detail_product.dart/store_detail_products_list.dart';

class StoreDetailPage extends StatelessWidget {
  const StoreDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HideKeyboardOnTap(
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              StoreDetailSliverAppBar(),
              SliverMainAxisGroup(
                slivers: [
                  // header
                  StoreDetailHeader(),

                  // products
                  StoreDetailProductsList(),
                ],
              ),

              // * use refresh indicator between slivers
              // - put in between slivers
              // CupertinoSliverRefreshControl(
              //   builder: (
              //     ctx,
              //     refreshState,
              //     pulledExtent,
              //     refreshTriggerPullDistance,
              //     refreshIndicatorExtent,
              //   ) {
              //     return const CustomCircularProgress(
              //       progressSize: ProgressSize.medium,
              //     );
              //   },
              //   onRefresh: () async {
              //     debugPrint('Test');
              //     return await Future.delayed(const Duration(seconds: 1));
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
