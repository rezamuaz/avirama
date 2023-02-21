// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) {
  return _AuthResponse.fromJson(json);
}

/// @nodoc
mixin _$AuthResponse {
  User get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_token')
  String get bearerToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_AuthResponse extends _AuthResponse {
  const _$_AuthResponse(
      {required this.data,
      @JsonKey(name: 'access_token') required this.bearerToken})
      : super._();

  factory _$_AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$$_AuthResponseFromJson(json);

  @override
  final User data;
  @override
  @JsonKey(name: 'access_token')
  final String bearerToken;

  @override
  String toString() {
    return 'AuthResponse(data: $data, bearerToken: $bearerToken)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthResponseToJson(
      this,
    );
  }
}

abstract class _AuthResponse extends AuthResponse {
  const factory _AuthResponse(
          {required final User data,
          @JsonKey(name: 'access_token') required final String bearerToken}) =
      _$_AuthResponse;
  const _AuthResponse._() : super._();

  factory _AuthResponse.fromJson(Map<String, dynamic> json) =
      _$_AuthResponse.fromJson;

  @override
  User get data;
  @override
  @JsonKey(name: 'access_token')
  String get bearerToken;
}
