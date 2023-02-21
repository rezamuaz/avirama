// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kompetitor_brand.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KompetitorBrand _$KompetitorBrandFromJson(Map<String, dynamic> json) {
  return _KompetitorBrand.fromJson(json);
}

/// @nodoc
mixin _$KompetitorBrand {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_KompetitorBrand implements _KompetitorBrand {
  _$_KompetitorBrand({this.id, this.name});

  factory _$_KompetitorBrand.fromJson(Map<String, dynamic> json) =>
      _$$_KompetitorBrandFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'KompetitorBrand(id: $id, name: $name)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_KompetitorBrandToJson(
      this,
    );
  }
}

abstract class _KompetitorBrand implements KompetitorBrand {
  factory _KompetitorBrand({final int? id, final String? name}) =
      _$_KompetitorBrand;

  factory _KompetitorBrand.fromJson(Map<String, dynamic> json) =
      _$_KompetitorBrand.fromJson;

  @override
  int? get id;
  @override
  String? get name;
}
