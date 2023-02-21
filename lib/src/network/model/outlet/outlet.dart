import 'package:freezed_annotation/freezed_annotation.dart';

part 'outlet.freezed.dart';
part 'outlet.g.dart';

@freezed
class SelectOutlet with _$SelectOutlet {
  const factory SelectOutlet({
    required String id,
    required String name,
    required String address,
    required String? long,
    required String? lang,
    required String radius,
    bool? is_complete,
  }) = _SelectOutlet;
  const SelectOutlet._();
  factory SelectOutlet.fromJson(Map<String, dynamic> map) =>
      _$SelectOutletFromJson(map);
}

@freezed
class Outlet with _$Outlet {
  const factory Outlet({
    required int id,
    required String name,
    required String address,
    required String? long,
    required String? lang,
    String? image,
    String? radius,
    String? status,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "target_bulanan") String? targetBulanan,
  }) = _Outlet;
  const Outlet._();
  factory Outlet.fromJson(Map<String, dynamic> map) => _$OutletFromJson(map);
}

@Freezed(copyWith: true)
class OutletRequest with _$OutletRequest {
  const factory OutletRequest({
    required String name,
    String? long,
    String? lang,
    required String radius,
    // String? image,
    String? address,
    @JsonKey(name: "target_bulanan") String? targetBulanan,
  }) = _OutletRequest;

  const OutletRequest._();

  factory OutletRequest.fromJson(Map<String, dynamic> map) =>
      _$OutletRequestFromJson(map);
}
