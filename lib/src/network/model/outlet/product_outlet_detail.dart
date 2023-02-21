import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_outlet_detail.freezed.dart';
part 'product_outlet_detail.g.dart';

@freezed
class ProductOutletDetail with _$ProductOutletDetail {
  factory ProductOutletDetail({
    required String? id,
    @JsonKey(name: "product_assign_outlet_id")
        required String? productAssignOutletId,
    @JsonKey(name: "user_id") required String? userId,
    @JsonKey(name: "product_id") required String? productId,
    @JsonKey(name: "outlet_id") required String? outletId,
    required String? name,
    required String? foto,
    required String? date,
    required int? price,
    @JsonKey(name: "code_product") required String? codeProduct,
    @JsonKey(name: "initial_stock") required int? initialStock,
    @JsonKey(name: "sold_stock") required int? soldStock,
    @JsonKey(name: "final_stock") required int? finalStock,
    @JsonKey(name: "display_stock") required int? displayStockAwal,
    @JsonKey(name: "display_sak") required int? displayStockAkhir,
    @JsonKey(name: "wherehouse_stock") required int? wherehouseStockAwal,
    @JsonKey(name: "warehouse_sak") required int? wherehouseStockAkhir,
    @JsonKey(name: "return") required int? returnGood,
    required int? facing,
    required int? tir,
    @JsonKey(name: "come_good") required int? comeGood,
    required int? omset,
    required String? description,
    @JsonKey(name: "created_at") required String? createdAt,
    @JsonKey(name: "updated_at") required String? updatedAt,
  }) = _ProductOutletDetail;

  factory ProductOutletDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductOutletDetailFromJson(json);
}
