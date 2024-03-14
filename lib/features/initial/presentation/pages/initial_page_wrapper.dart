import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/cubit/user_cubit.dart';
import '../../../../core/presentation/widgets/progress/custom_circular_progress.dart';
import '../../../../utils/helpers/shared/helper_state.func.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';

class InitialPageWrapper extends StatelessWidget {
  const InitialPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listener: (ctx, state) {
            handleAuthState(
              context: context,
              theme: theme,
              state: state,
              isFromSplash: true,
            );
          },
        ),
        BlocListener<UserCubit, UserState>(
          listener: (ctx, state) {
            handleUserState(context: context, theme: theme, state: state);
          },
        ),
      ],
      child: const Scaffold(
        body: Center(
          child: CustomCircularProgress(progressSize: ProgressSize.large),
          // child: AppLogo(
          //   appLogoType: AppLogoType.roundedSquare,
          //   size: WidgetSize.s100,
          // ),
        ),
      ),
    );
  }
}
