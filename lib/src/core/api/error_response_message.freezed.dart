// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_response_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ErrorResponseMessage _$ErrorResponseMessageFromJson(Map<String, dynamic> json) {
  return _ErrorResponseMessage.fromJson(json);
}

/// @nodoc
mixin _$ErrorResponseMessage {
  String? get message => throw _privateConstructorUsedError;
  Map<String, dynamic>? get errors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_ErrorResponseMessage extends _ErrorResponseMessage {
  const _$_ErrorResponseMessage(
      {this.message, final Map<String, dynamic>? errors})
      : _errors = errors,
        super._();

  factory _$_ErrorResponseMessage.fromJson(Map<String, dynamic> json) =>
      _$$_ErrorResponseMessageFromJson(json);

  @override
  final String? message;
  final Map<String, dynamic>? _errors;
  @override
  Map<String, dynamic>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableMapView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ErrorResponseMessage(message: $message, errors: $errors)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_ErrorResponseMessageToJson(
      this,
    );
  }
}

abstract class _ErrorResponseMessage extends ErrorResponseMessage {
  const factory _ErrorResponseMessage(
      {final String? message,
      final Map<String, dynamic>? errors}) = _$_ErrorResponseMessage;
  const _ErrorResponseMessage._() : super._();

  factory _ErrorResponseMessage.fromJson(Map<String, dynamic> json) =
      _$_ErrorResponseMessage.fromJson;

  @override
  String? get message;
  @override
  Map<String, dynamic>? get errors;
}
