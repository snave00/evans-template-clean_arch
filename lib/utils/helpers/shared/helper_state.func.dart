import 'package:flutter/material.dart';

import '../../../core/presentation/cubit/user_cubit.dart';
import '../../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../enums/enums.dart';
import '../../logs/custom_log.dart';
import '../../router/router_func.dart';
import 'helper_func.dart';

/// * The global listener for auth cubit and auth state
/// * It will listen to all child widgets because auth cubit was set to [main.dart]
/// * This is a reusable function. Can be used in:
/// * Parent of AuthPages (SignInProviderPage, SignUpPage, SignInPage, EmailVerifiaction Page)
/// * Parent of RootPages (HomePage, StatisticsPage...)
/// - Needs to handle both AuthPages and RootPages bc it's both Top level route
/// - Needs a new BlocListener for both AuthPages and RootPages so it can be listened
void handleAuthState({
  required BuildContext context,
  required ThemeData theme,
  required AuthState state,
  required bool isFromSplash,
}) async {
  switch (state.authStatus) {
    case AuthStatus.initial:
      Log.logAuthStatus(authStatus: AuthStatus.initial.name);
      return;

    case AuthStatus.loading:
      Log.logAuthStatus(authStatus: AuthStatus.loading.name);
      return;

    case AuthStatus.authenticated:
      Log.logAuthStatus(authStatus: AuthStatus.authenticated.name);
      if (isFromSplash) {
        // redirect to root
        RouterFunc.goToShellPage(
          context: context,
          shellOrigin: ShellOrigin.autoSignIn.name,
        );
      }
      return;

    case AuthStatus.unautenticated:
      Log.logAuthStatus(authStatus: AuthStatus.unautenticated.name);
      // same logic ifFromSplash and signOut
      RouterFunc.goToWelcomePage(context: context);
      return;

    case AuthStatus.failure:
      Log.logAuthStatus(authStatus: AuthStatus.failure.name);
      RouterFunc.goToWelcomePage(context: context);

      showSnackBar(
        context: context,
        theme: theme,
        isSuccess: false,
        message: state.errorMessage ?? '',
      );
      return;
  }
}

// * The global listener for user cubit and user state
// * It will listen to all child widgets because user cubit was set to [main.dart]
// * This is a reusable function. Can be used in:
// * Parent of AuthPages (SignInProviderPage, SignUpPage, SignInPage, EmailVerifiaction Page)
// * Parent of RootPages (HomePage, StatisticsPage...)
// - Needs to handle both AuthPages and RootPages bc it's both Top level route
// - Needs a new BlocListener for both AuthPages and RootPages so it can be listened
void handleUserState({
  required BuildContext context,
  required ThemeData theme,
  required UserState state,
}) async {
  switch (state.userStatus) {
    case UserStatus.initial:
      Log.logUserStatus(userStatus: UserStatus.initial.name);
      return;

    case UserStatus.loading:
      Log.logUserStatus(userStatus: UserStatus.loading.name);
      await showProgressDialog(context: context);
      return;

    case UserStatus.success:
      Log.logUserStatus(userStatus: UserStatus.success.name);
      // close progress dialog
      Navigator.pop(context);
      return;

    case UserStatus.getUserSuccess:
      Log.logUserStatus(userStatus: UserStatus.getUserSuccess.name);
      // close progress dialog
      Navigator.pop(context);
      return;

    case UserStatus.failure:
      Log.logUserStatus(userStatus: UserStatus.failure.name);
      // close progress dialog
      Navigator.pop(context);
      showSnackBar(
        context: context,
        theme: theme,
        isSuccess: false,
        message: state.errorMessage ?? '',
      );
      return;
  }
}
