import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:absensi_app/src/core/api/network_exceptions.dart';
import 'package:absensi_app/src/network/data/outlet/outlet_repository_impl.dart';
import 'package:absensi_app/src/network/model/outlet/kompetitor_promo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'promo_competitor_event.dart';
part 'promo_competitor_state.dart';
part 'promo_competitor_bloc.freezed.dart';

class PromoCompetitorBloc
    extends Bloc<PromoCompetitorEvent, PromoCompetitorState> {
  PromoCompetitorBloc() : super(const _Initial()) {
    on<PromoCompetitorEvent>((event, emit) async {
      await event.when(
        started: () {},
        //ANCHOR - Add Promo Competitor
        addPromoCompetitor: (params) async {
          emit(const PromoCompetitorState.loading());
          final ApiResult<Response> apiResult =
              await OutletRepositoryImpl().addPromoCompetitor(params: params);
          apiResult.when(
              success: (data) =>
                  emit(PromoCompetitorState.addedCompetitorPromo(data)),
              failure: (error) => emit(errorAddedPromoCompetitor(error)));
        },
        //ANCHOR - Get Promo Competitor
        getPromoCompetitor: (FormData params) async {
          emit(const PromoCompetitorState.loading());
          final ApiResult<List<KompetitorPromo>> apiResult =
              await OutletRepositoryImpl()
                  .getPromoCompetitorAll(params: params);
          apiResult.when(
              success: (data) =>
                  emit(PromoCompetitorState.competitorPromos(data)),
              failure: (error) => emit(errorGetPromoCompetitor(error)));
        },
        //ANCHOR - Delete Promo Competitor
        deletePromoCompetitor: (String id) async {
          emit(const PromoCompetitorState.loading());
          final ApiResult<Response> apiResult =
              await OutletRepositoryImpl().deletePromoCompetitor(id: id);
          apiResult.when(
              success: (data) =>
                  emit(PromoCompetitorState.deletedCompetitorPromo(data)),
              failure: (error) => emit(errorDeletedPromoCompetitor(error)));
        },
        //ANCHOR - Update Promo Competitor
        updatePromoCompetitor: (params) async {
          emit(const PromoCompetitorState.loading());
          final ApiResult<Response> apiResult = await OutletRepositoryImpl()
              .updatePromoCompetitor(params: params);
          apiResult.when(
              success: (data) =>
                  emit(PromoCompetitorState.updatedCompetitorPromo(data)),
              failure: (error) => emit(errorUpdatedPromoCompetitor(error)));
        },
      );
    });
  }
}

PromoCompetitorState errorGetPromoCompetitor(
    NetworkExceptions networkExceptions) {
  Logger().e('errorPromoCompetitor');
  return PromoCompetitorState.isError(networkExceptions);
}

PromoCompetitorState errorAddedPromoCompetitor(
    NetworkExceptions networkExceptions) {
  Logger().e('errorAddedPromoCompetitor');
  return PromoCompetitorState.isErrorAdded(networkExceptions);
}

PromoCompetitorState errorDeletedPromoCompetitor(
    NetworkExceptions networkExceptions) {
  Logger().e('errorDeletedPromoCompetitor');
  return PromoCompetitorState.isError(networkExceptions);
}

PromoCompetitorState errorUpdatedPromoCompetitor(
    NetworkExceptions networkExceptions) {
  Logger().e('errorUpdatedPromoCompetitor');
  return PromoCompetitorState.isErrorUpdated(networkExceptions);
}
