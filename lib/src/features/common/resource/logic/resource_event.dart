part of 'resource_bloc.dart';

@freezed
class ResourceEvent<R> with _$ResourceEvent<R> {
  const factory ResourceEvent.started() = _Started;

  const factory ResourceEvent.store(
    R request,
  ) = _Store;

  const factory ResourceEvent.update(
    int id,
    R request,
  ) = _Update;

  const factory ResourceEvent.delete(
    int id,
  ) = _Delete;
}
