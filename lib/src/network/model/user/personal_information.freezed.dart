// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal_information.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PersonalInformation _$PersonalInformationFromJson(Map<String, dynamic> json) {
  return _PersonalInformation.fromJson(json);
}

/// @nodoc
mixin _$PersonalInformation {
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'place_of_birth')
  String? get placeOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_birth')
  String? get dateOfBirth => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonalInformationCopyWith<PersonalInformation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalInformationCopyWith<$Res> {
  factory $PersonalInformationCopyWith(
          PersonalInformation value, $Res Function(PersonalInformation) then) =
      _$PersonalInformationCopyWithImpl<$Res, PersonalInformation>;
  @useResult
  $Res call(
      {String? gender,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      @JsonKey(name: 'place_of_birth') String? placeOfBirth,
      @JsonKey(name: 'date_of_birth') String? dateOfBirth});
}

/// @nodoc
class _$PersonalInformationCopyWithImpl<$Res, $Val extends PersonalInformation>
    implements $PersonalInformationCopyWith<$Res> {
  _$PersonalInformationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gender = freezed,
    Object? phoneNumber = freezed,
    Object? placeOfBirth = freezed,
    Object? dateOfBirth = freezed,
  }) {
    return _then(_value.copyWith(
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      placeOfBirth: freezed == placeOfBirth
          ? _value.placeOfBirth
          : placeOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PersonalInformationCopyWith<$Res>
    implements $PersonalInformationCopyWith<$Res> {
  factory _$$_PersonalInformationCopyWith(_$_PersonalInformation value,
          $Res Function(_$_PersonalInformation) then) =
      __$$_PersonalInformationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? gender,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      @JsonKey(name: 'place_of_birth') String? placeOfBirth,
      @JsonKey(name: 'date_of_birth') String? dateOfBirth});
}

/// @nodoc
class __$$_PersonalInformationCopyWithImpl<$Res>
    extends _$PersonalInformationCopyWithImpl<$Res, _$_PersonalInformation>
    implements _$$_PersonalInformationCopyWith<$Res> {
  __$$_PersonalInformationCopyWithImpl(_$_PersonalInformation _value,
      $Res Function(_$_PersonalInformation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gender = freezed,
    Object? phoneNumber = freezed,
    Object? placeOfBirth = freezed,
    Object? dateOfBirth = freezed,
  }) {
    return _then(_$_PersonalInformation(
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      placeOfBirth: freezed == placeOfBirth
          ? _value.placeOfBirth
          : placeOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PersonalInformation extends _PersonalInformation {
  const _$_PersonalInformation(
      {this.gender,
      @JsonKey(name: 'phone_number') this.phoneNumber,
      @JsonKey(name: 'place_of_birth') this.placeOfBirth,
      @JsonKey(name: 'date_of_birth') this.dateOfBirth})
      : super._();

  factory _$_PersonalInformation.fromJson(Map<String, dynamic> json) =>
      _$$_PersonalInformationFromJson(json);

  @override
  final String? gender;
  @override
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'place_of_birth')
  final String? placeOfBirth;
  @override
  @JsonKey(name: 'date_of_birth')
  final String? dateOfBirth;

  @override
  String toString() {
    return 'PersonalInformation(gender: $gender, phoneNumber: $phoneNumber, placeOfBirth: $placeOfBirth, dateOfBirth: $dateOfBirth)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PersonalInformationCopyWith<_$_PersonalInformation> get copyWith =>
      __$$_PersonalInformationCopyWithImpl<_$_PersonalInformation>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PersonalInformationToJson(
      this,
    );
  }
}

abstract class _PersonalInformation extends PersonalInformation {
  const factory _PersonalInformation(
          {final String? gender,
          @JsonKey(name: 'phone_number') final String? phoneNumber,
          @JsonKey(name: 'place_of_birth') final String? placeOfBirth,
          @JsonKey(name: 'date_of_birth') final String? dateOfBirth}) =
      _$_PersonalInformation;
  const _PersonalInformation._() : super._();

  factory _PersonalInformation.fromJson(Map<String, dynamic> json) =
      _$_PersonalInformation.fromJson;

  @override
  String? get gender;
  @override
  @JsonKey(name: 'phone_number')
  String? get phoneNumber;
  @override
  @JsonKey(name: 'place_of_birth')
  String? get placeOfBirth;
  @override
  @JsonKey(name: 'date_of_birth')
  String? get dateOfBirth;
  @override
  @JsonKey(ignore: true)
  _$$_PersonalInformationCopyWith<_$_PersonalInformation> get copyWith =>
      throw _privateConstructorUsedError;
}
