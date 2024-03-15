import 'package:fpdart/fpdart.dart';

import '../../../../core/domain/failures/failures.dart';
import '../entities/store_entity.dart';

abstract class StoreRepo {
  Future<Either<Failure, List<StoreEntity>>> getStores();
  Future<Either<Failure, StoreEntity>> getStore({required String storeId});
}
