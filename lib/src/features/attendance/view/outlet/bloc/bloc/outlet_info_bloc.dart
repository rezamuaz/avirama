import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:absensi_app/src/core/api/network_exceptions.dart';
import 'package:absensi_app/src/network/data/outlet/outlet_repository_impl.dart';
import 'package:absensi_app/src/network/model/outlet/outlet_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'outlet_info_event.dart';
part 'outlet_info_state.dart';
part 'outlet_info_bloc.freezed.dart';

class OutletInfoBloc extends Bloc<OutletInfoEvent, OutletInfoState> {
  OutletInfoBloc() : super(const _Initial()) {
    on<OutletInfoEvent>((event, emit) async {
      await event.when(
        started: () {},
        //ANCHOR - Get Outlet Info for Outlet Dashboard
        getOutletInfo: (Map<String, dynamic> params) async {
          emit(const OutletInfoState.isLoading());
          final ApiResult<OutletInfo> apiResult =
              await OutletRepositoryImpl().outletDashboard(params: params);
          apiResult.when(
              success: (data) => emit(OutletInfoState.outletInfo(data)),
              failure: (error) => getErrOutletInfo(error));
        },
      );
    });
  }
}

OutletInfoState getErrOutletInfo(NetworkExceptions networkExceptions) {
  Logger().e('getErrOutletInfo');
  return OutletInfoState.isError(networkExceptions);
}
