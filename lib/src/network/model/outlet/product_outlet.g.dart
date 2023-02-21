// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_outlet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductOutletPaging _$$_ProductOutletPagingFromJson(
        Map<String, dynamic> json) =>
    _$_ProductOutletPaging(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => ProductOutlet.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_ProductOutletPagingToJson(
        _$_ProductOutletPaging instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$_ProductOutlet _$$_ProductOutletFromJson(Map<String, dynamic> json) =>
    _$_ProductOutlet(
      id: json['id'] as String?,
      productId: json['product_id'] as String?,
      outletId: json['outlet_id'] as String?,
      userId: json['user_id'] as String?,
      product: json['product'] == null
          ? null
          : DetailProdukData.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProductOutletToJson(_$_ProductOutlet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'outlet_id': instance.outletId,
      'user_id': instance.userId,
      'product': instance.product,
    };

_$_DetailProdukData _$$_DetailProdukDataFromJson(Map<String, dynamic> json) =>
    _$_DetailProdukData(
      id: json['id'] as String?,
      name: json['name'] as String?,
      omset: json['omset'] as int?,
      description: json['description'] as String?,
      price: json['price'] as int?,
      pricePerUnit: json['price_per_unit'] as int?,
      image: json['image'] as String?,
      categoryId: json['category_id'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$_DetailProdukDataToJson(_$_DetailProdukData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'omset': instance.omset,
      'description': instance.description,
      'price': instance.price,
      'price_per_unit': instance.pricePerUnit,
      'image': instance.image,
      'category_id': instance.categoryId,
      'updated_at': instance.updatedAt,
    };

_$_ProductOutletAdd _$$_ProductOutletAddFromJson(Map<String, dynamic> json) =>
    _$_ProductOutletAdd(
      status: json['status'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_ProductOutletAddToJson(_$_ProductOutletAdd instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
