import 'package:absensi_app/src/core/api/api_result.dart';

import '../../model/common/pagination_type.dart';
import '../../model/common/resource.dart';
import '../common/http.dart';

import 'resource_repository.dart';

class ResourceRepositoryImpl<T> extends ResourceRepository<T> {
  late XHttp http;
  late String endPoint;

  ResourceRepositoryImpl(this.endPoint, {String? xBaseUrl}) {
    http = XHttp(
      xBaseUrl: xBaseUrl,
    );
  }

  @override
  Future<ApiResult<PaginationType<T>>> index({
    required int pageNumber,
  }) async {
    return await http.get(
      "$endPoint?page=$pageNumber",
      onSuccess: (response) => PaginationType<T>.fromJson(
        response.data,
      ),
      authorization: true,
    );
  }

  @override
  Future<ApiResult<PaginationType<T>>> indexPage(
      {required int pageNumber, required String query}) async {
    return await http.get(
      "$endPoint?query=$query&page=$pageNumber",
      onSuccess: (response) => PaginationType<T>.fromJson(
        response.data,
      ),
      authorization: true,
    );
  }

  @override
  Future<ApiResult<T>> store<R>({
    required R request,
  }) async {
    return await http.post(
      endPoint,
      data: ResourceConverter<R>().toJson(request),
      onSuccess: (response) => ResourceConverter<T>().fromJson(
        response.data['data'],
      ),
    );
  }

  @override
  Future<ApiResult<T>> update<R>({
    required int id,
    required R request,
  }) async {
    return await http.post(
      '$endPoint/$id',
      data: ResourceConverter<R>().toJson(request),
      onSuccess: (response) => ResourceConverter<T>().fromJson(
        response.data['data'],
      ),
    );
  }

  @override
  Future<ApiResult<String>> delete({required int id}) async {
    return await http.delete('$endPoint/$id');
  }
}
