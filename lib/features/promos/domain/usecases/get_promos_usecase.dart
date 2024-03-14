import 'package:fpdart/fpdart.dart';

import '../../../../../core/domain/failures/failures.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../entities/promo_entity.dart';
import '../repositories/promo_repo.dart';

class GetPromosUseCase implements UseCase<List<PromoEntity>, NoParams> {
  final PromoRepo promoRepo;

  GetPromosUseCase({required this.promoRepo});

  @override
  Future<Either<Failure, List<PromoEntity>>> call(NoParams noParams) async {
    return await promoRepo.getPromos();
  }
}
