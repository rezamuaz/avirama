import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer.freezed.dart';
part 'customer.g.dart';

@freezed
class Customer with _$Customer {
  const factory Customer({
    required int id,
    @JsonKey(name: "nama_customer") required String customerName,
    @JsonKey(name: "no_wa") required String phoneNumber,
    required String area,
    String? age,
    String? gender,
    String? status,
    @JsonKey(name: "buy_for") String? buyFor,
    @JsonKey(name: "item_product") String? productItem,
    String? merk,
    String? size,
    @JsonKey(name: "vol_buy") String? buyVol,
    @JsonKey(name: "price_bag") String? priceBag,
    String? note,
  }) = _Customer;

  const Customer._();

  factory Customer.fromJson(Map<String, dynamic> map) =>
      _$CustomerFromJson(map);
}

@freezed
class CustomerRequest with _$CustomerRequest {
  const factory CustomerRequest({
    @JsonKey(name: "nama_customer") required String customerName,
    @JsonKey(name: "no_wa") required String phoneNumber,
    required String area,
    String? age,
    String? gender,
    String? status,
    @JsonKey(name: "buy_for") String? buyFor,
    @JsonKey(name: "item_product") String? productItem,
    String? merk,
    String? size,
    @JsonKey(name: "vol_buy") String? buyVol,
    @JsonKey(name: "price_bag") String? priceBag,
    String? note,
  }) = _CustomerRequest;

  const CustomerRequest._();

  factory CustomerRequest.fromJson(Map<String, dynamic> map) =>
      _$CustomerRequestFromJson(map);
}
