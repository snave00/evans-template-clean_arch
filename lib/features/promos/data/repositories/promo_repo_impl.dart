import 'package:fpdart/fpdart.dart';

import '../../../../core/data/exceptions/cache_exception.dart';
import '../../../../core/domain/failures/failures.dart';
import '../../../../utils/constants/error_const.dart';
import '../../../../utils/logs/custom_log.dart';
import '../../domain/entities/promo_entity.dart';
import '../../domain/repositories/promo_repo.dart';
import '../data_source/promo_mock_data_source.dart';

class PromoRepoImpl implements PromoRepo {
  static String runtimeTypeName = (PromoRepoImpl).toString();

  final PromoMockDataSource promoMockDataSource;

  PromoRepoImpl({
    required this.promoMockDataSource,
  });

  @override
  Future<Either<Failure, List<PromoEntity>>> getPromos() async {
    try {
      final promos = await promoMockDataSource.getPromos();

      final promosToEntity = promos.map((promo) => promo.toEntity()).toList();
      final promosToJson =
          promosToEntity.map((promo) => promo.toJson()).toList();

      Log.logRepo(
        repoName: runtimeTypeName,
        functionName: 'getPromos success: ',
        log: promosToJson,
      );
      return right(promosToEntity);
    } on CacheException catch (e) {
      return left(CacheFailure(e.toString()));
    } catch (e) {
      return left(GeneralFailure(
          '${ErrorConst.generalErrorMessage}. getPromos\n${e.toString()}'));
    }
  }
}
