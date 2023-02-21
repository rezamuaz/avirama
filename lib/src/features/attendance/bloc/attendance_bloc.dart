//////////////////////////////////////////////////BLOC///////////////////////////////////////////
import 'dart:async';
import 'dart:developer';
import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:absensi_app/src/core/api/network_exceptions.dart';
import 'package:absensi_app/src/dialogs/toast_wrapper.dart';
import 'package:absensi_app/src/network/data/activity/activity_repository_impl.dart';
import 'package:absensi_app/src/network/data/attendance/attendance_repository_impl.dart';
import 'package:absensi_app/src/network/model/attendance/attendance.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import '../../../network/model/activity/activity.dart';
part 'attendance_bloc.freezed.dart';
part 'attendance_event.dart';
part 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  AttendanceBloc() : super(const _Initial()) {
    on<AttendanceEvent>(_onAttendanceEvent);
  }

  Future<void> _onAttendanceEvent(
      AttendanceEvent event, Emitter<AttendanceState> emit) async {
    await event.whenOrNull(
      //ANCHOR - Request Logout
      attendanceOutRequest: (storeId, imagePath, lang, long, note) async {
        emit(const AttendanceState.isLoadingCheckIn());

        final ApiResult<AttendanceInResult> apiResult =
            await AttendanceRepositoryImpl().attendanceOutRequest(
                storeId: storeId,
                imagePath: imagePath,
                lang: lang,
                long: long,
                note: note);
        apiResult.when(
          success: (data) {
            emit(AttendanceState.attendanceinResult(data));
          },
          failure: (error) {
            emit(const AttendanceState.isDataNull());
          },
        );
      },
      isAttendanceAllowedEvent: (attendanceId) async {
        emit(const AttendanceState.isLoading());

        final ApiResult<List<Activity>?> apiResult =
            await ActivityRepositoryImpl()
                .showActivityList(attendanceId: attendanceId);
        apiResult.when(
          success: (data) {
            int dailyCount = 0;
            int beforeAfterCount = 0;
            bool isAbsensiAllowed = false;
            if (data != null) {
              for (var list in data) {
                if (list.description.contains('harian')) {
                  dailyCount += 1;
                }
                if (list.description.contains('before') ||
                    list.description.contains('after')) {
                  beforeAfterCount += 1;
                }
              }
            }
            if (dailyCount > 0 && beforeAfterCount.isEven) {
              isAbsensiAllowed = true;
            }
            emit(AttendanceState.isAttendanceAllowed(isAbsensiAllowed));
            log(data.toString());
          },
          failure: (error) {
            emit(_getErrorState(error));
          },
        );
      },
      //ANCHOR - Absensi Aktif
      activeAttendance: () async {
        emit(const AttendanceState.isLoadingActiveAttendance());
        final ApiResult<ListAttendance?> apiResult =
            await AttendanceRepositoryImpl().attendanceList(
                page: 1,
                startDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                endDate: DateFormat('yyyy-MM-dd').format(DateTime.now()));

        apiResult.when(
          success: (data) {
            Logger().e(data);
            if (data == null) return null;
            for (var i in data.data!) {
              if (i.checkInt != null && i.checkOut == null) {
                if (i.date == DateFormat('yyyy-MM-dd').format(DateTime.now())) {
                  emit(AttendanceState.loadedActiveAttendance(i));
                }
              }
            }
          },
          failure: (error) {
            // Logger().e(error);
            emit(_getErrorState(error));
          },
        );
      },

      //ANCHOR - List Absensi
      attendanceList: (page, startDate, endDate) async {
        emit(const AttendanceState.isLoading());
        final ApiResult<ListAttendance?> apiResult =
            await AttendanceRepositoryImpl().attendanceList(
                page: page, startDate: startDate, endDate: endDate);
        apiResult.when(
          success: (data) {
            emit(AttendanceState.loadedAttendances(data));
          },
          failure: (error) {
            emit(_getErrorState(error));
          },
        );
      },
      //ANCHOR - Detail Store
      getStoreDetail: (id) async {},
      //ANCHOR - Absensi Request
      attendanceInRequest: (id, path, lang, long) async {
        emit(const AttendanceState.isLoadingCheckIn());

        final ApiResult<AttendanceInResult> apiResult =
            await AttendanceRepositoryImpl().attendanceInRequest(
                storeId: id, imagePath: path, lang: lang, long: long);
        apiResult.when(
          success: (data) {
            emit(AttendanceState.attendanceinResult(data));
          },
          failure: (error) {
            emit(const AttendanceState.isDataNull());
          },
        );
      },
      started: () async {},
      show: (int id) async {
        emit(_getLoadingState());
      },
      //ANCHOR - Show Activity
      showActivity: (attendanceId) async {
        final ApiResult<List<Activity>?> apiResult =
            await ActivityRepositoryImpl()
                .showActivityList(attendanceId: attendanceId);
        apiResult.when(
          success: (data) {
            emit(AttendanceState.loadedDailyPhoto(data));
            log(data.toString());
          },
          failure: (error) {
            emit(_getErrorState(error));
          },
        );
      },
    );
  }

  AttendanceState _getErrorState(NetworkExceptions networkExceptions) {
    return AttendanceState.isError(networkExceptions);
  }

  AttendanceState _getLoadingState() {
    return const AttendanceState.isLoading();
  }
}

class BeforeAfterPhotoBloc extends Bloc<AttendanceEvent, AttendanceState> {
  BeforeAfterPhotoBloc() : super(const _Initial()) {
    on<AttendanceEvent>(_onAttendanceEvent);
  }
  Future<void> _onAttendanceEvent(
      AttendanceEvent event, Emitter<AttendanceState> emit) async {
    await event.whenOrNull(
      showBeforeAfter: (attendanceId) async {
        log('showBeforeAfterBloc');

        emit(const AttendanceState.isLoading());
        final ApiResult<List<Activity>?> apiResult =
            await ActivityRepositoryImpl()
                .showActivityList(attendanceId: attendanceId);
        apiResult.when(
          success: (data) {
            final List<Activity> beforeAfterPhoto = [];
            if (data != null) {
              for (var list in data) {
                if (list.description.contains('before') ||
                    list.description.contains('after')) {
                  beforeAfterPhoto.add(list);
                }
              }
            }

            emit(AttendanceState.loadedBeforeAfterPhoto(
                beforeAfterPhoto.reversed.toList()));
            log(data.toString());
          },
          failure: (error) {
            emit(_getErrorState(error));
          },
        );
      },
      addFotoBeforeAfter: (attendanceId, imagePath, desc) async {
        emit(const AttendanceState.isLoading());

        final ApiResult<ActivityResult> apiResult =
            await ActivityRepositoryImpl().addActivity(
          description: desc,
          id: attendanceId.toString(),
          imagePath: imagePath,
        );
        apiResult.when(
          success: (data) async {
            emit(const AttendanceState.isLoading());
            final ApiResult<List<Activity>?> apiResult =
                await ActivityRepositoryImpl()
                    .showActivityList(attendanceId: attendanceId);

            apiResult.when(
              success: (data) {
                XToast.show('foto before after berhasil ditambahkan');
                log(data.toString());
              },
              failure: (error) {
                XToast.show('foto before after gagal ditambahkan');
                emit(_getErrorState(error));
              },
            );
            log(data.toString());
          },
          failure: (error) {
            emit(_getErrorState(error));
          },
        );
      },
      beforeAfterCountEvent: (attendanceId) async {
        emit(_getLoadingState());
        List<Activity> beforeAfterList = [];
        final ApiResult<List<Activity>?> apiResult =
            await ActivityRepositoryImpl().showActivityList(
          attendanceId: attendanceId,
        );
        apiResult.when(
          success: (data) {
            if (data != null) {
              for (var element in data) {
                if (element.description.contains('before') ||
                    element.description.contains('after')) {
                  beforeAfterList.add(element);
                }
              }
              emit(AttendanceState.beforeAfterCount(beforeAfterList.length));
            } else {
              emit(const AttendanceState.beforeAfterCount(0));
            }
          },
          failure: (error) {
            emit(_getErrorState(error));
          },
        );
      },
    );
  }

  AttendanceState _getErrorState(NetworkExceptions networkExceptions) {
    return AttendanceState.isError(networkExceptions);
  }

  AttendanceState _getLoadingState() {
    return const AttendanceState.isLoading();
  }
}

class DailyPhotoBloc extends Bloc<AttendanceEvent, AttendanceState> {
  DailyPhotoBloc() : super(const _Initial()) {
    on<AttendanceEvent>(_onAttendanceEvent);
  }
  Future<void> _onAttendanceEvent(
      AttendanceEvent event, Emitter<AttendanceState> emit) async {
    await event.whenOrNull(
      showDaily: (attendanceId) async {
        log('DailyPhotoBloc');
        emit(const AttendanceState.isLoading());
        final ApiResult<List<Activity>?> apiResult =
            await ActivityRepositoryImpl()
                .showActivityList(attendanceId: attendanceId);
        apiResult.when(
          success: (data) {
            final List<Activity> dailyPhoto = [];
            if (data != null) {
              for (var list in data) {
                if (list.description == 'foto_harian') {
                  dailyPhoto.add(list);
                }
              }
            }
            emit(
                AttendanceState.loadedDailyPhoto(dailyPhoto.reversed.toList()));
            log(data.toString());
          },
          failure: (error) {
            emit(_getErrorState(error));
          },
        );
      },
      addFotoHarian: (attendanceId, imagePath) async {
        emit(const AttendanceState.isLoading());

        final ApiResult<ActivityResult> apiResult =
            await ActivityRepositoryImpl().addActivity(
          description: 'foto_harian',
          id: attendanceId.toString(),
          imagePath: imagePath,
        );
        apiResult.when(
          success: (data) async {
            log('DailyPhotoBloc');
            emit(const AttendanceState.isLoading());
            final ApiResult<List<Activity>?> apiResult =
                await ActivityRepositoryImpl()
                    .showActivityList(attendanceId: attendanceId);

            apiResult.when(
              success: (data) {
                XToast.show('foto harian berhasil ditambahkan');
                log(data.toString());
              },
              failure: (error) {
                emit(_getErrorState(error));
              },
            );
            log(data.toString());
          },
          failure: (error) {
            emit(_getErrorState(error));
          },
        );
      },
      dailyPhotoCountEvent: (attendanceId) async {
        emit(const AttendanceState.isLoading());

        final ApiResult<List<Activity>?> apiResult =
            await ActivityRepositoryImpl().showActivityList(
          attendanceId: attendanceId,
        );
        apiResult.when(
          success: (data) {
            List<Activity> dailyPhotoList = [];
            if (data != null) {
              for (var element in data) {
                if (element.description.contains('foto_harian')) {
                  dailyPhotoList.add(element);
                }
              }
              Comparator<Activity> sortById = (a, b) => a.id.compareTo(b.id);
              dailyPhotoList.sort(sortById);

              emit(AttendanceState.dailyCount(dailyPhotoList.length));
            } else {
              emit(const AttendanceState.dailyCount(0));
            }
          },
          failure: (error) {
            emit(_getErrorState(error));
          },
        );
      },
    );
  }

  AttendanceState _getErrorState(NetworkExceptions networkExceptions) {
    return AttendanceState.isError(networkExceptions);
  }

  AttendanceState _getLoadingState() {
    return const AttendanceState.isLoading();
  }

  @override
  void onChange(Change<AttendanceState> change) {
    Logger().e(change);
    super.onChange(change);
  }

  @override
  void onEvent(AttendanceEvent event) {
    Logger().v(event);
    super.onEvent(event);
  }
}
