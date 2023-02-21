import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:absensi_app/src/core/api/network_exceptions.dart';
import 'package:absensi_app/src/network/data/outlet/outlet_repository_impl.dart';
import 'package:absensi_app/src/network/data/report/report_repository_impl.dart';
import 'package:absensi_app/src/network/model/outlet/product_outlet.dart';
import 'package:absensi_app/src/network/model/report/outlet_report.dart';
import 'package:absensi_app/src/network/model/report/user_report.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'report_event.dart';
part 'report_state.dart';
part 'report_bloc.freezed.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportBloc() : super(const _Initial()) {
    on<ReportEvent>((event, emit) async {
      await event.when(
        started: () async {},
        //ANCHOR - Get Outlet List by Daftar Kunjungan hari ini
        getOutletList: () async {
          emit(const ReportState.isLoading());
          final ApiResult<List<OutletReport>> apiResult =
              await ReportRepositoryImpl().outletList();
          apiResult.when(
              success: (data) => emit(ReportState.outletListLoaded(data)),
              failure: (error) => getErrorOutletList(error));
        },
        //ANCHOR - Get Product assigned to Outlet
        getProductOutletList: (String outletId) async {
          emit(const ReportState.isLoading());
          ApiResult<ProductOutletPaging> apiResult =
              await OutletRepositoryImpl()
                  .productOutletById(outletId: outletId);
          apiResult.when(
            success: (data) => emit(ReportState.productListLoaded(data)),
            failure: (error) => getErrorProductOutletList(error),
          );
        },
        //ANCHOR - Get User Report by Jabatan
        getUserReport: (jabatan) async {
          emit(const ReportState.isLoading());
          final ApiResult<List<UserReport>> apiResult =
              await ReportRepositoryImpl().userReportList(jabatan);
          apiResult.when(
            success: (data) => emit(ReportState.userReportLoaded(data)),
            failure: (error) => getErrorUserReport(error),
          );
        },
        //ANCHOR - Send Report
        sendReport: (params) async {
          emit(const ReportState.sendReportLoading());
          final ApiResult<String> apiResult =
              await ReportRepositoryImpl().sendReport(params);
          apiResult.when(
            success: (data) => emit(ReportState.reportSended(data)),
            failure: (error) => emit(getErrorSendReport(error)),
          );
        },
      );
    });
  }
}

ReportState getErrorOutletList(NetworkExceptions networkExceptions) {
  Logger().e('getErrorOutletList');
  return ReportState.isError(networkExceptions);
}

ReportState getErrorProductOutletList(NetworkExceptions networkExceptions) {
  Logger().e('getErrorProductOutletList');
  return ReportState.isError(networkExceptions);
}

ReportState getErrorUserReport(NetworkExceptions networkExceptions) {
  Logger().e('getErrorUserReport');
  return ReportState.isError(networkExceptions);
}

ReportState getErrorSendReport(NetworkExceptions networkExceptions) {
  Logger().e('getErrorSendReport');
  return ReportState.isError(networkExceptions);
}
