import 'package:freezed_annotation/freezed_annotation.dart';

part 'master_product.freezed.dart';
part 'master_product.g.dart';

@freezed
class MasterProductPaging with _$MasterProductPaging {
  factory MasterProductPaging(
      {required String? message,
      required int? currentPage,
      required int? nextPage,
      required int? totalRows,
      required List<MasterProduct>? data}) = _MasterProductPaging;

  factory MasterProductPaging.fromJson(Map<String, dynamic> json) =>
      _$MasterProductPagingFromJson(json);
}

@freezed
class MasterProduct with _$MasterProduct {
  factory MasterProduct(
      {required int? id,
      required String? name,
      @JsonKey(name: "code_product", defaultValue: "")
          required String? codeProduct,
      @JsonKey(defaultValue: "")
          required String? description,
      @JsonKey(defaultValue: "")
          required String? price,
      @JsonKey(defaultValue: "")
          required String? image,
      @JsonKey(name: "created_at")
          required String? createdAt,
      @JsonKey(name: "updated_at")
          required String? updatedAt}) = _MasterProduct;

  factory MasterProduct.fromJson(Map<String, dynamic> json) =>
      _$MasterProductFromJson(json);
}
