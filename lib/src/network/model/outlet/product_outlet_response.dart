import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_outlet_response.freezed.dart';
part 'product_outlet_response.g.dart';

@freezed
class ProductOutletResponse with _$ProductOutletResponse {
  factory ProductOutletResponse(
      {required bool? status,
      required String? message}) = _ProductOutletResponse;

  factory ProductOutletResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductOutletResponseFromJson(json);
}
