part of 'account_setting_bloc.dart';

@freezed
class AccountSettingEvent with _$AccountSettingEvent {
  const factory AccountSettingEvent.started() = _Started;

  const factory AccountSettingEvent.changePassword(
    ChangePassword changePassword,
  ) = _ChangePassword;

  const factory AccountSettingEvent.updatePhoneNumber(
    PhoneNumberRequest phoneNumberRequest,
  ) = _UpdatePhoneNumber;

  const factory AccountSettingEvent.updateEmail(
    ChangeEmailRequest changeEmailRequest,
  ) = _UpdateEmail;

  const factory AccountSettingEvent.updatePersonalInformation(
    PersonalInformation personalInformation,
  ) = _UpdatePersonalInformation;

  const factory AccountSettingEvent.addSocialAccount(
    SignInSocialAccount signInSocialAccount,
  ) = _AddSocialAccount;

  const factory AccountSettingEvent.deleteSocialAccount(
    int id,
  ) = _DeleteSocialAccount;

  const factory AccountSettingEvent.updateProfile(
    UpdateProfile updateProfile,
  ) = _UpdateProfile;

  const factory AccountSettingEvent.updateProfilePhoto(
    String imagePath,
  ) = _UpdateProfilePhoto;
}
