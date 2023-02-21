import 'dart:async';
import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../model/activity/activity.dart';
import '../common/http.dart';
import 'activity_repository.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  late XHttp http;

  ActivityRepositoryImpl() {
    http = XHttp(
      xBaseUrl: dotenv.env['LARAJET_API_BASE_URL'],
    );
  }

  @override
  Future<ApiResult<ActivityResult>> addActivity({
    required String id,
    required String imagePath,
    required String description,
  }) async {
    final formData = FormData.fromMap({
      'attendance_id': id,
      'photo': await MultipartFile.fromFile(imagePath),
      'description': description,
    });
    return await http.post(
      '/activity',
      data: formData,
      onSuccess: (response) => ActivityResult.fromJson(response.data),
    );
  }

  @override
  Future<ApiResult<ActivityResult>> updateActivity({
    required String idActivity,
    required String attendanceId,
    required String imagePath,
    required String description,
  }) async {
    final formData = FormData.fromMap({
      'attendance_id': attendanceId,
      'photo': await MultipartFile.fromFile(imagePath),
      'description': description,
    });
    return await http.post(
      '/activity/$idActivity',
      data: formData,
      onSuccess: (response) => ActivityResult.fromJson(response.data),
    );
  }

  @override
  Future<ApiResult<List<Activity>?>> showActivityList({
    required int attendanceId,
  }) async {
    final formData = FormData.fromMap({
      'attendance_id': attendanceId,
    });
    return await http.post(
      '/activity/riwayat',
      data: formData,
      onSuccess: (response) => ListActivity.fromJson(response.data).data,
    );
  }

  @override
  Future<ApiResult<ActivityResult>> deleteActivity({
    required String activityId,
  }) async {
    return await http.delete(
      '/activity/$activityId',
      onSuccess: (response) => ActivityResult.fromJson(response.data),
    );
  }
}
