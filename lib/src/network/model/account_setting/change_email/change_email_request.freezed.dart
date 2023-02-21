// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_email_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChangeEmailRequest _$ChangeEmailRequestFromJson(Map<String, dynamic> json) {
  return _ChangeEmailRequest.fromJson(json);
}

/// @nodoc
mixin _$ChangeEmailRequest {
  String get email => throw _privateConstructorUsedError;
  String? get key => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_ChangeEmailRequest extends _ChangeEmailRequest {
  const _$_ChangeEmailRequest({required this.email, this.key}) : super._();

  factory _$_ChangeEmailRequest.fromJson(Map<String, dynamic> json) =>
      _$$_ChangeEmailRequestFromJson(json);

  @override
  final String email;
  @override
  final String? key;

  @override
  String toString() {
    return 'ChangeEmailRequest(email: $email, key: $key)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChangeEmailRequestToJson(
      this,
    );
  }
}

abstract class _ChangeEmailRequest extends ChangeEmailRequest {
  const factory _ChangeEmailRequest(
      {required final String email, final String? key}) = _$_ChangeEmailRequest;
  const _ChangeEmailRequest._() : super._();

  factory _ChangeEmailRequest.fromJson(Map<String, dynamic> json) =
      _$_ChangeEmailRequest.fromJson;

  @override
  String get email;
  @override
  String? get key;
}
