import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:absensi_app/src/network/model/attendance/attendance.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import '../common/http.dart';
import 'attendance_repository.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  late XHttp http;

  AttendanceRepositoryImpl() {
    http = XHttp(
      xBaseUrl: dotenv.env['LARAJET_API_BASE_URL'],
    );
  }

  @override
  Future<ApiResult<AttendanceInResult>> attendanceInRequest({
    required String storeId,
    required String imagePath,
    required String lang,
    required String long,
  }) async {
    Map data = {};
    data['store_id'] = storeId;
    data['lang'] = lang;
    data['long'] = long;
    data['photo_int'] = imagePath;
    print(jsonEncode(data));
    final formData = FormData.fromMap({
      'store_id': storeId,
      'lang': lang,
      'long': long,
      'photo_int': await MultipartFile.fromFile(imagePath),
    });
    return await http.post(
      '/attendance/check-int',
      data: formData,
      onSuccess: (response) => AttendanceInResult.fromJson(
        response.data,
      ),
    );
  }

  @override
  Future<ApiResult<AttendanceInResult>> attendanceOutRequest({
    required String storeId,
    required String imagePath,
    required String lang,
    required String long,
    required String note,
  }) async {
    Map data = {};
    data['store_id'] = storeId;
    data['lang'] = lang;
    data['long'] = long;
    data['photo_out'] = imagePath;
    print(jsonEncode(data));
    final formData = FormData.fromMap({
      'store_id': storeId,
      'lang': lang,
      'long': long,
      'note': note,
      'photo_out': await MultipartFile.fromFile(imagePath),
    });
    return await http.post(
      '/attendance/check-out',
      data: formData,
      onSuccess: (response) => AttendanceInResult.fromJson(
        response.data,
      ),
    );
  }

  @override
  Future<ApiResult<AttendanceStoreDetail>> storeDetail({
    required String id,
  }) async {
    return await http.get(
      "store/detail/$id",
      onSuccess: (response) => AttendanceStoreDetail.fromJson(
        response.data,
      ),
      authorization: true,
    );
  }

  @override
  Future<ApiResult<ListAttendance?>> attendanceList(
      {int? page, String? startDate, String? endDate}) async {
    return await http.get(
      "/attendance/my-attendance?page=$page&start_date=$startDate&end_date=$endDate",
      onSuccess: (response) => ListAttendance.fromJson(
        response.data,
      ),
      authorization: true,
    );
  }
}
