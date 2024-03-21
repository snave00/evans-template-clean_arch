import '../entities/product_entity.dart';
import '../repositories/product_repo.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/domain/failures/failures.dart';
import '../../../../core/domain/usecases/usecase.dart';

class GetProductsUseCase implements UseCase<List<ProductEntity>, String> {
  final ProductRepo productRepo;

  GetProductsUseCase({required this.productRepo});

  @override
  Future<Either<Failure, List<ProductEntity>>> call(String storeId) async {
    return await productRepo.getProducts(storeId: storeId);
  }
}
