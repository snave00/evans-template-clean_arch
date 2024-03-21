import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/remote_models/promo_model.dart';

part 'promo_entity.freezed.dart';
part 'promo_entity.g.dart';

@freezed
class PromoEntity with _$PromoEntity {
  PromoEntity._();

  factory PromoEntity({
    required final String promoId,
    required final String promoName,
    required final String promoDesc,
    required final String bannerImage,
  }) = _PromoEntity;

  factory PromoEntity.empty() {
    return PromoEntity(
      promoId: '',
      promoName: '',
      promoDesc: '',
      bannerImage: '',
    );
  }

  PromoModel toRemoteModel() => PromoModel(
        promoId: promoId,
        promoName: promoName,
        promoDesc: promoDesc,
        bannerImage: bannerImage,
      );

  factory PromoEntity.fromJson(Map<String, dynamic> json) =>
      _$PromoEntityFromJson(json);
}
