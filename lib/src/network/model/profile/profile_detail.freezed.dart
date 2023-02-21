// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfileDetail _$ProfileDetailFromJson(Map<String, dynamic> json) {
  return _ProfileDetail.fromJson(json);
}

/// @nodoc
mixin _$ProfileDetail {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get foto => throw _privateConstructorUsedError;
  String? get salary => throw _privateConstructorUsedError;
  int? get percent => throw _privateConstructorUsedError;
  @JsonKey(name: "total_attendance_mountly")
  int? get totalAttendanceMountly => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_ProfileDetail implements _ProfileDetail {
  _$_ProfileDetail(
      {required this.id,
      required this.name,
      required this.foto,
      required this.salary,
      required this.percent,
      @JsonKey(name: "total_attendance_mountly")
          required this.totalAttendanceMountly});

  factory _$_ProfileDetail.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileDetailFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? foto;
  @override
  final String? salary;
  @override
  final int? percent;
  @override
  @JsonKey(name: "total_attendance_mountly")
  final int? totalAttendanceMountly;

  @override
  String toString() {
    return 'ProfileDetail(id: $id, name: $name, foto: $foto, salary: $salary, percent: $percent, totalAttendanceMountly: $totalAttendanceMountly)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileDetailToJson(
      this,
    );
  }
}

abstract class _ProfileDetail implements ProfileDetail {
  factory _ProfileDetail(
      {required final int? id,
      required final String? name,
      required final String? foto,
      required final String? salary,
      required final int? percent,
      @JsonKey(name: "total_attendance_mountly")
          required final int? totalAttendanceMountly}) = _$_ProfileDetail;

  factory _ProfileDetail.fromJson(Map<String, dynamic> json) =
      _$_ProfileDetail.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get foto;
  @override
  String? get salary;
  @override
  int? get percent;
  @override
  @JsonKey(name: "total_attendance_mountly")
  int? get totalAttendanceMountly;
}
