// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outlet_info_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OutletInfoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Map<String, dynamic> params) getOutletInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Map<String, dynamic> params)? getOutletInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Map<String, dynamic> params)? getOutletInfo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'OutletInfoEvent.started()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Map<String, dynamic> params) getOutletInfo,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Map<String, dynamic> params)? getOutletInfo,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Map<String, dynamic> params)? getOutletInfo,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }
}

abstract class _Started implements OutletInfoEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc

class _$_getOutletInfo implements _getOutletInfo {
  const _$_getOutletInfo(final Map<String, dynamic> params) : _params = params;

  final Map<String, dynamic> _params;
  @override
  Map<String, dynamic> get params {
    if (_params is EqualUnmodifiableMapView) return _params;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_params);
  }

  @override
  String toString() {
    return 'OutletInfoEvent.getOutletInfo(params: $params)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Map<String, dynamic> params) getOutletInfo,
  }) {
    return getOutletInfo(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Map<String, dynamic> params)? getOutletInfo,
  }) {
    return getOutletInfo?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Map<String, dynamic> params)? getOutletInfo,
    required TResult orElse(),
  }) {
    if (getOutletInfo != null) {
      return getOutletInfo(params);
    }
    return orElse();
  }
}

abstract class _getOutletInfo implements OutletInfoEvent {
  const factory _getOutletInfo(final Map<String, dynamic> params) =
      _$_getOutletInfo;

  Map<String, dynamic> get params;
}

/// @nodoc
mixin _$OutletInfoState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(OutletInfo data) outletInfo,
    required TResult Function(NetworkExceptions error) isError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(OutletInfo data)? outletInfo,
    TResult? Function(NetworkExceptions error)? isError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(OutletInfo data)? outletInfo,
    TResult Function(NetworkExceptions error)? isError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'OutletInfoState.initial()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(OutletInfo data) outletInfo,
    required TResult Function(NetworkExceptions error) isError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(OutletInfo data)? outletInfo,
    TResult? Function(NetworkExceptions error)? isError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(OutletInfo data)? outletInfo,
    TResult Function(NetworkExceptions error)? isError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }
}

abstract class _Initial implements OutletInfoState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc

class _$_IsLoading implements _IsLoading {
  const _$_IsLoading();

  @override
  String toString() {
    return 'OutletInfoState.isLoading()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(OutletInfo data) outletInfo,
    required TResult Function(NetworkExceptions error) isError,
  }) {
    return isLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(OutletInfo data)? outletInfo,
    TResult? Function(NetworkExceptions error)? isError,
  }) {
    return isLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(OutletInfo data)? outletInfo,
    TResult Function(NetworkExceptions error)? isError,
    required TResult orElse(),
  }) {
    if (isLoading != null) {
      return isLoading();
    }
    return orElse();
  }
}

abstract class _IsLoading implements OutletInfoState {
  const factory _IsLoading() = _$_IsLoading;
}

/// @nodoc

class _$_OutletInfo implements _OutletInfo {
  const _$_OutletInfo(this.data);

  @override
  final OutletInfo data;

  @override
  String toString() {
    return 'OutletInfoState.outletInfo(data: $data)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(OutletInfo data) outletInfo,
    required TResult Function(NetworkExceptions error) isError,
  }) {
    return outletInfo(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(OutletInfo data)? outletInfo,
    TResult? Function(NetworkExceptions error)? isError,
  }) {
    return outletInfo?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(OutletInfo data)? outletInfo,
    TResult Function(NetworkExceptions error)? isError,
    required TResult orElse(),
  }) {
    if (outletInfo != null) {
      return outletInfo(data);
    }
    return orElse();
  }
}

abstract class _OutletInfo implements OutletInfoState {
  const factory _OutletInfo(final OutletInfo data) = _$_OutletInfo;

  OutletInfo get data;
}

/// @nodoc

class _$_IsError implements _IsError {
  const _$_IsError(this.error);

  @override
  final NetworkExceptions error;

  @override
  String toString() {
    return 'OutletInfoState.isError(error: $error)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(OutletInfo data) outletInfo,
    required TResult Function(NetworkExceptions error) isError,
  }) {
    return isError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(OutletInfo data)? outletInfo,
    TResult? Function(NetworkExceptions error)? isError,
  }) {
    return isError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(OutletInfo data)? outletInfo,
    TResult Function(NetworkExceptions error)? isError,
    required TResult orElse(),
  }) {
    if (isError != null) {
      return isError(error);
    }
    return orElse();
  }
}

abstract class _IsError implements OutletInfoState {
  const factory _IsError(final NetworkExceptions error) = _$_IsError;

  NetworkExceptions get error;
}
