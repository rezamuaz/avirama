import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:absensi_app/src/network/model/activity/activity.dart';

abstract class ActivityRepository {
  Future<ApiResult<ActivityResult>> addActivity({
    required String id,
    required String imagePath,
    required String description,
  });
  Future<ApiResult<ActivityResult>> updateActivity({
    required String idActivity,
    required String attendanceId,
    required String imagePath,
    required String description,
  });

  Future<ApiResult<List<Activity>?>> showActivityList({
    required int attendanceId,
  });
  Future<ApiResult<ActivityResult>> deleteActivity({
    required String activityId,
  });
}
