import 'package:freezed_annotation/freezed_annotation.dart';

part 'outlet_info.freezed.dart';
part 'outlet_info.g.dart';

@freezed
class OutletInfo with _$OutletInfo {
  factory OutletInfo({
    @JsonKey(name: "produk", defaultValue: 0) int? product,
    @JsonKey(name: "kompetitor", defaultValue: 0) int? competitor,
    @JsonKey(name: "promo", defaultValue: 0) int? promo,
    @JsonKey(name: "kunjungan", defaultValue: 0) int? kunjungan,
    @JsonKey(name: "data") OutletInfoDetail? dataOutlet,
  }) = _OutletInfo;

  factory OutletInfo.fromJson(Map<String, dynamic> json) =>
      _$OutletInfoFromJson(json);
}

@freezed
class OutletInfoDetail with _$OutletInfoDetail {
  factory OutletInfoDetail({
    int? id,
    String? name,
    String? address,
    String? long,
    String? lang,
    String? image,
    String? radius,
    @JsonKey(name: "deleted_at") String? deletedAt,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
    String? status,
    @JsonKey(name: "target_bulanan") String? targetBulanan,
    @JsonKey(name: "id_principal") String? idPrincipal,
    @JsonKey(name: "kode_outlet") String? kodeOutlet,
  }) = _OutletInfoDetail;

  factory OutletInfoDetail.fromJson(Map<String, dynamic> json) =>
      _$OutletInfoDetailFromJson(json);
}
