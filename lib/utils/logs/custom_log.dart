import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class Log {
  Log._();

  static var titleLogger = Logger(
    printer: PrettyPrinter(
      printEmojis: false,
    ),
  );

  static var logger = Logger(
    printer: PrettyPrinter(
      printEmojis: false,
      printTime: true,
    ),
  );

  static var loggerWithEmoji = Logger(
    printer: PrettyPrinter(
      printEmojis: true,
      printTime: true,
    ),
  );

  static void logWidget(String widgetName) {
    debugPrint('🧱 : [Widget Build] : $widgetName rebuilt');
  }

  static void logIsar({String? collection, required String logIsar}) {
    debugPrint('💧 : [Isar] : [${collection ?? ''}] : $logIsar');
  }

  static void logFireStoreCall({
    required String action,
    dynamic result,
  }) {
    titleLogger.d('🔥 : [FireStore]: [$action]');
    if (result != null) {
      loggerWithEmoji.d(result);
    }
  }

  static void logRepo({
    required String repoName,
    required String functionName,
    dynamic log,
  }) {
    titleLogger.d('🌐 : [Repo]: [$repoName] [$functionName]');
    if (log != null) {
      logger.d(log);
    }
  }

  static void logTheme(String log) {
    debugPrint('🌈 : [Theme] : $log');
  }

  static void logTranslation(String log) {
    debugPrint('🗣️ : [Translation] : $log');
  }

  static void logPage(String pageName, String log) {
    debugPrint('📃 : [Page] : [$pageName] : $log');
  }

  static void logAction(String instanceName, String log) {
    debugPrint('🎬 : [Action]: [$instanceName] : $log');
  }

  static void logInfo(String instanceName, String log) {
    debugPrint('ℹ️ : [Info]: [$instanceName] : $log');
  }

  static void logBlocObserver(String function, dynamic logBloc) {
    debugPrint('👁️ : [BlocObserver] [$function] : $logBloc');
    // log('👁️ : [BlocObserver] [$function] : $logBloc');
  }

  static void logCubit(String cubitName, String log) {
    debugPrint('🧊 : [Cubit]: [$cubitName] : $log');
  }

  static void logAuthStatus({required String authStatus}) {
    debugPrint('👉 : [Global Auth Status]: [$authStatus]');
  }

  static void logUserStatus({required String userStatus}) {
    debugPrint('👤 : [Global User Status]: [$userStatus] status');
  }

  static void logSubscribeStatus({required String subscribeStatus}) {
    debugPrint('🍀 : [Global Subscribe Status]: [$subscribeStatus] status');
  }

  static void logNetworkStatus({required String networkStatus}) {
    debugPrint('🍀 : [Global Network Status]: [$networkStatus] status');
  }

  static void logError(String instanceName, String log) {
    debugPrint('❌ : [Error]: [$instanceName] : $log');
  }

  static void logUpdateWallet({required String status}) {
    debugPrint('[Update Wallet]: $status');
  }

  static void logRevenueCat({required String status}) {
    debugPrint('😻 [RevenueCat]: $status');
  }

  static void logWatcher(String page, String function) {
    debugPrint('👀: [Watcher] [$page] : $function Updated');
  }
}
