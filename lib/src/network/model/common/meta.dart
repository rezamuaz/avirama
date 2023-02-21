import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta.freezed.dart';

part 'meta.g.dart';

@freezed
class Meta with _$Meta {
  const factory Meta({
    @JsonKey(name: 'current_page') int? currentPage,
    int? from,
    String? path,
    @JsonKey(name: 'per_page') int? perPage,
    int? to,
  }) = _Meta;

  const Meta._();

  factory Meta.fromJson(Map<String, dynamic> map) => _$MetaFromJson(map);
}
