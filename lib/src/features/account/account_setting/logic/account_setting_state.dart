part of 'account_setting_bloc.dart';

@freezed
class AccountSettingState with _$AccountSettingState {
  const factory AccountSettingState.initial() = _Initial;
  const factory AccountSettingState.isLoading() = _IsLoading;
  const factory AccountSettingState.uploadingImage() = _UploadingImage;
  const factory AccountSettingState.isError(
      NetworkExceptions networkExceptions) = _IsError;

  const factory AccountSettingState.success(String message) = _Success;

  const factory AccountSettingState.successUpdatePhoneNumber(
    String message,
  ) = _SuccessUpdatePhoneNumber;

  const factory AccountSettingState.successUpdatePersonalInformation(
    PersonalInformation personalInformation,
  ) = _SuccessUpdatePersonalInformation;

  const factory AccountSettingState.successUpdateEmail(
    String message,
  ) = _SuccessUpdateEmail;

  const factory AccountSettingState.successUpdateProfilePhoto(
      String imagePath) = _SuccessUpdateProfilePhoto;

  const factory AccountSettingState.successAddSocialAccount(
      SocialAccount socialAccount) = _SuccessAddSocialAccount;
}
