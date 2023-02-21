import 'package:freezed_annotation/freezed_annotation.dart';

part 'outlet_report.freezed.dart';
part 'outlet_report.g.dart';

@freezed
class OutletReport with _$OutletReport {
  factory OutletReport(
      {required String? id,
      required String? name,
      required String? address,
      required String? long,
      required String? lang,
      required String? image,
      required String? radius,
      required String? status,
      @JsonKey(name: "target_bulanan") required String? targetBulanan,
      @JsonKey(name: "is_complete") required bool? isComplete}) = _OutletReport;

  factory OutletReport.fromJson(Map<String, dynamic> json) =>
      _$OutletReportFromJson(json);
}
