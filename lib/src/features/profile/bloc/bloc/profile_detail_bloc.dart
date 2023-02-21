import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:absensi_app/src/core/api/network_exceptions.dart';
import 'package:absensi_app/src/network/data/profile/profile_repository_impl.dart';
import 'package:absensi_app/src/network/model/profile/profile_detail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_detail_event.dart';
part 'profile_detail_state.dart';
part 'profile_detail_bloc.freezed.dart';

class ProfileDetailBloc extends Bloc<ProfileDetailEvent, ProfileDetailState> {
  ProfileDetailBloc() : super(const _Initial()) {
    on<ProfileDetailEvent>((event, emit) async {
      await event.when(
          started: () async {},
          //ANCHOR - Get Detail Profile & Salary
          getDetail: () async {
            emit(const ProfileDetailState.initial());
            final ApiResult<ProfileDetail> apiResult =
                await ProfileRepositoryImpl().profileDetail();
            apiResult.when(
                success: (data) =>
                    emit(ProfileDetailState.detailedProfile(data)),
                failure: (error) => emit(ProfileDetailState.isError(error)));
          });
    });
  }
}
