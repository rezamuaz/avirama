// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outlet_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OutletReport _$OutletReportFromJson(Map<String, dynamic> json) {
  return _OutletReport.fromJson(json);
}

/// @nodoc
mixin _$OutletReport {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get long => throw _privateConstructorUsedError;
  String? get lang => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get radius => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "target_bulanan")
  String? get targetBulanan => throw _privateConstructorUsedError;
  @JsonKey(name: "is_complete")
  bool? get isComplete => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_OutletReport implements _OutletReport {
  _$_OutletReport(
      {required this.id,
      required this.name,
      required this.address,
      required this.long,
      required this.lang,
      required this.image,
      required this.radius,
      required this.status,
      @JsonKey(name: "target_bulanan") required this.targetBulanan,
      @JsonKey(name: "is_complete") required this.isComplete});

  factory _$_OutletReport.fromJson(Map<String, dynamic> json) =>
      _$$_OutletReportFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? address;
  @override
  final String? long;
  @override
  final String? lang;
  @override
  final String? image;
  @override
  final String? radius;
  @override
  final String? status;
  @override
  @JsonKey(name: "target_bulanan")
  final String? targetBulanan;
  @override
  @JsonKey(name: "is_complete")
  final bool? isComplete;

  @override
  String toString() {
    return 'OutletReport(id: $id, name: $name, address: $address, long: $long, lang: $lang, image: $image, radius: $radius, status: $status, targetBulanan: $targetBulanan, isComplete: $isComplete)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_OutletReportToJson(
      this,
    );
  }
}

abstract class _OutletReport implements OutletReport {
  factory _OutletReport(
          {required final String? id,
          required final String? name,
          required final String? address,
          required final String? long,
          required final String? lang,
          required final String? image,
          required final String? radius,
          required final String? status,
          @JsonKey(name: "target_bulanan") required final String? targetBulanan,
          @JsonKey(name: "is_complete") required final bool? isComplete}) =
      _$_OutletReport;

  factory _OutletReport.fromJson(Map<String, dynamic> json) =
      _$_OutletReport.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get address;
  @override
  String? get long;
  @override
  String? get lang;
  @override
  String? get image;
  @override
  String? get radius;
  @override
  String? get status;
  @override
  @JsonKey(name: "target_bulanan")
  String? get targetBulanan;
  @override
  @JsonKey(name: "is_complete")
  bool? get isComplete;
}
