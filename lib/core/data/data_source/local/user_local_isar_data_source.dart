import '../../../../../utils/helpers/isar/isar_helper.dart';
import '../../models/isar_models/user_isar_model.dart';
import 'shared_pref_local_data_source.dart';

/// * Local Data Source using Isar
/// - add to injection.dart
/// - make sure to use isar models and not entities
abstract class UserLocalIsarDataSource {
  Future<UserIsarModel> getUser({required String userId});

  Future<void> addInitialUser({
    required String userId,
    required UserIsarModel userIsarModel,
  });

  Future<void> updateUser({required UserIsarModel userIsarModel});

  Stream<void>? watchUser();

  // Future<void> deleteUser({required String userId});
}

class UserLocalIsarDataSourceImpl implements UserLocalIsarDataSource {
  final SharedPrefLocalDataSource sharedPrefLocalDataSource;

  UserLocalIsarDataSourceImpl({
    required this.sharedPrefLocalDataSource,
  });

  @override
  Future<UserIsarModel> getUser({required String userId}) async {
    final isar = IsarHelper.getInstance();
    return await isar?.userIsarModels.getByUserId(userId) ??
        UserIsarModel.empty();

    // * 3 ways to get user
    // 1. get user by isarId not userId.
    // return await _isar?.userIsarModels.get(123) ?? UserIsarModel.empty();

    // 2. get user by using where query
    // return await _isar?.userIsarModels
    //         .where()
    //         .userIdEqualTo(userId)
    //         .findFirst() ??
    //     UserIsarModel.empty();

    // 3. get user by using unique index using `@Index(unique: true, replace: true)`
    // - used the getByUserId() from auto generated
    // - only use this if your id is strictly unique
    // ✅ return await _isar?.userIsarModels.getByUserId(userId) ??
    //     UserIsarModel.empty();
  }

  @override
  Future<void> addInitialUser({
    required String userId,
    required UserIsarModel userIsarModel,
  }) async {
    final isar = IsarHelper.getInstance();

    await isar?.writeTxn(() async {
      await isar.userIsarModels.putByUserId(userIsarModel.copyWith(
        userId: userId,
        lastUpdated: DateTime.now(),
      ));
    });

    // * 2 ways to add/update/put
    // 1. put using isarId. auto converts the userId to isarId hash
    // - auto convert the userId to isarId hash so it knows what is the isarId to uddate
    // ✅ await _isar?.userIsarModels.put(userIsarModel);

    // 2. put user by using unique index using `@Index(unique: true, replace: true)`
    // - used the putByUserId() from auto generated
    // - only use this if your id is strictly unique
    // await _isar?.userIsarModels.putByUserId(userIsarModel);

    // await await _isar?.writeTxn()
    // - always needed in put() & delete()
    // - use this transaction to combine multiple database operations
  }

  @override
  Future<void> updateUser({required UserIsarModel userIsarModel}) async {
    final isar = IsarHelper.getInstance();

    // insert & update. auto detect if insert or delete by id
    await isar?.writeTxn(() async {
      await isar.userIsarModels.putByUserId(userIsarModel.copyWith(
        lastUpdated: DateTime.now(),
      ));
    });
  }

  @override
  Stream<void>? watchUser() {
    final isar = IsarHelper.getInstance();

    final userChanged = isar?.userIsarModels.watchLazy();
    return userChanged;
  }

  // @override
  // Future<void> deleteUser({required String userId}) async {
  //   await _isar?.writeTxn(() async {
  //     await _isar?.userIsarModels.deleteByUserId(userId);
  //   });
  //   // TODO: If user deleted, delete also all data in other collections

  //   // * 2 ways to delete
  //   // 1. put using isarId. auto converts the userId to isarId hash
  //   // - auto convert the userId to isarId hash so it knows what is the isarId to delete
  //   // await _isar?.userIsarModels.delete(123);

  //   // 2. delete user by using unique index using `@Index(unique: true, replace: true)`
  //   // - used the deleteByUserId() from auto generated
  //   // - only use this if your id is strictly unique
  //   // ✅  await _isar?.userIsarModels.deleteByUserId(userId);
  // }
}
