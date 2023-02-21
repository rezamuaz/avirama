import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_report.freezed.dart';
part 'daily_report.g.dart';

@freezed
class DailyReport with _$DailyReport {
  const factory DailyReport({
    required int id,
    required String name,
    required String time,
    required String location,
    @JsonKey(name: "description") required String note,
    required String long,
    required String lang,
    @JsonKey(name: "created_at") required String createdAt,
  }) = _DailyReport;

  const DailyReport._();

  factory DailyReport.fromJson(Map<String, dynamic> map) =>
      _$DailyReportFromJson(map);
}

@freezed
class DailyReportRequest with _$DailyReportRequest {
  const factory DailyReportRequest({
    required String name,
    required String time,
    required String location,
    @JsonKey(name: "description") required String note,
    required String long,
    required String lang,
  }) = _DailyReportRequest;

  const DailyReportRequest._();

  factory DailyReportRequest.fromJson(Map<String, dynamic> map) =>
      _$DailyReportRequestFromJson(map);
}
