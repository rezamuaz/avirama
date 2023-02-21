// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_outlet_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductOutletResponse _$ProductOutletResponseFromJson(
    Map<String, dynamic> json) {
  return _ProductOutletResponse.fromJson(json);
}

/// @nodoc
mixin _$ProductOutletResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_ProductOutletResponse implements _ProductOutletResponse {
  _$_ProductOutletResponse({required this.status, required this.message});

  factory _$_ProductOutletResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ProductOutletResponseFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;

  @override
  String toString() {
    return 'ProductOutletResponse(status: $status, message: $message)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductOutletResponseToJson(
      this,
    );
  }
}

abstract class _ProductOutletResponse implements ProductOutletResponse {
  factory _ProductOutletResponse(
      {required final bool? status,
      required final String? message}) = _$_ProductOutletResponse;

  factory _ProductOutletResponse.fromJson(Map<String, dynamic> json) =
      _$_ProductOutletResponse.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
}
