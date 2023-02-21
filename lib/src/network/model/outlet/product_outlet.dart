import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_outlet.freezed.dart';
part 'product_outlet.g.dart';

@freezed
class ProductOutletPaging with _$ProductOutletPaging {
  factory ProductOutletPaging(
          {bool? status,
          String? message,
          @JsonKey(defaultValue: []) required List<ProductOutlet>? data}) =
      _ProductOutletPaging;

  factory ProductOutletPaging.fromJson(Map<String, dynamic> json) =>
      _$ProductOutletPagingFromJson(json);
}

@freezed
class ProductOutlet with _$ProductOutlet {
  factory ProductOutlet({
    required String? id,
    @JsonKey(name: 'product_id') required String? productId,
    @JsonKey(name: 'outlet_id') required String? outletId,
    @JsonKey(name: 'user_id') required String? userId,
    required DetailProdukData? product,
  }) = _ProductOutlet;

  factory ProductOutlet.fromJson(Map<String, dynamic> json) =>
      _$ProductOutletFromJson(json);
}

@freezed
class DetailProdukData with _$DetailProdukData {
  factory DetailProdukData({
    required String? id,
    required String? name,
    required int? omset,
    required String? description,
    required int? price,
    @JsonKey(name: 'price_per_unit') required int? pricePerUnit,
    required String? image,
    @JsonKey(name: 'category_id') required String? categoryId,
    @JsonKey(name: 'updated_at') required String? updatedAt,
  }) = _DetailProdukData;

  factory DetailProdukData.fromJson(Map<String, dynamic> json) =>
      _$DetailProdukDataFromJson(json);
}

@freezed
class ProductOutletAdd with _$ProductOutletAdd {
  factory ProductOutletAdd({required bool? status, required String? message}) =
      _ProductOutletAdd;

  factory ProductOutletAdd.fromJson(Map<String, dynamic> json) =>
      _$ProductOutletAddFromJson(json);
}
