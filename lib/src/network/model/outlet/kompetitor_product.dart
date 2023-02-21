import 'package:freezed_annotation/freezed_annotation.dart';

part 'kompetitor_product.freezed.dart';
part 'kompetitor_product.g.dart';

@freezed
class KompetitorProduct with _$KompetitorProduct {
  factory KompetitorProduct({
    int? id,
    @JsonKey(name: "brand_id") String? brandId,
    // @JsonKey(name: "unit_id") String? unitId,
    // @JsonKey(name: "unit_pack_id") String? unitPackId,
    String? name,
    // int? price,
    // @JsonKey(name: "price_per_unit") String? pricePerUnit,
    // String? size,
    // String? vol,
    // String? pack,
    // String? type,
    String? cat,
    String? promo,
    String? priode,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
    String? image,
    int? omset,
    @JsonKey(name: "id_outlet") int? idOutlet,
  }) = _KompetitorProduct;

  factory KompetitorProduct.fromJson(Map<String, dynamic> json) =>
      _$KompetitorProductFromJson(json);
}
