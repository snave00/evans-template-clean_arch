import 'package:fpdart/fpdart.dart';

import '../../../../../core/domain/failures/failures.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../entities/store_entity.dart';
import '../repositories/store_repo.dart';

class GetStoresUseCase implements UseCase<List<StoreEntity>, NoParams> {
  final StoreRepo storeRepo;

  GetStoresUseCase({required this.storeRepo});

  @override
  Future<Either<Failure, List<StoreEntity>>> call(NoParams noParams) async {
    return await storeRepo.getStores();
  }
}
