// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_verify')
  String get status => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_number")
  String? get phoneNumber => throw _privateConstructorUsedError;
  List<Role>? get roles => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_photo_url')
  String? get profilePhotoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_password_null')
  bool? get isPasswordNull => throw _privateConstructorUsedError;
  @JsonKey(name: 'personal_information')
  PersonalInformation? get personalInformation =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "salary")
  int? get salary => throw _privateConstructorUsedError;
  @JsonKey(name: "jabatan")
  String? get jabatan => throw _privateConstructorUsedError;
  @JsonKey(name: "principal")
  String? get principal => throw _privateConstructorUsedError;
  @JsonKey(name: "no_karyawan")
  String? get no_karyawan => throw _privateConstructorUsedError;
  @JsonKey(name: "ktp")
  String? get ktp => throw _privateConstructorUsedError;
  @JsonKey(name: "nama_bank")
  String? get nama_bank => throw _privateConstructorUsedError;
  @JsonKey(name: "rekening")
  String? get rekening => throw _privateConstructorUsedError;
  @JsonKey(name: "bpjs")
  String? get bpjs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'status_verify')
          String status,
      String name,
      String? email,
      @JsonKey(name: "phone_number")
          String? phoneNumber,
      List<Role>? roles,
      @JsonKey(name: 'profile_photo_url')
          String? profilePhotoUrl,
      @JsonKey(name: 'is_password_null')
          bool? isPasswordNull,
      @JsonKey(name: 'personal_information')
          PersonalInformation? personalInformation,
      @JsonKey(name: "type")
          String? type,
      @JsonKey(name: "salary")
          int? salary,
      @JsonKey(name: "jabatan")
          String? jabatan,
      @JsonKey(name: "principal")
          String? principal,
      @JsonKey(name: "no_karyawan")
          String? no_karyawan,
      @JsonKey(name: "ktp")
          String? ktp,
      @JsonKey(name: "nama_bank")
          String? nama_bank,
      @JsonKey(name: "rekening")
          String? rekening,
      @JsonKey(name: "bpjs")
          String? bpjs});

  $PersonalInformationCopyWith<$Res>? get personalInformation;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? name = null,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? roles = freezed,
    Object? profilePhotoUrl = freezed,
    Object? isPasswordNull = freezed,
    Object? personalInformation = freezed,
    Object? type = freezed,
    Object? salary = freezed,
    Object? jabatan = freezed,
    Object? principal = freezed,
    Object? no_karyawan = freezed,
    Object? ktp = freezed,
    Object? nama_bank = freezed,
    Object? rekening = freezed,
    Object? bpjs = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: freezed == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<Role>?,
      profilePhotoUrl: freezed == profilePhotoUrl
          ? _value.profilePhotoUrl
          : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isPasswordNull: freezed == isPasswordNull
          ? _value.isPasswordNull
          : isPasswordNull // ignore: cast_nullable_to_non_nullable
              as bool?,
      personalInformation: freezed == personalInformation
          ? _value.personalInformation
          : personalInformation // ignore: cast_nullable_to_non_nullable
              as PersonalInformation?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      salary: freezed == salary
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as int?,
      jabatan: freezed == jabatan
          ? _value.jabatan
          : jabatan // ignore: cast_nullable_to_non_nullable
              as String?,
      principal: freezed == principal
          ? _value.principal
          : principal // ignore: cast_nullable_to_non_nullable
              as String?,
      no_karyawan: freezed == no_karyawan
          ? _value.no_karyawan
          : no_karyawan // ignore: cast_nullable_to_non_nullable
              as String?,
      ktp: freezed == ktp
          ? _value.ktp
          : ktp // ignore: cast_nullable_to_non_nullable
              as String?,
      nama_bank: freezed == nama_bank
          ? _value.nama_bank
          : nama_bank // ignore: cast_nullable_to_non_nullable
              as String?,
      rekening: freezed == rekening
          ? _value.rekening
          : rekening // ignore: cast_nullable_to_non_nullable
              as String?,
      bpjs: freezed == bpjs
          ? _value.bpjs
          : bpjs // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PersonalInformationCopyWith<$Res>? get personalInformation {
    if (_value.personalInformation == null) {
      return null;
    }

    return $PersonalInformationCopyWith<$Res>(_value.personalInformation!,
        (value) {
      return _then(_value.copyWith(personalInformation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'status_verify')
          String status,
      String name,
      String? email,
      @JsonKey(name: "phone_number")
          String? phoneNumber,
      List<Role>? roles,
      @JsonKey(name: 'profile_photo_url')
          String? profilePhotoUrl,
      @JsonKey(name: 'is_password_null')
          bool? isPasswordNull,
      @JsonKey(name: 'personal_information')
          PersonalInformation? personalInformation,
      @JsonKey(name: "type")
          String? type,
      @JsonKey(name: "salary")
          int? salary,
      @JsonKey(name: "jabatan")
          String? jabatan,
      @JsonKey(name: "principal")
          String? principal,
      @JsonKey(name: "no_karyawan")
          String? no_karyawan,
      @JsonKey(name: "ktp")
          String? ktp,
      @JsonKey(name: "nama_bank")
          String? nama_bank,
      @JsonKey(name: "rekening")
          String? rekening,
      @JsonKey(name: "bpjs")
          String? bpjs});

  @override
  $PersonalInformationCopyWith<$Res>? get personalInformation;
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? name = null,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? roles = freezed,
    Object? profilePhotoUrl = freezed,
    Object? isPasswordNull = freezed,
    Object? personalInformation = freezed,
    Object? type = freezed,
    Object? salary = freezed,
    Object? jabatan = freezed,
    Object? principal = freezed,
    Object? no_karyawan = freezed,
    Object? ktp = freezed,
    Object? nama_bank = freezed,
    Object? rekening = freezed,
    Object? bpjs = freezed,
  }) {
    return _then(_$_User(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: freezed == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<Role>?,
      profilePhotoUrl: freezed == profilePhotoUrl
          ? _value.profilePhotoUrl
          : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isPasswordNull: freezed == isPasswordNull
          ? _value.isPasswordNull
          : isPasswordNull // ignore: cast_nullable_to_non_nullable
              as bool?,
      personalInformation: freezed == personalInformation
          ? _value.personalInformation
          : personalInformation // ignore: cast_nullable_to_non_nullable
              as PersonalInformation?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      salary: freezed == salary
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as int?,
      jabatan: freezed == jabatan
          ? _value.jabatan
          : jabatan // ignore: cast_nullable_to_non_nullable
              as String?,
      principal: freezed == principal
          ? _value.principal
          : principal // ignore: cast_nullable_to_non_nullable
              as String?,
      no_karyawan: freezed == no_karyawan
          ? _value.no_karyawan
          : no_karyawan // ignore: cast_nullable_to_non_nullable
              as String?,
      ktp: freezed == ktp
          ? _value.ktp
          : ktp // ignore: cast_nullable_to_non_nullable
              as String?,
      nama_bank: freezed == nama_bank
          ? _value.nama_bank
          : nama_bank // ignore: cast_nullable_to_non_nullable
              as String?,
      rekening: freezed == rekening
          ? _value.rekening
          : rekening // ignore: cast_nullable_to_non_nullable
              as String?,
      bpjs: freezed == bpjs
          ? _value.bpjs
          : bpjs // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User extends _User {
  const _$_User(
      {required this.id,
      @JsonKey(name: 'status_verify') required this.status,
      required this.name,
      this.email,
      @JsonKey(name: "phone_number") this.phoneNumber,
      required final List<Role>? roles,
      @JsonKey(name: 'profile_photo_url') this.profilePhotoUrl,
      @JsonKey(name: 'is_password_null') this.isPasswordNull,
      @JsonKey(name: 'personal_information') this.personalInformation,
      @JsonKey(name: "type") this.type,
      @JsonKey(name: "salary") this.salary,
      @JsonKey(name: "jabatan") this.jabatan,
      @JsonKey(name: "principal") this.principal,
      @JsonKey(name: "no_karyawan") this.no_karyawan,
      @JsonKey(name: "ktp") this.ktp,
      @JsonKey(name: "nama_bank") this.nama_bank,
      @JsonKey(name: "rekening") this.rekening,
      @JsonKey(name: "bpjs") this.bpjs})
      : _roles = roles,
        super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'status_verify')
  final String status;
  @override
  final String name;
  @override
  final String? email;
  @override
  @JsonKey(name: "phone_number")
  final String? phoneNumber;
  final List<Role>? _roles;
  @override
  List<Role>? get roles {
    final value = _roles;
    if (value == null) return null;
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'profile_photo_url')
  final String? profilePhotoUrl;
  @override
  @JsonKey(name: 'is_password_null')
  final bool? isPasswordNull;
  @override
  @JsonKey(name: 'personal_information')
  final PersonalInformation? personalInformation;
  @override
  @JsonKey(name: "type")
  final String? type;
  @override
  @JsonKey(name: "salary")
  final int? salary;
  @override
  @JsonKey(name: "jabatan")
  final String? jabatan;
  @override
  @JsonKey(name: "principal")
  final String? principal;
  @override
  @JsonKey(name: "no_karyawan")
  final String? no_karyawan;
  @override
  @JsonKey(name: "ktp")
  final String? ktp;
  @override
  @JsonKey(name: "nama_bank")
  final String? nama_bank;
  @override
  @JsonKey(name: "rekening")
  final String? rekening;
  @override
  @JsonKey(name: "bpjs")
  final String? bpjs;

  @override
  String toString() {
    return 'User(id: $id, status: $status, name: $name, email: $email, phoneNumber: $phoneNumber, roles: $roles, profilePhotoUrl: $profilePhotoUrl, isPasswordNull: $isPasswordNull, personalInformation: $personalInformation, type: $type, salary: $salary, jabatan: $jabatan, principal: $principal, no_karyawan: $no_karyawan, ktp: $ktp, nama_bank: $nama_bank, rekening: $rekening, bpjs: $bpjs)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User extends User {
  const factory _User(
      {required final int id,
      @JsonKey(name: 'status_verify')
          required final String status,
      required final String name,
      final String? email,
      @JsonKey(name: "phone_number")
          final String? phoneNumber,
      required final List<Role>? roles,
      @JsonKey(name: 'profile_photo_url')
          final String? profilePhotoUrl,
      @JsonKey(name: 'is_password_null')
          final bool? isPasswordNull,
      @JsonKey(name: 'personal_information')
          final PersonalInformation? personalInformation,
      @JsonKey(name: "type")
          final String? type,
      @JsonKey(name: "salary")
          final int? salary,
      @JsonKey(name: "jabatan")
          final String? jabatan,
      @JsonKey(name: "principal")
          final String? principal,
      @JsonKey(name: "no_karyawan")
          final String? no_karyawan,
      @JsonKey(name: "ktp")
          final String? ktp,
      @JsonKey(name: "nama_bank")
          final String? nama_bank,
      @JsonKey(name: "rekening")
          final String? rekening,
      @JsonKey(name: "bpjs")
          final String? bpjs}) = _$_User;
  const _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'status_verify')
  String get status;
  @override
  String get name;
  @override
  String? get email;
  @override
  @JsonKey(name: "phone_number")
  String? get phoneNumber;
  @override
  List<Role>? get roles;
  @override
  @JsonKey(name: 'profile_photo_url')
  String? get profilePhotoUrl;
  @override
  @JsonKey(name: 'is_password_null')
  bool? get isPasswordNull;
  @override
  @JsonKey(name: 'personal_information')
  PersonalInformation? get personalInformation;
  @override
  @JsonKey(name: "type")
  String? get type;
  @override
  @JsonKey(name: "salary")
  int? get salary;
  @override
  @JsonKey(name: "jabatan")
  String? get jabatan;
  @override
  @JsonKey(name: "principal")
  String? get principal;
  @override
  @JsonKey(name: "no_karyawan")
  String? get no_karyawan;
  @override
  @JsonKey(name: "ktp")
  String? get ktp;
  @override
  @JsonKey(name: "nama_bank")
  String? get nama_bank;
  @override
  @JsonKey(name: "rekening")
  String? get rekening;
  @override
  @JsonKey(name: "bpjs")
  String? get bpjs;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
