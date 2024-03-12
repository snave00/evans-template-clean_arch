import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/constants/string_const.dart';

abstract class SharedPrefLocalDataSource {
  Future<bool> getIsFreshInstall();
  Future<void> setIsFreshInstall({required bool isFreshInstall});

  Future<String> getUserId();
  Future<void> setUserId({required String userId});

  Future<String> getIsarDir();
  Future<void> setIsarDir({required String isarDir});

  String getIsarName();
  Future<void> setIsarName({required String isarName});
}

class SharedPrefLocalDataSourceImpl implements SharedPrefLocalDataSource {
  final SharedPreferences prefs;

  SharedPrefLocalDataSourceImpl({
    required this.prefs,
  });

  // keys
  final isFreshFromInstallKey = 'is_fresh_install';
  final userIdKey = 'user_id';
  final isarDirKey = 'isar_dir';
  final isarNameKey = 'isar_name';

  @override
  Future<bool> getIsFreshInstall() async {
    final bool? isFreshInstall = prefs.getBool(isFreshFromInstallKey);
    return isFreshInstall ?? true;
  }

  @override
  Future<void> setIsFreshInstall({required bool isFreshInstall}) async {
    await prefs.setBool(isFreshFromInstallKey, isFreshInstall);
  }

  @override
  Future<String> getUserId() async {
    final String? userId = prefs.getString(userIdKey);
    return userId ?? '';
  }

  @override
  Future<void> setUserId({required String userId}) async {
    await prefs.setString(userIdKey, userId);
  }

  @override
  Future<String> getIsarDir() async {
    // saved folder name only
    final String? isarDirFolderName = prefs.getString(isarDirKey);
    final appDir = await getApplicationDocumentsDirectory();
    // combine updated app dir and foldername so it always updated
    final dir = '${appDir.path}/$isarDirFolderName';

    if (isarDirFolderName == null) {
      final appDir2 = await getApplicationDocumentsDirectory();
      final dir2 = appDir2.path;
      return dir2;
    }

    return dir;
  }

  @override
  Future<void> setIsarDir({required String isarDir}) async {
    await prefs.setString(isarDirKey, isarDir);
  }

  @override
  String getIsarName() {
    final String? isarName = prefs.getString(isarNameKey);
    return isarName ?? StringConst.defaultIsarName;
  }

  @override
  Future<void> setIsarName({required String isarName}) async {
    await prefs.setString(isarNameKey, isarName);
  }
}
