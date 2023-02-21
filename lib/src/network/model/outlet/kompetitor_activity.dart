import 'package:freezed_annotation/freezed_annotation.dart';

part 'kompetitor_activity.freezed.dart';
part 'kompetitor_activity.g.dart';

@freezed
class KompetitorAktivitas with _$KompetitorAktivitas {
  factory KompetitorAktivitas({
    int? id,
    String? keterangan,
    String? image,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
    @JsonKey(name: "id_outlet") String? idOutlet,
  }) = _KompetitorAktivitas;

  factory KompetitorAktivitas.fromJson(Map<String, dynamic> json) =>
      _$KompetitorAktivitasFromJson(json);
}
