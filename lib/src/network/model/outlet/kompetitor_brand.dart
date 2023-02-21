import 'package:freezed_annotation/freezed_annotation.dart';

part 'kompetitor_brand.freezed.dart';
part 'kompetitor_brand.g.dart';

@freezed
class KompetitorBrand with _$KompetitorBrand {
  factory KompetitorBrand({int? id, String? name}) = _KompetitorBrand;

  factory KompetitorBrand.fromJson(Map<String, dynamic> json) =>
      _$KompetitorBrandFromJson(json);
}
