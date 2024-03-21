import 'package:fpdart/fpdart.dart';

import '../../../../../core/domain/failures/failures.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../entities/store_entity.dart';
import '../repositories/store_repo.dart';

class GetStoreUseCase implements UseCase<StoreEntity, String> {
  final StoreRepo storeRepo;

  GetStoreUseCase({required this.storeRepo});

  @override
  Future<Either<Failure, StoreEntity>> call(String storeId) async {
    return await storeRepo.getStore(storeId: storeId);
  }
}
