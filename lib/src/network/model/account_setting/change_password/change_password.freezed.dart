// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_password.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChangePassword _$ChangePasswordFromJson(Map<String, dynamic> json) {
  return _ChangePassword.fromJson(json);
}

/// @nodoc
mixin _$ChangePassword {
  @JsonKey(name: "current_password")
  String? get currentPassword => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_ChangePassword extends _ChangePassword {
  const _$_ChangePassword(
      {@JsonKey(name: "current_password") this.currentPassword,
      required this.password})
      : super._();

  factory _$_ChangePassword.fromJson(Map<String, dynamic> json) =>
      _$$_ChangePasswordFromJson(json);

  @override
  @JsonKey(name: "current_password")
  final String? currentPassword;
  @override
  final String password;

  @override
  String toString() {
    return 'ChangePassword(currentPassword: $currentPassword, password: $password)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChangePasswordToJson(
      this,
    );
  }
}

abstract class _ChangePassword extends ChangePassword {
  const factory _ChangePassword(
      {@JsonKey(name: "current_password") final String? currentPassword,
      required final String password}) = _$_ChangePassword;
  const _ChangePassword._() : super._();

  factory _ChangePassword.fromJson(Map<String, dynamic> json) =
      _$_ChangePassword.fromJson;

  @override
  @JsonKey(name: "current_password")
  String? get currentPassword;
  @override
  String get password;
}
