import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../../../features/home/cubit/home_cubit.dart';
import '../../../../modules/di/injection.dart';
import '../../../../utils/helpers/shared/helper_state.func.dart';
import '../../../../utils/logs/custom_log.dart';
import '../../cubit/user_cubit.dart';
import 'scaffold_with_nested_navigation.dart';

class ShellWrapper extends StatelessWidget {
  final String shellOrigin;
  final StatefulNavigationShell navigationShell;

  const ShellWrapper({
    Key? key,
    required this.shellOrigin,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ShellWrapper'));

  @override
  Widget build(BuildContext context) {
    Log.logWidget('${runtimeType.toString()}: $shellOrigin');
    final theme = Theme.of(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => sl<HomeCubit>()..init(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthCubit, AuthState>(
            listener: (ctx, state) {
              handleAuthState(
                context: context,
                theme: theme,
                state: state,
                isFromSplash: false,
              );
            },
          ),
          BlocListener<UserCubit, UserState>(
            listener: (ctx, state) {
              handleUserState(context: context, theme: theme, state: state);
            },
          ),
        ],
        child: ScaffoldWithNestedNavigation(
          navigationShell: navigationShell,
        ),
      ),
    );
  }
}
