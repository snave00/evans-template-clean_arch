import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../modules/bloc/app_bloc_observer.dart';
import '../modules/di/injection.dart' as di;
import '../modules/isar/isar_database_service.dart';

Future<void> initDependencies() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await _setOrientation();

  // * init revenue cat
  // await RevenueCatModule().initPlatformState();

  // * init get_it service locator / dependency injection
  await di.init();

  // * wait it so sl<SharedPreferences>() will work on initIsar() properly
  await di.sl.allReady();

  // * init isar local db
  await IsarDatabaseService().initIsar();

  // * initialize bloc observer
  Bloc.observer = AppBlocObserver();

  // * initialize flutter_timezone
  // await AppTimeZone().configureLocalTimeZone();

  // * initialize flutter_local_notifications
  // await NotifService().initNotification();

  // removeSplash();
}

Future<void> _setOrientation() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

/// * You can move me somewhere that make sense :)
/// - after all dependencies were loaded
void removeSplash() {
  FlutterNativeSplash.remove();
}
