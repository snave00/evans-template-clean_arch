class RouterConst {
  RouterConst._();

  /// Top Level Routes should start with [/].
  /// Sub Level Routes should not begin with [/].
  /// When calling [context.go] you must define the whole path.
  /// Example: [context.go('/' + RouterConstants.loginPagePath);].
  /// Given RouterConstants.loginPagePath = 'login'.
  /// Alternatively, you can use namedRoutes
  ///

  // * Named Routes - make sure it's the same on path param in Go Router
  // static const initialRoute = 'initial';
  // static const welcomeRoute = 'welcome';
  // static const signUpRoute = 'signUp';
  // static const signInRoute = 'signIn';
  // static const emailVerificationRoute = 'email-verification';

  // bottom nav routes
  // static const homeRoute = 'home';
  // static const activityRoute = 'activity';
  // static const cartRoute = 'cart';
  // static const messagesRoute = 'messages';
  // static const accountRoute = 'account';

  // * Query Params
  // used for root to determine if from manual login or auto login
  static const shellOrigin = 'shell-origin';

  // used for displaying store detail
  static const storeId = 'store-id';
}

enum Pages {
  initial(routePath: '/', routeName: 'initial'),
  welcome(routePath: '/welcome', routeName: 'welcome'),

  // auth
  signUp(routePath: 'signUp', routeName: 'signUp'),
  signIn(routePath: 'signIn', routeName: 'signIn'),
  emailVerification(routePath: '', routeName: 'email-verification'),

  // bottom nav
  home(routePath: '/home', routeName: 'home'),
  activity(routePath: '/activity', routeName: 'activity'),
  cart(routePath: '/cart', routeName: 'cart'),
  messages(routePath: '/messages', routeName: 'messages'),
  account(routePath: '/account', routeName: 'account'),

  // store
  storeDetail(routePath: '/store-detail', routeName: 'store-detail');

  const Pages({
    required this.routePath,
    required this.routeName, // named route
  });
  final String routePath;
  final String routeName;
}
