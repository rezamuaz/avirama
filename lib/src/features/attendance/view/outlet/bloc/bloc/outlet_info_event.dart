part of 'outlet_info_bloc.dart';

@freezed
class OutletInfoEvent with _$OutletInfoEvent {
  const factory OutletInfoEvent.started() = _Started;
  const factory OutletInfoEvent.getOutletInfo(Map<String, dynamic> params) =
      _getOutletInfo;
}
