import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/widgets/spacing/spacing.dart';
import '../../../cubit/home_cubit.dart';
import 'home_promos_list.dart';
import 'home_promos_title.dart';

class HomePromos extends StatelessWidget {
  const HomePromos({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (ctx, state) {
          final promos = state.promos;
          final homePromosStatus = state.homePromosStatus;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title
              HomePromosTitle(promos: promos),
              const Spacing.vertical(size: SpacingSize.s),

              // list
              HomePromosList(
                promos: promos,
                homePromosStatus: homePromosStatus,
              ),
            ],
          );
        },
      ),
    );
  }
}
