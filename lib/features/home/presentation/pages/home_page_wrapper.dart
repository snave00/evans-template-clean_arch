import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/helpers/shared/helper_func.dart';
import '../../cubit/home_cubit.dart';
import 'home_page.dart';

class HomePageWrapper extends StatelessWidget {
  const HomePageWrapper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<HomeCubit, HomeState>(
      listener: (ctx, state) {
        _handleHomeState(context: ctx, theme: theme, state: state);
      },
      child: const HomePage(),
    );
  }

  void _handleHomeState({
    required BuildContext context,
    required ThemeData theme,
    required HomeState state,
  }) async {
    switch (state.homeStatus) {
      case HomeStatus.initial:
        return;
      case HomeStatus.loading:
        return;
      case HomeStatus.getStoresLoading:
        return;
      case HomeStatus.getStoresSuccess:
        return;
      case HomeStatus.success:
        return;
      case HomeStatus.failure:
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
