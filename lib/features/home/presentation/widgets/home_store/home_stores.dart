import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/widgets/spacing/spacing.dart';
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
          final homeStoreStatus = state.homeStoreStatus;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title
              HomeStoresTitle(stores: stores),
              const Spacing.vertical(size: SpacingSize.s),

              // list
              HomeStoresList(stores: stores, homeStoreStatus: homeStoreStatus),
            ],
          );
        },
      ),
    );
  }
}
