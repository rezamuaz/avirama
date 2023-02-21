// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Customer _$$_CustomerFromJson(Map<String, dynamic> json) => _$_Customer(
      id: json['id'] as int,
      customerName: json['nama_customer'] as String,
      phoneNumber: json['no_wa'] as String,
      area: json['area'] as String,
      age: json['age'] as String?,
      gender: json['gender'] as String?,
      status: json['status'] as String?,
      buyFor: json['buy_for'] as String?,
      productItem: json['item_product'] as String?,
      merk: json['merk'] as String?,
      size: json['size'] as String?,
      buyVol: json['vol_buy'] as String?,
      priceBag: json['price_bag'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$_CustomerToJson(_$_Customer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_customer': instance.customerName,
      'no_wa': instance.phoneNumber,
      'area': instance.area,
      'age': instance.age,
      'gender': instance.gender,
      'status': instance.status,
      'buy_for': instance.buyFor,
      'item_product': instance.productItem,
      'merk': instance.merk,
      'size': instance.size,
      'vol_buy': instance.buyVol,
      'price_bag': instance.priceBag,
      'note': instance.note,
    };

_$_CustomerRequest _$$_CustomerRequestFromJson(Map<String, dynamic> json) =>
    _$_CustomerRequest(
      customerName: json['nama_customer'] as String,
      phoneNumber: json['no_wa'] as String,
      area: json['area'] as String,
      age: json['age'] as String?,
      gender: json['gender'] as String?,
      status: json['status'] as String?,
      buyFor: json['buy_for'] as String?,
      productItem: json['item_product'] as String?,
      merk: json['merk'] as String?,
      size: json['size'] as String?,
      buyVol: json['vol_buy'] as String?,
      priceBag: json['price_bag'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$_CustomerRequestToJson(_$_CustomerRequest instance) =>
    <String, dynamic>{
      'nama_customer': instance.customerName,
      'no_wa': instance.phoneNumber,
      'area': instance.area,
      'age': instance.age,
      'gender': instance.gender,
      'status': instance.status,
      'buy_for': instance.buyFor,
      'item_product': instance.productItem,
      'merk': instance.merk,
      'size': instance.size,
      'vol_buy': instance.buyVol,
      'price_bag': instance.priceBag,
      'note': instance.note,
    };
