// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DailyReport _$DailyReportFromJson(Map<String, dynamic> json) {
  return _DailyReport.fromJson(json);
}

/// @nodoc
mixin _$DailyReport {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String get note => throw _privateConstructorUsedError;
  String get long => throw _privateConstructorUsedError;
  String get lang => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_DailyReport extends _DailyReport {
  const _$_DailyReport(
      {required this.id,
      required this.name,
      required this.time,
      required this.location,
      @JsonKey(name: "description") required this.note,
      required this.long,
      required this.lang,
      @JsonKey(name: "created_at") required this.createdAt})
      : super._();

  factory _$_DailyReport.fromJson(Map<String, dynamic> json) =>
      _$$_DailyReportFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String time;
  @override
  final String location;
  @override
  @JsonKey(name: "description")
  final String note;
  @override
  final String long;
  @override
  final String lang;
  @override
  @JsonKey(name: "created_at")
  final String createdAt;

  @override
  String toString() {
    return 'DailyReport(id: $id, name: $name, time: $time, location: $location, note: $note, long: $long, lang: $lang, createdAt: $createdAt)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_DailyReportToJson(
      this,
    );
  }
}

abstract class _DailyReport extends DailyReport {
  const factory _DailyReport(
          {required final int id,
          required final String name,
          required final String time,
          required final String location,
          @JsonKey(name: "description") required final String note,
          required final String long,
          required final String lang,
          @JsonKey(name: "created_at") required final String createdAt}) =
      _$_DailyReport;
  const _DailyReport._() : super._();

  factory _DailyReport.fromJson(Map<String, dynamic> json) =
      _$_DailyReport.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get time;
  @override
  String get location;
  @override
  @JsonKey(name: "description")
  String get note;
  @override
  String get long;
  @override
  String get lang;
  @override
  @JsonKey(name: "created_at")
  String get createdAt;
}

DailyReportRequest _$DailyReportRequestFromJson(Map<String, dynamic> json) {
  return _DailyReportRequest.fromJson(json);
}

/// @nodoc
mixin _$DailyReportRequest {
  String get name => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String get note => throw _privateConstructorUsedError;
  String get long => throw _privateConstructorUsedError;
  String get lang => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_DailyReportRequest extends _DailyReportRequest {
  const _$_DailyReportRequest(
      {required this.name,
      required this.time,
      required this.location,
      @JsonKey(name: "description") required this.note,
      required this.long,
      required this.lang})
      : super._();

  factory _$_DailyReportRequest.fromJson(Map<String, dynamic> json) =>
      _$$_DailyReportRequestFromJson(json);

  @override
  final String name;
  @override
  final String time;
  @override
  final String location;
  @override
  @JsonKey(name: "description")
  final String note;
  @override
  final String long;
  @override
  final String lang;

  @override
  String toString() {
    return 'DailyReportRequest(name: $name, time: $time, location: $location, note: $note, long: $long, lang: $lang)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_DailyReportRequestToJson(
      this,
    );
  }
}

abstract class _DailyReportRequest extends DailyReportRequest {
  const factory _DailyReportRequest(
      {required final String name,
      required final String time,
      required final String location,
      @JsonKey(name: "description") required final String note,
      required final String long,
      required final String lang}) = _$_DailyReportRequest;
  const _DailyReportRequest._() : super._();

  factory _DailyReportRequest.fromJson(Map<String, dynamic> json) =
      _$_DailyReportRequest.fromJson;

  @override
  String get name;
  @override
  String get time;
  @override
  String get location;
  @override
  @JsonKey(name: "description")
  String get note;
  @override
  String get long;
  @override
  String get lang;
}
