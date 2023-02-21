import 'dart:async';

import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:absensi_app/src/core/api/network_exceptions.dart';
import 'package:absensi_app/src/dialogs/toast_wrapper.dart';
import 'package:absensi_app/src/dialogs/widget/x_loading_alert.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../localization/localization_utils.dart';
import '../../../../network/data/resource/resource_repository.dart';
import '../../../../router/coordinator.dart';

part 'resource_bloc.freezed.dart';
part 'resource_event.dart';
part 'resource_state.dart';

class ResourceBloc<T, R> extends Bloc<ResourceEvent<R>, ResourceState<T>> {
  ResourceBloc(this.repository) : super(const _Initial()) {
    on<ResourceEvent<R>>(_onResourceEvent);
  }

  final ResourceRepository<T> repository;

  Future<void> _onResourceEvent(
    ResourceEvent<R> event,
    Emitter<ResourceState<T>> emit,
  ) async {
    await event.when(
      started: () async {},
      store: (request) async {
        emit(_getLoadingState());

        final ApiResult<T> apiResult = await repository.store(
          request: request,
        );

        apiResult.when(success: (T data) async {
          emit(ResourceState.stored(data));
        }, failure: (NetworkExceptions error) async {
          emit(_getErrorState(error));
        });
      },
      update: (id, request) async {
        emit(_getLoadingState());

        final ApiResult<T> apiResult = await repository.update(
          id: id,
          request: request,
        );

        apiResult.when(success: (T data) async {
          emit(ResourceState.stored(data));
        }, failure: (NetworkExceptions error) async {
          emit(_getErrorState(error));
        });
      },
      delete: (id) async {
        emit(_getLoadingState());
        showLoading(XCoordinator.context);

        final ApiResult<String> apiResult = await repository.delete(id: id);

        hideLoading();
        apiResult.when(success: (_) async {
          XToast.show(S.text.common_success);
          emit(const ResourceState.deleted());
        }, failure: (NetworkExceptions error) async {
          emit(_getErrorState(error));
        });
      },
    );
  }

  ResourceState<T> _getErrorState(NetworkExceptions networkExceptions) {
    return ResourceState<T>.isError(networkExceptions);
  }

  ResourceState<T> _getLoadingState() {
    return ResourceState<T>.isLoading();
  }
}
