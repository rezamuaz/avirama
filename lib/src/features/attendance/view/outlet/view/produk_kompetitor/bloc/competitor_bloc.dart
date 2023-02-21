import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:absensi_app/src/core/api/network_exceptions.dart';
import 'package:absensi_app/src/network/data/outlet/outlet_repository_impl.dart';
import 'package:absensi_app/src/network/model/outlet/kompetitor_activity.dart';
import 'package:absensi_app/src/network/model/outlet/kompetitor_brand.dart';
import 'package:absensi_app/src/network/model/outlet/kompetitor_product.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'competitor_event.dart';
part 'competitor_state.dart';
part 'competitor_bloc.freezed.dart';

class CompetitorBloc extends Bloc<CompetitorEvent, CompetitorState> {
  CompetitorBloc() : super(const _Initial()) {
    on<CompetitorEvent>((event, emit) async {
      await event.when(
        started: () {},
        //ANCHOR - Add Competitor Product
        addCompetitor: (FormData params) async {
          emit(const CompetitorState.isLoading());
          final ApiResult<Response> apiResult =
              await OutletRepositoryImpl().addCompetitorProduct(params: params);
          apiResult.when(
              success: (data) => emit(CompetitorState.addedCompetitor(data)),
              failure: (error) => emit(errorAddCompetitorProduct(error)));
        },
        //ANCHOR - Delete Competitor Product
        deleteCompetitorProduct: (String idProduct) async {
          emit(const CompetitorState.isLoading());
          final ApiResult<Response> apiResult = await OutletRepositoryImpl()
              .deleteCompetitorProduct(idProduct: idProduct);
          apiResult.when(
              success: (data) =>
                  emit(CompetitorState.deletedCompetitorProduct(data)),
              failure: (error) => emit(errorDeleteCompetitorProduct(error)));
        },
        //ANCHOR - Update Competitor Product
        updateCompetitorProduct: (FormData params) async {
          emit(const CompetitorState.isLoading());
          final ApiResult<Response> apiResult = await OutletRepositoryImpl()
              .updateCompetitorProduct(params: params);
          apiResult.when(
              success: (data) =>
                  emit(CompetitorState.updatedCompetitorProduct(data)),
              failure: (error) => emit(errorUpdateCompetitorProduct(error)));
        },
        //ANCHOR - Get Competitor Product
        getCompetitorProducts: (String idOutlet) async {
          emit(const CompetitorState.isLoading());
          final ApiResult<List<KompetitorProduct>> apiResult =
              await OutletRepositoryImpl()
                  .competitorProducts(params: {"id_outlet": idOutlet});
          apiResult.when(
              success: (data) => emit(CompetitorState.competitorProducts(data)),
              failure: (error) => emit(errorGetCompetitorProduct(error)));
        },
        //ANCHOR - Get Competitor Product Brand
        getCompetitorProductBrand: () async {
          emit(const CompetitorState.isLoading());
          final ApiResult<List<KompetitorBrand>> apiResult =
              await OutletRepositoryImpl().getCompetitorProductBrand();
          apiResult.when(
              success: (data) =>
                  emit(CompetitorState.competitorProductBrand(data)),
              failure: (error) => emit(errorGetCompetitorProductBrand(error)));
        },
      );
    });
  }
}

CompetitorState errorGetCompetitorProduct(NetworkExceptions networkExceptions) {
  Logger().e('errorGetCompetitorProduct');
  return CompetitorState.isError(networkExceptions);
}

CompetitorState errorAddCompetitorProduct(NetworkExceptions networkExceptions) {
  Logger().e('errorAddCompetitorProduct');
  return CompetitorState.isError(networkExceptions);
}

CompetitorState errorDeleteCompetitorProduct(
    NetworkExceptions networkExceptions) {
  Logger().e('errorDeleteCompetitorProduct');
  return CompetitorState.isError(networkExceptions);
}

CompetitorState errorUpdateCompetitorProduct(
    NetworkExceptions networkExceptions) {
  Logger().e('errorUpdateCompetitorProduct');
  return CompetitorState.isError(networkExceptions);
}

CompetitorState errorGetCompetitorProductBrand(
    NetworkExceptions networkExceptions) {
  Logger().e('errorGetCompetitorProductBrand');
  return CompetitorState.isError(networkExceptions);
}
