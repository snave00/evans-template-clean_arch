import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/widgets/appbar/invisible_expanded_header.dart';
import '../../../../../core/presentation/widgets/button/app_bar_back_button.dart';
import '../../../../../core/presentation/widgets/image/custom_cached_network_image.dart';
import '../../../../../core/presentation/widgets/progress/custom_circular_progress.dart';
import '../../../../../utils/constants/widget_const.dart';
import '../../cubit/cubit/store_cubit.dart';

class StoreDetailSliverAppBar extends StatelessWidget {
  const StoreDetailSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<StoreCubit, StoreState>(
      builder: (ctx, state) {
        final store = state.store;
        final storeName = store.storeName;
        final bannerImage = store.bannerImage;
        final storeDetailStatus = state.storeDetailStatus;
        final isLoading =
            storeDetailStatus == StoreDetailStatus.getStoreLoading;

        return _buildSliverAppBar(
          theme: theme,
          storeName: storeName,
          bannerImage: bannerImage,
          isLoading: isLoading,
        );
      },
    );
  }

  Widget _buildSliverAppBar({
    required ThemeData theme,
    required String storeName,
    required String bannerImage,
    required bool isLoading,
  }) {
    return SliverAppBar(
      leading: const AppBarBackButton(),
      expandedHeight: WidgetSize.s200,
      surfaceTintColor: theme.colorScheme.background,
      pinned: true,
      title: InvisibleExpandedHeader(
        child: Text(storeName),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: isLoading
            ? _buildLoadingState()
            : CustomCachedNetworkImage(
                imageUrl: bannerImage,
              ),
      ),

      // * hide widget based on layout builder
      // Do not hardcode the 80 as it is different on different devices!
      // It's actually the status bar height + the app bar height,
      // which you can get using the following:
      // MediaQuery.of(context).padding.top + kToolbarHeight
      // https://stackoverflow.com/questions/53372276/flutter-how-to-check-if-sliver-appbar-is-expanded-or-collapsed
      // flexibleSpace: LayoutBuilder(
      //   builder: (ctx, constraints) {
      //     final appBarHeight = constraints.biggest.height;
      //     debugPrint('top: $appBarHeight');
      //     return FlexibleSpaceBar(
      //       background: CustomCachedNetworkImage(
      //         imageUrl: bannerImage,
      //       ),
      //       titlePadding: const EdgeInsets.symmetric(
      //         horizontal: WidgetPadding.paddingL,
      //         vertical: WidgetPadding.paddingM,
      //       ),
      //       centerTitle: true,
      //       title: appBarHeight == WidgetSize.appBarHeight
      //           ? Text(
      //               storeName,
      //               style: theme.textTheme.titleSmall?.copyWith(
      //                 color: theme.colorScheme.onBackground,
      //               ),
      //               maxLines: 1,
      //               overflow: TextOverflow.ellipsis,
      //             )
      //           : Container(),
      //     );
      //   },
      // ),
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
