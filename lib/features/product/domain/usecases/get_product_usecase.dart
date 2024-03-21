import 'package:fpdart/fpdart.dart';

import '../../../../../core/domain/failures/failures.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../entities/product_entity.dart';
import '../params/product_params.dart';
import '../repositories/product_repo.dart';

class GetProductUseCase implements UseCase<ProductEntity, ProductParams> {
  final ProductRepo productRepo;

  GetProductUseCase({required this.productRepo});

  @override
  Future<Either<Failure, ProductEntity>> call(ProductParams params) async {
    return await productRepo.getProduct(
      storeId: params.storeId,
      productId: params.productId,
    );
  }
}
