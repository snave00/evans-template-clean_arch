import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/promo_entity.dart';

part 'promo_model.freezed.dart';
part 'promo_model.g.dart';

@freezed
class PromoModel with _$PromoModel {
  PromoModel._();

  factory PromoModel({
    final String? promoId,
    final String? promoName,
    final String? promoDesc,
    final String? bannerImage,
  }) = _PromoModel;

  factory PromoModel.empty() {
    return PromoModel(
      promoId: '',
      promoName: '',
      promoDesc: '',
      bannerImage: '',
    );
  }

  factory PromoModel.fromJson(Map<String, dynamic> json) =>
      _$PromoModelFromJson(json);

  PromoEntity toEntity() => PromoEntity(
        promoId: promoId ?? '',
        promoName: promoName ?? '',
        promoDesc: promoDesc ?? '',
        bannerImage: bannerImage ?? '',
      );
}
