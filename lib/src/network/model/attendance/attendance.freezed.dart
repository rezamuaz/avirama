// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListAttendance _$ListAttendanceFromJson(Map<String, dynamic> json) {
  return _ListAttendance.fromJson(json);
}

/// @nodoc
mixin _$ListAttendance {
  @JsonKey(name: "currentPage")
  int? get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: "totalPage")
  int? get totalPage => throw _privateConstructorUsedError;
  @JsonKey(name: "nextPage")
  int? get nextPage => throw _privateConstructorUsedError;
  List<Attendance>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_ListAttendance extends _ListAttendance {
  const _$_ListAttendance(
      {@JsonKey(name: "currentPage") this.currentPage,
      @JsonKey(name: "totalPage") this.totalPage,
      @JsonKey(name: "nextPage") this.nextPage,
      final List<Attendance>? data})
      : _data = data,
        super._();

  factory _$_ListAttendance.fromJson(Map<String, dynamic> json) =>
      _$$_ListAttendanceFromJson(json);

  @override
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @override
  @JsonKey(name: "totalPage")
  final int? totalPage;
  @override
  @JsonKey(name: "nextPage")
  final int? nextPage;
  final List<Attendance>? _data;
  @override
  List<Attendance>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ListAttendance(currentPage: $currentPage, totalPage: $totalPage, nextPage: $nextPage, data: $data)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListAttendanceToJson(
      this,
    );
  }
}

abstract class _ListAttendance extends ListAttendance {
  const factory _ListAttendance(
      {@JsonKey(name: "currentPage") final int? currentPage,
      @JsonKey(name: "totalPage") final int? totalPage,
      @JsonKey(name: "nextPage") final int? nextPage,
      final List<Attendance>? data}) = _$_ListAttendance;
  const _ListAttendance._() : super._();

  factory _ListAttendance.fromJson(Map<String, dynamic> json) =
      _$_ListAttendance.fromJson;

  @override
  @JsonKey(name: "currentPage")
  int? get currentPage;
  @override
  @JsonKey(name: "totalPage")
  int? get totalPage;
  @override
  @JsonKey(name: "nextPage")
  int? get nextPage;
  @override
  List<Attendance>? get data;
}

Attendance _$AttendanceFromJson(Map<String, dynamic> json) {
  return _Attendance.fromJson(json);
}

/// @nodoc
mixin _$Attendance {
  int get id => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get outlet => throw _privateConstructorUsedError;
  @JsonKey(name: "check_int")
  String? get checkInt => throw _privateConstructorUsedError;
  @JsonKey(name: "check_out")
  String? get checkOut => throw _privateConstructorUsedError;
  @JsonKey(name: "long_int")
  String? get longInt => throw _privateConstructorUsedError;
  @JsonKey(name: "long_out")
  String? get longOut => throw _privateConstructorUsedError;
  @JsonKey(name: "lang_int")
  String? get langInt => throw _privateConstructorUsedError;
  @JsonKey(name: "lang_out")
  String? get langOut => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: "data_outlet")
  Outlet get dataOutlet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_Attendance extends _Attendance {
  const _$_Attendance(
      {required this.id,
      required this.date,
      required this.outlet,
      @JsonKey(name: "check_int") this.checkInt,
      @JsonKey(name: "check_out") this.checkOut,
      @JsonKey(name: "long_int") this.longInt,
      @JsonKey(name: "long_out") this.longOut,
      @JsonKey(name: "lang_int") this.langInt,
      @JsonKey(name: "lang_out") this.langOut,
      this.note,
      @JsonKey(name: "data_outlet") required this.dataOutlet})
      : super._();

  factory _$_Attendance.fromJson(Map<String, dynamic> json) =>
      _$$_AttendanceFromJson(json);

  @override
  final int id;
  @override
  final String date;
  @override
  final String outlet;
  @override
  @JsonKey(name: "check_int")
  final String? checkInt;
  @override
  @JsonKey(name: "check_out")
  final String? checkOut;
  @override
  @JsonKey(name: "long_int")
  final String? longInt;
  @override
  @JsonKey(name: "long_out")
  final String? longOut;
  @override
  @JsonKey(name: "lang_int")
  final String? langInt;
  @override
  @JsonKey(name: "lang_out")
  final String? langOut;
  @override
  final String? note;
  @override
  @JsonKey(name: "data_outlet")
  final Outlet dataOutlet;

  @override
  String toString() {
    return 'Attendance(id: $id, date: $date, outlet: $outlet, checkInt: $checkInt, checkOut: $checkOut, longInt: $longInt, longOut: $longOut, langInt: $langInt, langOut: $langOut, note: $note, dataOutlet: $dataOutlet)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_AttendanceToJson(
      this,
    );
  }
}

abstract class _Attendance extends Attendance {
  const factory _Attendance(
          {required final int id,
          required final String date,
          required final String outlet,
          @JsonKey(name: "check_int") final String? checkInt,
          @JsonKey(name: "check_out") final String? checkOut,
          @JsonKey(name: "long_int") final String? longInt,
          @JsonKey(name: "long_out") final String? longOut,
          @JsonKey(name: "lang_int") final String? langInt,
          @JsonKey(name: "lang_out") final String? langOut,
          final String? note,
          @JsonKey(name: "data_outlet") required final Outlet dataOutlet}) =
      _$_Attendance;
  const _Attendance._() : super._();

  factory _Attendance.fromJson(Map<String, dynamic> json) =
      _$_Attendance.fromJson;

  @override
  int get id;
  @override
  String get date;
  @override
  String get outlet;
  @override
  @JsonKey(name: "check_int")
  String? get checkInt;
  @override
  @JsonKey(name: "check_out")
  String? get checkOut;
  @override
  @JsonKey(name: "long_int")
  String? get longInt;
  @override
  @JsonKey(name: "long_out")
  String? get longOut;
  @override
  @JsonKey(name: "lang_int")
  String? get langInt;
  @override
  @JsonKey(name: "lang_out")
  String? get langOut;
  @override
  String? get note;
  @override
  @JsonKey(name: "data_outlet")
  Outlet get dataOutlet;
}

AttendanceInResult _$AttendanceInResultFromJson(Map<String, dynamic> json) {
  return _AttendanceInResult.fromJson(json);
}

/// @nodoc
mixin _$AttendanceInResult {
  bool get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_AttendanceInResult extends _AttendanceInResult {
  const _$_AttendanceInResult({required this.status, required this.message})
      : super._();

  factory _$_AttendanceInResult.fromJson(Map<String, dynamic> json) =>
      _$$_AttendanceInResultFromJson(json);

  @override
  final bool status;
  @override
  final String message;

  @override
  String toString() {
    return 'AttendanceInResult(status: $status, message: $message)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_AttendanceInResultToJson(
      this,
    );
  }
}

abstract class _AttendanceInResult extends AttendanceInResult {
  const factory _AttendanceInResult(
      {required final bool status,
      required final String message}) = _$_AttendanceInResult;
  const _AttendanceInResult._() : super._();

  factory _AttendanceInResult.fromJson(Map<String, dynamic> json) =
      _$_AttendanceInResult.fromJson;

  @override
  bool get status;
  @override
  String get message;
}

AttendanceStoreDetail _$AttendanceStoreDetailFromJson(
    Map<String, dynamic> json) {
  return _AttendanceStoreDetail.fromJson(json);
}

/// @nodoc
mixin _$AttendanceStoreDetail {
  String get name => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String? get long => throw _privateConstructorUsedError;
  String? get lang => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_AttendanceStoreDetail extends _AttendanceStoreDetail {
  const _$_AttendanceStoreDetail(
      {required this.name,
      required this.id,
      required this.address,
      this.long,
      this.lang,
      this.image})
      : super._();

  factory _$_AttendanceStoreDetail.fromJson(Map<String, dynamic> json) =>
      _$$_AttendanceStoreDetailFromJson(json);

  @override
  final String name;
  @override
  final String id;
  @override
  final String address;
  @override
  final String? long;
  @override
  final String? lang;
  @override
  final String? image;

  @override
  String toString() {
    return 'AttendanceStoreDetail(name: $name, id: $id, address: $address, long: $long, lang: $lang, image: $image)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_AttendanceStoreDetailToJson(
      this,
    );
  }
}

abstract class _AttendanceStoreDetail extends AttendanceStoreDetail {
  const factory _AttendanceStoreDetail(
      {required final String name,
      required final String id,
      required final String address,
      final String? long,
      final String? lang,
      final String? image}) = _$_AttendanceStoreDetail;
  const _AttendanceStoreDetail._() : super._();

  factory _AttendanceStoreDetail.fromJson(Map<String, dynamic> json) =
      _$_AttendanceStoreDetail.fromJson;

  @override
  String get name;
  @override
  String get id;
  @override
  String get address;
  @override
  String? get long;
  @override
  String? get lang;
  @override
  String? get image;
}
