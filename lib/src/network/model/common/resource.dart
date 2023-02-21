import 'package:absensi_app/src/network/model/outlet/outlet.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

import '../customer/customer.dart';
import '../daily_report/daily_report.dart';

class ResourceConverter<T> implements JsonConverter<T, Object?> {
  const ResourceConverter();

  @override
  T fromJson(Object? json) {
    switch (T) {
      case Customer:
        return Customer.fromJson(json as Map<String, dynamic>) as T;
      case DailyReport:
        return DailyReport.fromJson(json as Map<String, dynamic>) as T;
      case Outlet:
        return Outlet.fromJson(json as Map<String, dynamic>) as T;
      default:
        Logger().e("Unsupported resource type: $T");
        throw UnsupportedError('Unsupported resource type: $T');
    }
  }

  @override
  Object? toJson(T object) => object;
}
