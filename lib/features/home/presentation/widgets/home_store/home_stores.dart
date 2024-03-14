import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/constants/widget_const.dart';
import '../../../cubit/home_cubit.dart';
import 'home_stores_list.dart';
import 'home_stores_title.dart';

class HomeStores extends StatelessWidget {
  const HomeStores({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (ctx, state) {
          final stores = state.stores;
          final homeStatus = state.homeStatus;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title
              HomeStoresTitle(stores: stores),
              const SizedBox(height: WidgetMargin.marginS),

              // list
              HomeStoresList(stores: stores, homeStatus: homeStatus),
              const SizedBox(height: WidgetMargin.marginXL),
            ],
          );
        },
      ),
    );
  }
}
