part of 'profile_detail_bloc.dart';

@freezed
class ProfileDetailState with _$ProfileDetailState {
  const factory ProfileDetailState.initial() = _Initial;
  const factory ProfileDetailState.isLoading() = _isLoading;
  const factory ProfileDetailState.detailedProfile(ProfileDetail data) =
      _detailedProfile;
  const factory ProfileDetailState.isError(
      NetworkExceptions networkExceptions) = _isError;
}
