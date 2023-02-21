import 'package:freezed_annotation/freezed_annotation.dart';

part 'promo_periode.freezed.dart';
part 'promo_periode.g.dart';

@freezed
class PromoPeriode with _$PromoPeriode {
  factory PromoPeriode({
    int? id,
    @JsonKey(name: "id_promo") int? idPromo,
    @JsonKey(name: "harga_promo") int? hargaPromo,
    @JsonKey(name: "harga_normal") int? hargaNormal,
    String? keterangan,
    String? periode,
    String? pcs,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
  }) = _PromoPeriode;

  factory PromoPeriode.fromJson(Map<String, dynamic> json) =>
      _$PromoPeriodeFromJson(json);
}
