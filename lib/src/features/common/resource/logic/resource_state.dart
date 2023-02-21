part of 'resource_bloc.dart';

@freezed
class ResourceState<T> with _$ResourceState<T> {
  const factory ResourceState.initial() = _Initial;
  const factory ResourceState.isLoading() = _IsLoading;
  const factory ResourceState.isError(
    NetworkExceptions networkExceptions,
  ) = _IsError;

  const factory ResourceState.stored(
    T data,
  ) = _Stored;

  const factory ResourceState.deleted() = _Deleted;
}
