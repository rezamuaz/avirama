part of 'outlet_info_bloc.dart';

@freezed
class OutletInfoState with _$OutletInfoState {
  const factory OutletInfoState.initial() = _Initial;
  const factory OutletInfoState.isLoading() = _IsLoading;
  const factory OutletInfoState.outletInfo(OutletInfo data) = _OutletInfo;
  const factory OutletInfoState.isError(NetworkExceptions error) = _IsError;
}
