// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kompetitor_activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KompetitorAktivitas _$KompetitorAktivitasFromJson(Map<String, dynamic> json) {
  return _KompetitorAktivitas.fromJson(json);
}

/// @nodoc
mixin _$KompetitorAktivitas {
  int? get id => throw _privateConstructorUsedError;
  String? get keterangan => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "id_outlet")
  String? get idOutlet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_KompetitorAktivitas implements _KompetitorAktivitas {
  _$_KompetitorAktivitas(
      {this.id,
      this.keterangan,
      this.image,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt,
      @JsonKey(name: "id_outlet") this.idOutlet});

  factory _$_KompetitorAktivitas.fromJson(Map<String, dynamic> json) =>
      _$$_KompetitorAktivitasFromJson(json);

  @override
  final int? id;
  @override
  final String? keterangan;
  @override
  final String? image;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @override
  @JsonKey(name: "id_outlet")
  final String? idOutlet;

  @override
  String toString() {
    return 'KompetitorAktivitas(id: $id, keterangan: $keterangan, image: $image, createdAt: $createdAt, updatedAt: $updatedAt, idOutlet: $idOutlet)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_KompetitorAktivitasToJson(
      this,
    );
  }
}

abstract class _KompetitorAktivitas implements KompetitorAktivitas {
  factory _KompetitorAktivitas(
          {final int? id,
          final String? keterangan,
          final String? image,
          @JsonKey(name: "created_at") final String? createdAt,
          @JsonKey(name: "updated_at") final String? updatedAt,
          @JsonKey(name: "id_outlet") final String? idOutlet}) =
      _$_KompetitorAktivitas;

  factory _KompetitorAktivitas.fromJson(Map<String, dynamic> json) =
      _$_KompetitorAktivitas.fromJson;

  @override
  int? get id;
  @override
  String? get keterangan;
  @override
  String? get image;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String? get updatedAt;
  @override
  @JsonKey(name: "id_outlet")
  String? get idOutlet;
}
