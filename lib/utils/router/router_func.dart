import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'router_const.dart';

class RouterFunc {
  RouterFunc._();

  static void goToInitialPage({required BuildContext context}) {
    context.goNamed(Pages.initial.routeName);
  }

  static void goToWelcomePage({required BuildContext context}) {
    context.goNamed(Pages.welcome.routeName);
  }

  static void goToSignUpPage({required BuildContext context}) {
    context.goNamed(Pages.signUp.routeName);
  }

  static void goToSignInPage({required BuildContext context}) {
    context.goNamed(Pages.signIn.routeName);
  }

  static void goToEmailVerificationPage({
    required BuildContext context,
    required bool isFromSignup,
  }) {
    context.goNamed(
      Pages.emailVerification.routeName,
      extra: isFromSignup,
    );
  }

  static void goToShellPage({
    required BuildContext context,
    required String shellOrigin,
  }) {
    // redirect to home branch.
    // we can't redirect to shell path bc there's no path for shell itself
    // bu default if you want to navigate to shell, use the branch path
    context.goNamed(
      Pages.home.routeName,
      queryParameters: <String, String>{
        RouterConst.shellOrigin: shellOrigin,
      },
    );
  }

  static Future<void> goToStoreDetailPage({
    required BuildContext context,
    required String storeId,
  }) async {
    final Map<String, dynamic> queryParameters = <String, dynamic>{
      RouterConst.storeId: storeId,
    };
    await context.pushNamed(
      Pages.storeDetail.routeName,
      queryParameters: queryParameters,
    );
  }
}
