// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resource_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ResourceEvent<R> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(R request) store,
    required TResult Function(int id, R request) update,
    required TResult Function(int id) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(R request)? store,
    TResult? Function(int id, R request)? update,
    TResult? Function(int id)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(R request)? store,
    TResult Function(int id, R request)? update,
    TResult Function(int id)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$_Started<R> implements _Started<R> {
  const _$_Started();

  @override
  String toString() {
    return 'ResourceEvent<$R>.started()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(R request) store,
    required TResult Function(int id, R request) update,
    required TResult Function(int id) delete,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(R request)? store,
    TResult? Function(int id, R request)? update,
    TResult? Function(int id)? delete,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(R request)? store,
    TResult Function(int id, R request)? update,
    TResult Function(int id)? delete,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }
}

abstract class _Started<R> implements ResourceEvent<R> {
  const factory _Started() = _$_Started<R>;
}

/// @nodoc

class _$_Store<R> implements _Store<R> {
  const _$_Store(this.request);

  @override
  final R request;

  @override
  String toString() {
    return 'ResourceEvent<$R>.store(request: $request)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(R request) store,
    required TResult Function(int id, R request) update,
    required TResult Function(int id) delete,
  }) {
    return store(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(R request)? store,
    TResult? Function(int id, R request)? update,
    TResult? Function(int id)? delete,
  }) {
    return store?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(R request)? store,
    TResult Function(int id, R request)? update,
    TResult Function(int id)? delete,
    required TResult orElse(),
  }) {
    if (store != null) {
      return store(request);
    }
    return orElse();
  }
}

abstract class _Store<R> implements ResourceEvent<R> {
  const factory _Store(final R request) = _$_Store<R>;

  R get request;
}

/// @nodoc

class _$_Update<R> implements _Update<R> {
  const _$_Update(this.id, this.request);

  @override
  final int id;
  @override
  final R request;

  @override
  String toString() {
    return 'ResourceEvent<$R>.update(id: $id, request: $request)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(R request) store,
    required TResult Function(int id, R request) update,
    required TResult Function(int id) delete,
  }) {
    return update(id, request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(R request)? store,
    TResult? Function(int id, R request)? update,
    TResult? Function(int id)? delete,
  }) {
    return update?.call(id, request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(R request)? store,
    TResult Function(int id, R request)? update,
    TResult Function(int id)? delete,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(id, request);
    }
    return orElse();
  }
}

abstract class _Update<R> implements ResourceEvent<R> {
  const factory _Update(final int id, final R request) = _$_Update<R>;

  int get id;
  R get request;
}

/// @nodoc

class _$_Delete<R> implements _Delete<R> {
  const _$_Delete(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'ResourceEvent<$R>.delete(id: $id)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(R request) store,
    required TResult Function(int id, R request) update,
    required TResult Function(int id) delete,
  }) {
    return delete(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(R request)? store,
    TResult? Function(int id, R request)? update,
    TResult? Function(int id)? delete,
  }) {
    return delete?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(R request)? store,
    TResult Function(int id, R request)? update,
    TResult Function(int id)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(id);
    }
    return orElse();
  }
}

abstract class _Delete<R> implements ResourceEvent<R> {
  const factory _Delete(final int id) = _$_Delete<R>;

  int get id;
}

/// @nodoc
mixin _$ResourceState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(NetworkExceptions networkExceptions) isError,
    required TResult Function(T data) stored,
    required TResult Function() deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
    TResult? Function(T data)? stored,
    TResult? Function()? deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    TResult Function(T data)? stored,
    TResult Function()? deleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$_Initial<T> implements _Initial<T> {
  const _$_Initial();

  @override
  String toString() {
    return 'ResourceState<$T>.initial()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(NetworkExceptions networkExceptions) isError,
    required TResult Function(T data) stored,
    required TResult Function() deleted,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
    TResult? Function(T data)? stored,
    TResult? Function()? deleted,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    TResult Function(T data)? stored,
    TResult Function()? deleted,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }
}

abstract class _Initial<T> implements ResourceState<T> {
  const factory _Initial() = _$_Initial<T>;
}

/// @nodoc

class _$_IsLoading<T> implements _IsLoading<T> {
  const _$_IsLoading();

  @override
  String toString() {
    return 'ResourceState<$T>.isLoading()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(NetworkExceptions networkExceptions) isError,
    required TResult Function(T data) stored,
    required TResult Function() deleted,
  }) {
    return isLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
    TResult? Function(T data)? stored,
    TResult? Function()? deleted,
  }) {
    return isLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    TResult Function(T data)? stored,
    TResult Function()? deleted,
    required TResult orElse(),
  }) {
    if (isLoading != null) {
      return isLoading();
    }
    return orElse();
  }
}

abstract class _IsLoading<T> implements ResourceState<T> {
  const factory _IsLoading() = _$_IsLoading<T>;
}

/// @nodoc

class _$_IsError<T> implements _IsError<T> {
  const _$_IsError(this.networkExceptions);

  @override
  final NetworkExceptions networkExceptions;

  @override
  String toString() {
    return 'ResourceState<$T>.isError(networkExceptions: $networkExceptions)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(NetworkExceptions networkExceptions) isError,
    required TResult Function(T data) stored,
    required TResult Function() deleted,
  }) {
    return isError(networkExceptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
    TResult? Function(T data)? stored,
    TResult? Function()? deleted,
  }) {
    return isError?.call(networkExceptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    TResult Function(T data)? stored,
    TResult Function()? deleted,
    required TResult orElse(),
  }) {
    if (isError != null) {
      return isError(networkExceptions);
    }
    return orElse();
  }
}

abstract class _IsError<T> implements ResourceState<T> {
  const factory _IsError(final NetworkExceptions networkExceptions) =
      _$_IsError<T>;

  NetworkExceptions get networkExceptions;
}

/// @nodoc

class _$_Stored<T> implements _Stored<T> {
  const _$_Stored(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'ResourceState<$T>.stored(data: $data)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(NetworkExceptions networkExceptions) isError,
    required TResult Function(T data) stored,
    required TResult Function() deleted,
  }) {
    return stored(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
    TResult? Function(T data)? stored,
    TResult? Function()? deleted,
  }) {
    return stored?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    TResult Function(T data)? stored,
    TResult Function()? deleted,
    required TResult orElse(),
  }) {
    if (stored != null) {
      return stored(data);
    }
    return orElse();
  }
}

abstract class _Stored<T> implements ResourceState<T> {
  const factory _Stored(final T data) = _$_Stored<T>;

  T get data;
}

/// @nodoc

class _$_Deleted<T> implements _Deleted<T> {
  const _$_Deleted();

  @override
  String toString() {
    return 'ResourceState<$T>.deleted()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(NetworkExceptions networkExceptions) isError,
    required TResult Function(T data) stored,
    required TResult Function() deleted,
  }) {
    return deleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
    TResult? Function(T data)? stored,
    TResult? Function()? deleted,
  }) {
    return deleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    TResult Function(T data)? stored,
    TResult Function()? deleted,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted();
    }
    return orElse();
  }
}

abstract class _Deleted<T> implements ResourceState<T> {
  const factory _Deleted() = _$_Deleted<T>;
}
