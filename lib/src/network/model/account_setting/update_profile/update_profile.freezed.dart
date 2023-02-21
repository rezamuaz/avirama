// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateProfile _$UpdateProfileFromJson(Map<String, dynamic> json) {
  return _UpdateProfile.fromJson(json);
}

/// @nodoc
mixin _$UpdateProfile {
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_UpdateProfile extends _UpdateProfile {
  const _$_UpdateProfile({required this.name}) : super._();

  factory _$_UpdateProfile.fromJson(Map<String, dynamic> json) =>
      _$$_UpdateProfileFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'UpdateProfile(name: $name)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateProfileToJson(
      this,
    );
  }
}

abstract class _UpdateProfile extends UpdateProfile {
  const factory _UpdateProfile({required final String name}) = _$_UpdateProfile;
  const _UpdateProfile._() : super._();

  factory _UpdateProfile.fromJson(Map<String, dynamic> json) =
      _$_UpdateProfile.fromJson;

  @override
  String get name;
}
