import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../modules/di/injection.dart';
import '../../../../utils/helpers/shared/helper_func.dart';
import '../cubit/cubit/store_cubit.dart';
import 'store_detail_page.dart';

class StoreDetailPageWrapper extends StatelessWidget {
  final String storeId;

  const StoreDetailPageWrapper({
    super.key,
    required this.storeId,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (ctx) => sl<StoreCubit>()..init(storeId: storeId),
      child: BlocListener<StoreCubit, StoreState>(
        listener: (ctx, state) {
          _handleStoreDetailStatus(context: ctx, theme: theme, state: state);
          _handleStoreProductsStatus(context: ctx, theme: theme, state: state);
        },
        child: const StoreDetailPage(),
      ),
    );
  }

  void _handleStoreDetailStatus({
    required BuildContext context,
    required ThemeData theme,
    required StoreState state,
  }) async {
    switch (state.storeDetailStatus) {
      case StoreDetailStatus.initial:
        return;
      case StoreDetailStatus.getStoreLoading:
        return;
      case StoreDetailStatus.getStoreSuccess:
        return;
      case StoreDetailStatus.failure:
        showSnackBar(
          context: context,
          theme: theme,
          isSuccess: false,
          message: state.errorMessage ?? '',
        );
        return;
    }
  }

  void _handleStoreProductsStatus({
    required BuildContext context,
    required ThemeData theme,
    required StoreState state,
  }) async {
    switch (state.storeProductsStatus) {
      case StoreProductsStatus.initial:
        return;
      case StoreProductsStatus.getProductsLoading:
        return;
      case StoreProductsStatus.getProductsSuccess:
        return;
      case StoreProductsStatus.failure:
        showSnackBar(
          context: context,
          theme: theme,
          isSuccess: false,
          message: state.errorMessage ?? '',
        );
        return;
    }
  }
}
