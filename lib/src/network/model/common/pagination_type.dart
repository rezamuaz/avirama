import 'package:absensi_app/src/network/model/common/link.dart';
import 'package:absensi_app/src/network/model/common/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

import '../account_setting/social_account/social_account.dart';
import '../activity/activity.dart';
import '../customer/customer.dart';
import '../daily_report/daily_report.dart';
import '../outlet/outlet.dart';

part 'pagination_type.freezed.dart';
part 'pagination_type.g.dart';

@freezed
class PaginationType<T> with _$PaginationType<T> {
  const factory PaginationType({
    @_Converter() List<T>? data,
    Link? links,
    Meta? meta,
  }) = _PaginationType<T>;

  factory PaginationType.fromJson(Map<String, dynamic> map) =>
      _$PaginationTypeFromJson<T>(map);
}

class _Converter<T> implements JsonConverter<T, Object?> {
  const _Converter();

  @override
  T fromJson(Object? json) {
    switch (T) {
      case SocialAccount:
        return SocialAccount.fromJson(json as Map<String, dynamic>) as T;
      case Customer:
        return Customer.fromJson(json as Map<String, dynamic>) as T;
      case DailyReport:
        return DailyReport.fromJson(json as Map<String, dynamic>) as T;
      case Outlet:
        return Outlet.fromJson(json as Map<String, dynamic>) as T;
      case SelectOutlet:
        return SelectOutlet.fromJson(json as Map<String, dynamic>) as T;
      case Activity:
        return Activity.fromJson(json as Map<String, dynamic>) as T;
      default:
        Logger().e("Unsupported resource type: $T");
        throw UnsupportedError('Unsupported type: $T');
    }
  }

  @override
  Object? toJson(T object) => object;
}
