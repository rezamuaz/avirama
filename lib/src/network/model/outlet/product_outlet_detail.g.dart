// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_outlet_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductOutletDetail _$$_ProductOutletDetailFromJson(
        Map<String, dynamic> json) =>
    _$_ProductOutletDetail(
      id: json['id'] as String?,
      productAssignOutletId: json['product_assign_outlet_id'] as String?,
      userId: json['user_id'] as String?,
      productId: json['product_id'] as String?,
      outletId: json['outlet_id'] as String?,
      name: json['name'] as String?,
      foto: json['foto'] as String?,
      date: json['date'] as String?,
      price: json['price'] as int?,
      codeProduct: json['code_product'] as String?,
      initialStock: json['initial_stock'] as int?,
      soldStock: json['sold_stock'] as int?,
      finalStock: json['final_stock'] as int?,
      displayStockAwal: json['display_stock'] as int?,
      displayStockAkhir: json['display_sak'] as int?,
      wherehouseStockAwal: json['wherehouse_stock'] as int?,
      wherehouseStockAkhir: json['warehouse_sak'] as int?,
      returnGood: json['return'] as int?,
      facing: json['facing'] as int?,
      tir: json['tir'] as int?,
      comeGood: json['come_good'] as int?,
      omset: json['omset'] as int?,
      description: json['description'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$_ProductOutletDetailToJson(
        _$_ProductOutletDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_assign_outlet_id': instance.productAssignOutletId,
      'user_id': instance.userId,
      'product_id': instance.productId,
      'outlet_id': instance.outletId,
      'name': instance.name,
      'foto': instance.foto,
      'date': instance.date,
      'price': instance.price,
      'code_product': instance.codeProduct,
      'initial_stock': instance.initialStock,
      'sold_stock': instance.soldStock,
      'final_stock': instance.finalStock,
      'display_stock': instance.displayStockAwal,
      'display_sak': instance.displayStockAkhir,
      'wherehouse_stock': instance.wherehouseStockAwal,
      'warehouse_sak': instance.wherehouseStockAkhir,
      'return': instance.returnGood,
      'facing': instance.facing,
      'tir': instance.tir,
      'come_good': instance.comeGood,
      'omset': instance.omset,
      'description': instance.description,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
