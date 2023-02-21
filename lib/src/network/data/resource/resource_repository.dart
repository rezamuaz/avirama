import 'package:absensi_app/src/core/api/api_result.dart';

import '../../model/common/pagination_type.dart';

abstract class ResourceRepository<T> {
  Future<ApiResult<PaginationType<T>>> index({
    required int pageNumber,
  });

  Future<ApiResult<PaginationType<T>>> indexPage(
      {required int pageNumber, required String query});

  Future<ApiResult<T>> store<R>({
    required R request,
  });

  Future<ApiResult<T>> update<R>({
    required int id,
    required R request,
  });

  Future<ApiResult<String>> delete({
    required int id,
  });
}
