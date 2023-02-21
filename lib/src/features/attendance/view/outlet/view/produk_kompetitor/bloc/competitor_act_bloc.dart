import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:absensi_app/src/core/api/network_exceptions.dart';
import 'package:absensi_app/src/network/data/outlet/outlet_repository_impl.dart';
import 'package:absensi_app/src/network/model/outlet/kompetitor_activity.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'competitor_act_event.dart';
part 'competitor_act_state.dart';
part 'competitor_act_bloc.freezed.dart';

class CompetitorActBloc extends Bloc<CompetitorActEvent, CompetitorActState> {
  CompetitorActBloc() : super(const _initial()) {
    on<CompetitorActEvent>((event, emit) async {
      await event.when(
          started: () async {},
          //ANCHOR -  Get Competitor Activity
          getCompetitorActivityAll: (params) async {
            emit(const CompetitorActState.loading());
            final ApiResult<List<KompetitorAktivitas>> apiResult =
                await OutletRepositoryImpl()
                    .getCompetitorActivityAll(params: params);
            apiResult.when(
                success: (data) =>
                    emit(CompetitorActState.competitorActivityAll(data)),
                failure: (error) => emit(errorGetCompetitorActivity(error)));
          },
          //ANCHOR - Add Competitor Activity
          addCompetitorActivity: (params) async {
            emit(const CompetitorActState.loading());
            final ApiResult<Response> apiResult = await OutletRepositoryImpl()
                .addCompetitorActivity(params: params);
            apiResult.when(
                success: (data) =>
                    emit(CompetitorActState.addedCompetitorActivity(data)),
                failure: (error) => emit(errorAddCompetitorActivity(error)));
          });
    });
  }
}

CompetitorActState errorGetCompetitorActivity(
    NetworkExceptions networkExceptions) {
  Logger().e('errorGetCompetitorActivity');
  return CompetitorActState.isError(networkExceptions);
}

CompetitorActState errorAddCompetitorActivity(
    NetworkExceptions networkExceptions) {
  Logger().e('errorAddCompetitorActivity');
  return CompetitorActState.isError(networkExceptions);
}
