// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MasterProductPaging _$$_MasterProductPagingFromJson(
        Map<String, dynamic> json) =>
    _$_MasterProductPaging(
      message: json['message'] as String?,
      currentPage: json['currentPage'] as int?,
      nextPage: json['nextPage'] as int?,
      totalRows: json['totalRows'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => MasterProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MasterProductPagingToJson(
        _$_MasterProductPaging instance) =>
    <String, dynamic>{
      'message': instance.message,
      'currentPage': instance.currentPage,
      'nextPage': instance.nextPage,
      'totalRows': instance.totalRows,
      'data': instance.data,
    };

_$_MasterProduct _$$_MasterProductFromJson(Map<String, dynamic> json) =>
    _$_MasterProduct(
      id: json['id'] as int?,
      name: json['name'] as String?,
      codeProduct: json['code_product'] as String? ?? '',
      description: json['description'] as String? ?? '',
      price: json['price'] as String? ?? '',
      image: json['image'] as String? ?? '',
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$_MasterProductToJson(_$_MasterProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code_product': instance.codeProduct,
      'description': instance.description,
      'price': instance.price,
      'image': instance.image,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
