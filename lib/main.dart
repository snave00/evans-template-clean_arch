import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/presentation/cubit/user_cubit.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'l10n/l10n.dart';
import 'modules/di/injection.dart';
import 'theme/app_theme.dart';
import 'utils/constants/string_const.dart';
import 'utils/init_dependencies.dart';
import 'utils/router/app_go_router.dart';

void main() async {
  await initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => sl<AuthCubit>()..authStateChanges()),
        BlocProvider(create: (ctx) => sl<UserCubit>()..init(context: context)),
      ],
      child: _buildMaterialApp(),
    );
  }

  Widget _buildMaterialApp() {
    // context.watch: this works like a MultiBlocBuilder or nested BlocBuilder.
    // only use context.watch inside the Builder not within build function.
    return Builder(
      builder: (context) {
        final userState = context.watch<UserCubit>().state;

        return MaterialApp.router(
          title: StringConst.appName,
          themeMode: userState.userEntity.userSettings.themeMode,
          theme: AppTheme.buildTheme(Brightness.light),
          darkTheme: AppTheme.buildTheme(Brightness.dark),
          debugShowCheckedModeBanner: false,
          supportedLocales: L10n.all,
          localeResolutionCallback: L10n.setLocaleResolutionCallback(),
          localizationsDelegates: L10n.setLocalizationDelegate(),
          routerConfig: AppGoRouter.router,
          // locale: languageState,
          // onUnknownRoute: (settings) {
          //   return MaterialPageRoute(builder: (ctx) => const ErrorPage());
          // },
        );
      },
    );
  }
}
