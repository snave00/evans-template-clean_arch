import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/presentation/pages/shell/shell_wrapper.dart';
import '../../features/account/presentation/pages/account_page_wrapper.dart';
import '../../features/activity/presentation/pages/activity_page_wrapper.dart';
import '../../features/auth/presentation/pages/sign_up/sign_up_page_wrapper.dart';
import '../../features/cart/presentation/pages/cart_page_wrapper.dart';
import '../../features/home/presentation/pages/home_page_wrapper.dart';
import '../../features/initial/presentation/pages/initial_page_wrapper.dart';
import '../../features/messages/presentation/pages/messages_page_wrapper.dart';
import '../../features/store/presentation/pages/store_detail_page_wrapper.dart';
import '../../features/welcome/presentation/pages/welcome_page_wrapper.dart';
import '../enums/enums.dart';
import 'router_const.dart';

// TODO: Issue Update =>  https://github.com/flutter/flutter/issues/99124
// TODO: Error Page

class AppGoRouter {
  AppGoRouter._();

  // private navigators
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(
    debugLabel: 'home_key',
  );
  static final _shellNavigatorActivityKey = GlobalKey<NavigatorState>(
    debugLabel: 'activity_key',
  );
  static final _shellNavigatorCartKey = GlobalKey<NavigatorState>(
    debugLabel: 'cart_key',
  );
  static final _shellNavigatorMessagesKey = GlobalKey<NavigatorState>(
    debugLabel: 'messages_key',
  );
  static final _shellNavigatorAccountKey = GlobalKey<NavigatorState>(
    debugLabel: 'account_key',
  );

  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: Pages.initial.routePath,
        name: Pages.initial.routeName,
        builder: (ctx, state) => const InitialPageWrapper(),
      ),
      GoRoute(
        path: Pages.welcome.routePath,
        name: Pages.welcome.routeName,
        builder: (ctx, state) => const WelcomePageWrapper(),
        routes: [
          GoRoute(
            path: Pages.signUp.routePath,
            name: Pages.signUp.routeName,
            builder: (ctx, state) => const SignUpPageWrapper(),
            // routes: [
            //   GoRoute(
            //     path: 'email-verification',
            //     name: RouterConst.emailVerificationRoute,
            //     builder: (ctx, state) {
            //       // extra - casting is important 👈
            //       bool isFromSignup = state.extra as bool;

            //       return EmailVerificationPageWrapper(
            //         isFromSignup: isFromSignup,
            //       );
            //     },
            //   ),
            // ],
          ),
          GoRoute(
            path: Pages.signIn.routePath,
            name: Pages.signIn.routeName,
            builder: (ctx, state) => const SignUpPageWrapper(),
          ),
        ],
      ),

      // * statefulshellroute for bottom nav bar
      _buildStatefulShellRoute(),

      GoRoute(
        path: Pages.storeDetail.routePath,
        name: Pages.storeDetail.routeName,
        // * use the _rootNavigatorKey if u need full screen which doesn't need bottom nav bar
        // - use specific shell branch key if need bottom nav or..
        // - by default if no key was placed, it will have a bottom nav
        parentNavigatorKey: _rootNavigatorKey,
        builder: (ctx, state) {
          final storeId = state.uri.queryParameters[RouterConst.storeId] ?? '';

          return StoreDetailPageWrapper(storeId: storeId);
        },
      ),
    ],
  );

  static RouteBase _buildStatefulShellRoute() {
    return StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        final shellOrigin =
            state.uri.queryParameters[RouterConst.shellOrigin] ??
                ShellOrigin.manualSignIn.name;

        // the ui shell
        return ShellWrapper(
          navigationShell: navigationShell,
          shellOrigin: shellOrigin,
        );
      },
      branches: [
        _buildHomeBranch(),
        _buildActivityBranch(),
        _buildCartBranch(),
        _buildMessagesBranch(),
        _buildAccountBranch(),
      ],
    );
  }

  static StatefulShellBranch _buildHomeBranch() {
    return StatefulShellBranch(
      navigatorKey: _shellNavigatorHomeKey,
      routes: [
        // top route inside branch
        GoRoute(
          path: Pages.home.routePath,
          name: Pages.home.routeName,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HomePageWrapper(),
          ),
        ),
      ],
    );
  }

  static StatefulShellBranch _buildActivityBranch() {
    return StatefulShellBranch(
      navigatorKey: _shellNavigatorActivityKey,
      routes: [
        // top route inside branch
        GoRoute(
          path: Pages.activity.routePath,
          name: Pages.activity.routeName,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ActivityPageWrapper(),
          ),
        ),
      ],
    );
  }

  static StatefulShellBranch _buildCartBranch() {
    return StatefulShellBranch(
      navigatorKey: _shellNavigatorCartKey,
      routes: [
        // top route inside branch
        GoRoute(
          path: Pages.cart.routePath,
          name: Pages.cart.routeName,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: CartPageWrapper(),
          ),
        ),
      ],
    );
  }

  static StatefulShellBranch _buildMessagesBranch() {
    return StatefulShellBranch(
      navigatorKey: _shellNavigatorMessagesKey,
      routes: [
        // top route inside branch
        GoRoute(
          path: Pages.messages.routePath,
          name: Pages.messages.routeName,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: MessagesPageWrapper(),
          ),
        ),
      ],
    );
  }

  static StatefulShellBranch _buildAccountBranch() {
    return StatefulShellBranch(
      navigatorKey: _shellNavigatorAccountKey,
      routes: [
        // top route inside branch
        GoRoute(
          path: Pages.account.routePath,
          name: Pages.account.routeName,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: AccountPageWrapper(),
          ),
        ),
      ],
    );
  }
}
