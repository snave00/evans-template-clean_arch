import 'package:fpdart/fpdart.dart';

import '../../../../core/data/exceptions/cache_exception.dart';
import '../../../../core/domain/failures/failures.dart';
import '../../../../utils/constants/error_const.dart';
import '../../../../utils/logs/custom_log.dart';
import '../../domain/entities/store_entity.dart';
import '../../domain/repositories/store_repo.dart';
import '../data_source/store_mock_data_source.dart';

class StoreRepoImpl implements StoreRepo {
  static String runtimeTypeName = (StoreRepoImpl).toString();

  final StoreMockDataSource storeMockDataSource;

  StoreRepoImpl({
    required this.storeMockDataSource,
  });

  @override
  Future<Either<Failure, List<StoreEntity>>> getStores() async {
    try {
      final stores = await storeMockDataSource.getStores();

      final storesToEntity = stores.map((store) => store.toEntity()).toList();
      final storesToJson =
          storesToEntity.map((store) => store.toJson()).toList();

      Log.logRepo(
        repoName: runtimeTypeName,
        functionName: 'getStores success: ',
        log: storesToJson,
      );
      return right(storesToEntity);
    } on CacheException catch (e) {
      return left(CacheFailure(e.toString()));
    } catch (e) {
      return left(GeneralFailure(
          '${ErrorConst.generalErrorMessage}. getStores\n${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, StoreEntity>> getStore({
    required String storeId,
  }) async {
    try {
      final store = await storeMockDataSource.getStore(storeId: storeId);

      final storeToEntity = store.toEntity();
      final storeToJson = storeToEntity.toJson();

      Log.logRepo(
        repoName: runtimeTypeName,
        functionName: 'getStore success: ',
        log: storeToJson,
      );
      return right(storeToEntity);
    } on CacheException catch (e) {
      return left(CacheFailure(e.toString()));
    } catch (e) {
      return left(GeneralFailure(
          '${ErrorConst.generalErrorMessage}. getStore\n${e.toString()}'));
    }
  }
}
