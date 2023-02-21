// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'ProfileDetailEvent.started()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getDetail,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getDetail,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getDetail,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }
}

abstract class _Started implements ProfileDetailEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc

class _$_getDetail implements _getDetail {
  const _$_getDetail();

  @override
  String toString() {
    return 'ProfileDetailEvent.getDetail()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getDetail,
  }) {
    return getDetail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getDetail,
  }) {
    return getDetail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getDetail,
    required TResult orElse(),
  }) {
    if (getDetail != null) {
      return getDetail();
    }
    return orElse();
  }
}

abstract class _getDetail implements ProfileDetailEvent {
  const factory _getDetail() = _$_getDetail;
}

/// @nodoc
mixin _$ProfileDetailState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(ProfileDetail data) detailedProfile,
    required TResult Function(NetworkExceptions networkExceptions) isError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(ProfileDetail data)? detailedProfile,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(ProfileDetail data)? detailedProfile,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'ProfileDetailState.initial()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(ProfileDetail data) detailedProfile,
    required TResult Function(NetworkExceptions networkExceptions) isError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(ProfileDetail data)? detailedProfile,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(ProfileDetail data)? detailedProfile,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }
}

abstract class _Initial implements ProfileDetailState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc

class _$_isLoading implements _isLoading {
  const _$_isLoading();

  @override
  String toString() {
    return 'ProfileDetailState.isLoading()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(ProfileDetail data) detailedProfile,
    required TResult Function(NetworkExceptions networkExceptions) isError,
  }) {
    return isLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(ProfileDetail data)? detailedProfile,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
  }) {
    return isLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(ProfileDetail data)? detailedProfile,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    required TResult orElse(),
  }) {
    if (isLoading != null) {
      return isLoading();
    }
    return orElse();
  }
}

abstract class _isLoading implements ProfileDetailState {
  const factory _isLoading() = _$_isLoading;
}

/// @nodoc

class _$_detailedProfile implements _detailedProfile {
  const _$_detailedProfile(this.data);

  @override
  final ProfileDetail data;

  @override
  String toString() {
    return 'ProfileDetailState.detailedProfile(data: $data)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(ProfileDetail data) detailedProfile,
    required TResult Function(NetworkExceptions networkExceptions) isError,
  }) {
    return detailedProfile(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(ProfileDetail data)? detailedProfile,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
  }) {
    return detailedProfile?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(ProfileDetail data)? detailedProfile,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    required TResult orElse(),
  }) {
    if (detailedProfile != null) {
      return detailedProfile(data);
    }
    return orElse();
  }
}

abstract class _detailedProfile implements ProfileDetailState {
  const factory _detailedProfile(final ProfileDetail data) = _$_detailedProfile;

  ProfileDetail get data;
}

/// @nodoc

class _$_isError implements _isError {
  const _$_isError(this.networkExceptions);

  @override
  final NetworkExceptions networkExceptions;

  @override
  String toString() {
    return 'ProfileDetailState.isError(networkExceptions: $networkExceptions)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(ProfileDetail data) detailedProfile,
    required TResult Function(NetworkExceptions networkExceptions) isError,
  }) {
    return isError(networkExceptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(ProfileDetail data)? detailedProfile,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
  }) {
    return isError?.call(networkExceptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(ProfileDetail data)? detailedProfile,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    required TResult orElse(),
  }) {
    if (isError != null) {
      return isError(networkExceptions);
    }
    return orElse();
  }
}

abstract class _isError implements ProfileDetailState {
  const factory _isError(final NetworkExceptions networkExceptions) =
      _$_isError;

  NetworkExceptions get networkExceptions;
}
