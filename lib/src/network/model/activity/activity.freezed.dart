// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListActivity _$ListActivityFromJson(Map<String, dynamic> json) {
  return _ListActivity.fromJson(json);
}

/// @nodoc
mixin _$ListActivity {
  List<Activity>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_ListActivity extends _ListActivity {
  const _$_ListActivity({final List<Activity>? data})
      : _data = data,
        super._();

  factory _$_ListActivity.fromJson(Map<String, dynamic> json) =>
      _$$_ListActivityFromJson(json);

  final List<Activity>? _data;
  @override
  List<Activity>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ListActivity(data: $data)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListActivityToJson(
      this,
    );
  }
}

abstract class _ListActivity extends ListActivity {
  const factory _ListActivity({final List<Activity>? data}) = _$_ListActivity;
  const _ListActivity._() : super._();

  factory _ListActivity.fromJson(Map<String, dynamic> json) =
      _$_ListActivity.fromJson;

  @override
  List<Activity>? get data;
}

Activity _$ActivityFromJson(Map<String, dynamic> json) {
  return _Activity.fromJson(json);
}

/// @nodoc
mixin _$Activity {
  int get id => throw _privateConstructorUsedError;
  String get photo => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_Activity extends _Activity {
  const _$_Activity(
      {required this.id, required this.photo, required this.description})
      : super._();

  factory _$_Activity.fromJson(Map<String, dynamic> json) =>
      _$$_ActivityFromJson(json);

  @override
  final int id;
  @override
  final String photo;
  @override
  final String description;

  @override
  String toString() {
    return 'Activity(id: $id, photo: $photo, description: $description)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_ActivityToJson(
      this,
    );
  }
}

abstract class _Activity extends Activity {
  const factory _Activity(
      {required final int id,
      required final String photo,
      required final String description}) = _$_Activity;
  const _Activity._() : super._();

  factory _Activity.fromJson(Map<String, dynamic> json) = _$_Activity.fromJson;

  @override
  int get id;
  @override
  String get photo;
  @override
  String get description;
}

ActivityResult _$ActivityResultFromJson(Map<String, dynamic> json) {
  return _ActivityResult.fromJson(json);
}

/// @nodoc
mixin _$ActivityResult {
  bool get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_ActivityResult extends _ActivityResult {
  const _$_ActivityResult({required this.status, required this.message})
      : super._();

  factory _$_ActivityResult.fromJson(Map<String, dynamic> json) =>
      _$$_ActivityResultFromJson(json);

  @override
  final bool status;
  @override
  final String message;

  @override
  String toString() {
    return 'ActivityResult(status: $status, message: $message)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_ActivityResultToJson(
      this,
    );
  }
}

abstract class _ActivityResult extends ActivityResult {
  const factory _ActivityResult(
      {required final bool status,
      required final String message}) = _$_ActivityResult;
  const _ActivityResult._() : super._();

  factory _ActivityResult.fromJson(Map<String, dynamic> json) =
      _$_ActivityResult.fromJson;

  @override
  bool get status;
  @override
  String get message;
}
