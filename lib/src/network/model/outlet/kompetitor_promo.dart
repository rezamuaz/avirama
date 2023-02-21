import 'package:freezed_annotation/freezed_annotation.dart';

part 'kompetitor_promo.freezed.dart';
part 'kompetitor_promo.g.dart';

@freezed
class KompetitorPromo with _$KompetitorPromo {
  factory KompetitorPromo({
    int? id,
    @JsonKey(name: "nama_promosi") String? namaPromosi,
    String? image,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
    @JsonKey(name: "id_outlet") int? idOutlet,
    int? harga,
  }) = _KompetitorPromo;

  factory KompetitorPromo.fromJson(Map<String, dynamic> json) =>
      _$KompetitorPromoFromJson(json);
}
