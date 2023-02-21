part of 'report_bloc.dart';

@freezed
class ReportEvent with _$ReportEvent {
  const factory ReportEvent.started() = _Started;
  const factory ReportEvent.getOutletList() = _getOutletList;
  const factory ReportEvent.getProductOutletList(String outletId) =
      _getProductOutletList;
  const factory ReportEvent.getUserReport(String jabatan) = _getUserReport;
  const factory ReportEvent.sendReport(Map<String, dynamic> params) =
      _sendReport;
}
