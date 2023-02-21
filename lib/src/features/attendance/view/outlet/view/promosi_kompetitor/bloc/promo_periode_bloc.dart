import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:absensi_app/src/core/api/network_exceptions.dart';
import 'package:absensi_app/src/network/data/outlet/outlet_repository_impl.dart';
import 'package:absensi_app/src/network/model/outlet/promo_periode.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'promo_periode_event.dart';
part 'promo_periode_state.dart';
part 'promo_periode_bloc.freezed.dart';

class PromoPeriodeBloc extends Bloc<PromoPeriodeEvent, PromoPeriodeState> {
  PromoPeriodeBloc() : super(const _Initial()) {
    on<PromoPeriodeEvent>((event, emit) async {
      await event.when(
        started: () {},
        //ANCHOR - Add Promo Periode by OutletId
        addPromoPeriode: (params) async {
          emit(const PromoPeriodeState.loading());
          final ApiResult<Response> apiResult =
              await OutletRepositoryImpl().addPeriodePromo(params: params);
          apiResult.when(
              success: (data) =>
                  emit(PromoPeriodeState.addedPromoPeriode(data)),
              failure: (error) => emit(errorAddedPromoPeriode(error)));
        },
        //ANCHOR - Edit Promo Periode by OutletId
        editPromoPeriode: (params) async {
          emit(const PromoPeriodeState.loading());
          final ApiResult<Response> apiResult =
              await OutletRepositoryImpl().editPeriodePromo(params: params);
          apiResult.when(
              success: (data) =>
                  emit(PromoPeriodeState.editedPromoPeriode(data)),
              failure: (error) => emit(errorEditedPromoPeriode(error)));
        },
        //ANCHOR - Get Promo Periode All
        getPromoPeriode: (params) async {
          emit(const PromoPeriodeState.loading());
          final ApiResult<List<PromoPeriode>> apiResult =
              await OutletRepositoryImpl().getPeriodePromoAll(params: params);
          apiResult.when(
              success: (data) => emit(PromoPeriodeState.promoPeriodeAll(data)),
              failure: (error) => emit(errorGetPromoPeriode(error)));
        },
        //ANCHOR - Deleted Promo Periode
        deletePromoPeriode: (String id) async {
          emit(const PromoPeriodeState.loading());
          final ApiResult<Response> apiResult =
              await OutletRepositoryImpl().deletePeriodePromo(id: id);
          apiResult.when(
              success: (data) =>
                  emit(PromoPeriodeState.deletedPromoPeriode(data)),
              failure: (error) => emit(errorDeletedPromoPeriode(error)));
        },
      );
    });
  }
}

PromoPeriodeState errorAddedPromoPeriode(NetworkExceptions networkExceptions) {
  Logger().e('errorAddedPromoPeriode');
  return PromoPeriodeState.errorAddedPeriode(networkExceptions);
}

PromoPeriodeState errorEditedPromoPeriode(NetworkExceptions networkExceptions) {
  Logger().e('errorEditedPromoPeriode');
  return PromoPeriodeState.errorEditedPeriode(networkExceptions);
}

PromoPeriodeState errorGetPromoPeriode(NetworkExceptions networkExceptions) {
  Logger().e('errorGetPromoPeriode');
  return PromoPeriodeState.error(networkExceptions);
}

PromoPeriodeState errorDeletedPromoPeriode(
    NetworkExceptions networkExceptions) {
  Logger().e('errorDeletedPromoPeriode');
  return PromoPeriodeState.error(networkExceptions);
}
