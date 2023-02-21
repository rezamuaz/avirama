// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaginationType<T> _$PaginationTypeFromJson<T>(Map<String, dynamic> json) {
  return _PaginationType<T>.fromJson(json);
}

/// @nodoc
mixin _$PaginationType<T> {
  @_Converter()
  List<T>? get data => throw _privateConstructorUsedError;
  Link? get links => throw _privateConstructorUsedError;
  Meta? get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_PaginationType<T> implements _PaginationType<T> {
  const _$_PaginationType(
      {@_Converter() final List<T>? data, this.links, this.meta})
      : _data = data;

  factory _$_PaginationType.fromJson(Map<String, dynamic> json) =>
      _$$_PaginationTypeFromJson(json);

  final List<T>? _data;
  @override
  @_Converter()
  List<T>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Link? links;
  @override
  final Meta? meta;

  @override
  String toString() {
    return 'PaginationType<$T>(data: $data, links: $links, meta: $meta)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaginationTypeToJson<T>(
      this,
    );
  }
}

abstract class _PaginationType<T> implements PaginationType<T> {
  const factory _PaginationType(
      {@_Converter() final List<T>? data,
      final Link? links,
      final Meta? meta}) = _$_PaginationType<T>;

  factory _PaginationType.fromJson(Map<String, dynamic> json) =
      _$_PaginationType<T>.fromJson;

  @override
  @_Converter()
  List<T>? get data;
  @override
  Link? get links;
  @override
  Meta? get meta;
}
