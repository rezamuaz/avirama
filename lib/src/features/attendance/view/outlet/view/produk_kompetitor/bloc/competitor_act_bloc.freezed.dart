// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'competitor_act_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CompetitorActEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Map<String, dynamic> params)
        getCompetitorActivityAll,
    required TResult Function(FormData params) addCompetitorActivity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Map<String, dynamic> params)? getCompetitorActivityAll,
    TResult? Function(FormData params)? addCompetitorActivity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Map<String, dynamic> params)? getCompetitorActivityAll,
    TResult Function(FormData params)? addCompetitorActivity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'CompetitorActEvent.started()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Map<String, dynamic> params)
        getCompetitorActivityAll,
    required TResult Function(FormData params) addCompetitorActivity,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Map<String, dynamic> params)? getCompetitorActivityAll,
    TResult? Function(FormData params)? addCompetitorActivity,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Map<String, dynamic> params)? getCompetitorActivityAll,
    TResult Function(FormData params)? addCompetitorActivity,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }
}

abstract class _Started implements CompetitorActEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc

class _$_getCompetitorActivityAll implements _getCompetitorActivityAll {
  const _$_getCompetitorActivityAll(final Map<String, dynamic> params)
      : _params = params;

  final Map<String, dynamic> _params;
  @override
  Map<String, dynamic> get params {
    if (_params is EqualUnmodifiableMapView) return _params;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_params);
  }

  @override
  String toString() {
    return 'CompetitorActEvent.getCompetitorActivityAll(params: $params)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Map<String, dynamic> params)
        getCompetitorActivityAll,
    required TResult Function(FormData params) addCompetitorActivity,
  }) {
    return getCompetitorActivityAll(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Map<String, dynamic> params)? getCompetitorActivityAll,
    TResult? Function(FormData params)? addCompetitorActivity,
  }) {
    return getCompetitorActivityAll?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Map<String, dynamic> params)? getCompetitorActivityAll,
    TResult Function(FormData params)? addCompetitorActivity,
    required TResult orElse(),
  }) {
    if (getCompetitorActivityAll != null) {
      return getCompetitorActivityAll(params);
    }
    return orElse();
  }
}

abstract class _getCompetitorActivityAll implements CompetitorActEvent {
  const factory _getCompetitorActivityAll(final Map<String, dynamic> params) =
      _$_getCompetitorActivityAll;

  Map<String, dynamic> get params;
}

/// @nodoc

class _$_addCompetitorActivity implements _addCompetitorActivity {
  const _$_addCompetitorActivity(this.params);

  @override
  final FormData params;

  @override
  String toString() {
    return 'CompetitorActEvent.addCompetitorActivity(params: $params)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Map<String, dynamic> params)
        getCompetitorActivityAll,
    required TResult Function(FormData params) addCompetitorActivity,
  }) {
    return addCompetitorActivity(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Map<String, dynamic> params)? getCompetitorActivityAll,
    TResult? Function(FormData params)? addCompetitorActivity,
  }) {
    return addCompetitorActivity?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Map<String, dynamic> params)? getCompetitorActivityAll,
    TResult Function(FormData params)? addCompetitorActivity,
    required TResult orElse(),
  }) {
    if (addCompetitorActivity != null) {
      return addCompetitorActivity(params);
    }
    return orElse();
  }
}

abstract class _addCompetitorActivity implements CompetitorActEvent {
  const factory _addCompetitorActivity(final FormData params) =
      _$_addCompetitorActivity;

  FormData get params;
}

/// @nodoc
mixin _$CompetitorActState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<KompetitorAktivitas> data)
        competitorActivityAll,
    required TResult Function(Response<dynamic> data) addedCompetitorActivity,
    required TResult Function(NetworkExceptions networkExceptions) isError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<KompetitorAktivitas> data)? competitorActivityAll,
    TResult? Function(Response<dynamic> data)? addedCompetitorActivity,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<KompetitorAktivitas> data)? competitorActivityAll,
    TResult Function(Response<dynamic> data)? addedCompetitorActivity,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$_initial implements _initial {
  const _$_initial();

  @override
  String toString() {
    return 'CompetitorActState.initial()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<KompetitorAktivitas> data)
        competitorActivityAll,
    required TResult Function(Response<dynamic> data) addedCompetitorActivity,
    required TResult Function(NetworkExceptions networkExceptions) isError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<KompetitorAktivitas> data)? competitorActivityAll,
    TResult? Function(Response<dynamic> data)? addedCompetitorActivity,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<KompetitorAktivitas> data)? competitorActivityAll,
    TResult Function(Response<dynamic> data)? addedCompetitorActivity,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }
}

abstract class _initial implements CompetitorActState {
  const factory _initial() = _$_initial;
}

/// @nodoc

class _$_loading implements _loading {
  const _$_loading();

  @override
  String toString() {
    return 'CompetitorActState.loading()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<KompetitorAktivitas> data)
        competitorActivityAll,
    required TResult Function(Response<dynamic> data) addedCompetitorActivity,
    required TResult Function(NetworkExceptions networkExceptions) isError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<KompetitorAktivitas> data)? competitorActivityAll,
    TResult? Function(Response<dynamic> data)? addedCompetitorActivity,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<KompetitorAktivitas> data)? competitorActivityAll,
    TResult Function(Response<dynamic> data)? addedCompetitorActivity,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }
}

abstract class _loading implements CompetitorActState {
  const factory _loading() = _$_loading;
}

/// @nodoc

class _$_competitorActivityAll implements _competitorActivityAll {
  const _$_competitorActivityAll(final List<KompetitorAktivitas> data)
      : _data = data;

  final List<KompetitorAktivitas> _data;
  @override
  List<KompetitorAktivitas> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'CompetitorActState.competitorActivityAll(data: $data)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<KompetitorAktivitas> data)
        competitorActivityAll,
    required TResult Function(Response<dynamic> data) addedCompetitorActivity,
    required TResult Function(NetworkExceptions networkExceptions) isError,
  }) {
    return competitorActivityAll(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<KompetitorAktivitas> data)? competitorActivityAll,
    TResult? Function(Response<dynamic> data)? addedCompetitorActivity,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
  }) {
    return competitorActivityAll?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<KompetitorAktivitas> data)? competitorActivityAll,
    TResult Function(Response<dynamic> data)? addedCompetitorActivity,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    required TResult orElse(),
  }) {
    if (competitorActivityAll != null) {
      return competitorActivityAll(data);
    }
    return orElse();
  }
}

abstract class _competitorActivityAll implements CompetitorActState {
  const factory _competitorActivityAll(final List<KompetitorAktivitas> data) =
      _$_competitorActivityAll;

  List<KompetitorAktivitas> get data;
}

/// @nodoc

class _$_addedCompetitorActivity implements _addedCompetitorActivity {
  const _$_addedCompetitorActivity(this.data);

  @override
  final Response<dynamic> data;

  @override
  String toString() {
    return 'CompetitorActState.addedCompetitorActivity(data: $data)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<KompetitorAktivitas> data)
        competitorActivityAll,
    required TResult Function(Response<dynamic> data) addedCompetitorActivity,
    required TResult Function(NetworkExceptions networkExceptions) isError,
  }) {
    return addedCompetitorActivity(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<KompetitorAktivitas> data)? competitorActivityAll,
    TResult? Function(Response<dynamic> data)? addedCompetitorActivity,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
  }) {
    return addedCompetitorActivity?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<KompetitorAktivitas> data)? competitorActivityAll,
    TResult Function(Response<dynamic> data)? addedCompetitorActivity,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    required TResult orElse(),
  }) {
    if (addedCompetitorActivity != null) {
      return addedCompetitorActivity(data);
    }
    return orElse();
  }
}

abstract class _addedCompetitorActivity implements CompetitorActState {
  const factory _addedCompetitorActivity(final Response<dynamic> data) =
      _$_addedCompetitorActivity;

  Response<dynamic> get data;
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.networkExceptions);

  @override
  final NetworkExceptions networkExceptions;

  @override
  String toString() {
    return 'CompetitorActState.isError(networkExceptions: $networkExceptions)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<KompetitorAktivitas> data)
        competitorActivityAll,
    required TResult Function(Response<dynamic> data) addedCompetitorActivity,
    required TResult Function(NetworkExceptions networkExceptions) isError,
  }) {
    return isError(networkExceptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<KompetitorAktivitas> data)? competitorActivityAll,
    TResult? Function(Response<dynamic> data)? addedCompetitorActivity,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
  }) {
    return isError?.call(networkExceptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<KompetitorAktivitas> data)? competitorActivityAll,
    TResult Function(Response<dynamic> data)? addedCompetitorActivity,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    required TResult orElse(),
  }) {
    if (isError != null) {
      return isError(networkExceptions);
    }
    return orElse();
  }
}

abstract class _Error implements CompetitorActState {
  const factory _Error(final NetworkExceptions networkExceptions) = _$_Error;

  NetworkExceptions get networkExceptions;
}
