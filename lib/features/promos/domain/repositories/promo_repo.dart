import 'package:fpdart/fpdart.dart';

import '../../../../core/domain/failures/failures.dart';
import '../entities/promo_entity.dart';

abstract class PromoRepo {
  Future<Either<Failure, List<PromoEntity>>> getPromos();
}
