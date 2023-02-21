// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_setting_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountSettingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ChangePassword changePassword) changePassword,
    required TResult Function(PhoneNumberRequest phoneNumberRequest)
        updatePhoneNumber,
    required TResult Function(ChangeEmailRequest changeEmailRequest)
        updateEmail,
    required TResult Function(PersonalInformation personalInformation)
        updatePersonalInformation,
    required TResult Function(SignInSocialAccount signInSocialAccount)
        addSocialAccount,
    required TResult Function(int id) deleteSocialAccount,
    required TResult Function(UpdateProfile updateProfile) updateProfile,
    required TResult Function(String imagePath) updateProfilePhoto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ChangePassword changePassword)? changePassword,
    TResult? Function(PhoneNumberRequest phoneNumberRequest)? updatePhoneNumber,
    TResult? Function(ChangeEmailRequest changeEmailRequest)? updateEmail,
    TResult? Function(PersonalInformation personalInformation)?
        updatePersonalInformation,
    TResult? Function(SignInSocialAccount signInSocialAccount)?
        addSocialAccount,
    TResult? Function(int id)? deleteSocialAccount,
    TResult? Function(UpdateProfile updateProfile)? updateProfile,
    TResult? Function(String imagePath)? updateProfilePhoto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ChangePassword changePassword)? changePassword,
    TResult Function(PhoneNumberRequest phoneNumberRequest)? updatePhoneNumber,
    TResult Function(ChangeEmailRequest changeEmailRequest)? updateEmail,
    TResult Function(PersonalInformation personalInformation)?
        updatePersonalInformation,
    TResult Function(SignInSocialAccount signInSocialAccount)? addSocialAccount,
    TResult Function(int id)? deleteSocialAccount,
    TResult Function(UpdateProfile updateProfile)? updateProfile,
    TResult Function(String imagePath)? updateProfilePhoto,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'AccountSettingEvent.started()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ChangePassword changePassword) changePassword,
    required TResult Function(PhoneNumberRequest phoneNumberRequest)
        updatePhoneNumber,
    required TResult Function(ChangeEmailRequest changeEmailRequest)
        updateEmail,
    required TResult Function(PersonalInformation personalInformation)
        updatePersonalInformation,
    required TResult Function(SignInSocialAccount signInSocialAccount)
        addSocialAccount,
    required TResult Function(int id) deleteSocialAccount,
    required TResult Function(UpdateProfile updateProfile) updateProfile,
    required TResult Function(String imagePath) updateProfilePhoto,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ChangePassword changePassword)? changePassword,
    TResult? Function(PhoneNumberRequest phoneNumberRequest)? updatePhoneNumber,
    TResult? Function(ChangeEmailRequest changeEmailRequest)? updateEmail,
    TResult? Function(PersonalInformation personalInformation)?
        updatePersonalInformation,
    TResult? Function(SignInSocialAccount signInSocialAccount)?
        addSocialAccount,
    TResult? Function(int id)? deleteSocialAccount,
    TResult? Function(UpdateProfile updateProfile)? updateProfile,
    TResult? Function(String imagePath)? updateProfilePhoto,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ChangePassword changePassword)? changePassword,
    TResult Function(PhoneNumberRequest phoneNumberRequest)? updatePhoneNumber,
    TResult Function(ChangeEmailRequest changeEmailRequest)? updateEmail,
    TResult Function(PersonalInformation personalInformation)?
        updatePersonalInformation,
    TResult Function(SignInSocialAccount signInSocialAccount)? addSocialAccount,
    TResult Function(int id)? deleteSocialAccount,
    TResult Function(UpdateProfile updateProfile)? updateProfile,
    TResult Function(String imagePath)? updateProfilePhoto,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }
}

abstract class _Started implements AccountSettingEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc

class _$_ChangePassword implements _ChangePassword {
  const _$_ChangePassword(this.changePassword);

  @override
  final ChangePassword changePassword;

  @override
  String toString() {
    return 'AccountSettingEvent.changePassword(changePassword: $changePassword)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ChangePassword changePassword) changePassword,
    required TResult Function(PhoneNumberRequest phoneNumberRequest)
        updatePhoneNumber,
    required TResult Function(ChangeEmailRequest changeEmailRequest)
        updateEmail,
    required TResult Function(PersonalInformation personalInformation)
        updatePersonalInformation,
    required TResult Function(SignInSocialAccount signInSocialAccount)
        addSocialAccount,
    required TResult Function(int id) deleteSocialAccount,
    required TResult Function(UpdateProfile updateProfile) updateProfile,
    required TResult Function(String imagePath) updateProfilePhoto,
  }) {
    return changePassword(this.changePassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ChangePassword changePassword)? changePassword,
    TResult? Function(PhoneNumberRequest phoneNumberRequest)? updatePhoneNumber,
    TResult? Function(ChangeEmailRequest changeEmailRequest)? updateEmail,
    TResult? Function(PersonalInformation personalInformation)?
        updatePersonalInformation,
    TResult? Function(SignInSocialAccount signInSocialAccount)?
        addSocialAccount,
    TResult? Function(int id)? deleteSocialAccount,
    TResult? Function(UpdateProfile updateProfile)? updateProfile,
    TResult? Function(String imagePath)? updateProfilePhoto,
  }) {
    return changePassword?.call(this.changePassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ChangePassword changePassword)? changePassword,
    TResult Function(PhoneNumberRequest phoneNumberRequest)? updatePhoneNumber,
    TResult Function(ChangeEmailRequest changeEmailRequest)? updateEmail,
    TResult Function(PersonalInformation personalInformation)?
        updatePersonalInformation,
    TResult Function(SignInSocialAccount signInSocialAccount)? addSocialAccount,
    TResult Function(int id)? deleteSocialAccount,
    TResult Function(UpdateProfile updateProfile)? updateProfile,
    TResult Function(String imagePath)? updateProfilePhoto,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword(this.changePassword);
    }
    return orElse();
  }
}

abstract class _ChangePassword implements AccountSettingEvent {
  const factory _ChangePassword(final ChangePassword changePassword) =
      _$_ChangePassword;

  ChangePassword get changePassword;
}

/// @nodoc

class _$_UpdatePhoneNumber implements _UpdatePhoneNumber {
  const _$_UpdatePhoneNumber(this.phoneNumberRequest);

  @override
  final PhoneNumberRequest phoneNumberRequest;

  @override
  String toString() {
    return 'AccountSettingEvent.updatePhoneNumber(phoneNumberRequest: $phoneNumberRequest)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ChangePassword changePassword) changePassword,
    required TResult Function(PhoneNumberRequest phoneNumberRequest)
        updatePhoneNumber,
    required TResult Function(ChangeEmailRequest changeEmailRequest)
        updateEmail,
    required TResult Function(PersonalInformation personalInformation)
        updatePersonalInformation,
    required TResult Function(SignInSocialAccount signInSocialAccount)
        addSocialAccount,
    required TResult Function(int id) deleteSocialAccount,
    required TResult Function(UpdateProfile updateProfile) updateProfile,
    required TResult Function(String imagePath) updateProfilePhoto,
  }) {
    return updatePhoneNumber(phoneNumberRequest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ChangePassword changePassword)? changePassword,
    TResult? Function(PhoneNumberRequest phoneNumberRequest)? updatePhoneNumber,
    TResult? Function(ChangeEmailRequest changeEmailRequest)? updateEmail,
    TResult? Function(PersonalInformation personalInformation)?
        updatePersonalInformation,
    TResult? Function(SignInSocialAccount signInSocialAccount)?
        addSocialAccount,
    TResult? Function(int id)? deleteSocialAccount,
    TResult? Function(UpdateProfile updateProfile)? updateProfile,
    TResult? Function(String imagePath)? updateProfilePhoto,
  }) {
    return updatePhoneNumber?.call(phoneNumberRequest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ChangePassword changePassword)? changePassword,
    TResult Function(PhoneNumberRequest phoneNumberRequest)? updatePhoneNumber,
    TResult Function(ChangeEmailRequest changeEmailRequest)? updateEmail,
    TResult Function(PersonalInformation personalInformation)?
        updatePersonalInformation,
    TResult Function(SignInSocialAccount signInSocialAccount)? addSocialAccount,
    TResult Function(int id)? deleteSocialAccount,
    TResult Function(UpdateProfile updateProfile)? updateProfile,
    TResult Function(String imagePath)? updateProfilePhoto,
    required TResult orElse(),
  }) {
    if (updatePhoneNumber != null) {
      return updatePhoneNumber(phoneNumberRequest);
    }
    return orElse();
  }
}

abstract class _UpdatePhoneNumber implements AccountSettingEvent {
  const factory _UpdatePhoneNumber(
      final PhoneNumberRequest phoneNumberRequest) = _$_UpdatePhoneNumber;

  PhoneNumberRequest get phoneNumberRequest;
}

/// @nodoc

class _$_UpdateEmail implements _UpdateEmail {
  const _$_UpdateEmail(this.changeEmailRequest);

  @override
  final ChangeEmailRequest changeEmailRequest;

  @override
  String toString() {
    return 'AccountSettingEvent.updateEmail(changeEmailRequest: $changeEmailRequest)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ChangePassword changePassword) changePassword,
    required TResult Function(PhoneNumberRequest phoneNumberRequest)
        updatePhoneNumber,
    required TResult Function(ChangeEmailRequest changeEmailRequest)
        updateEmail,
    required TResult Function(PersonalInformation personalInformation)
        updatePersonalInformation,
    required TResult Function(SignInSocialAccount signInSocialAccount)
        addSocialAccount,
    required TResult Function(int id) deleteSocialAccount,
    required TResult Function(UpdateProfile updateProfile) updateProfile,
    required TResult Function(String imagePath) updateProfilePhoto,
  }) {
    return updateEmail(changeEmailRequest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ChangePassword changePassword)? changePassword,
    TResult? Function(PhoneNumberRequest phoneNumberRequest)? updatePhoneNumber,
    TResult? Function(ChangeEmailRequest changeEmailRequest)? updateEmail,
    TResult? Function(PersonalInformation personalInformation)?
        updatePersonalInformation,
    TResult? Function(SignInSocialAccount signInSocialAccount)?
        addSocialAccount,
    TResult? Function(int id)? deleteSocialAccount,
    TResult? Function(UpdateProfile updateProfile)? updateProfile,
    TResult? Function(String imagePath)? updateProfilePhoto,
  }) {
    return updateEmail?.call(changeEmailRequest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ChangePassword changePassword)? changePassword,
    TResult Function(PhoneNumberRequest phoneNumberRequest)? updatePhoneNumber,
    TResult Function(ChangeEmailRequest changeEmailRequest)? updateEmail,
    TResult Function(PersonalInformation personalInformation)?
        updatePersonalInformation,
    TResult Function(SignInSocialAccount signInSocialAccount)? addSocialAccount,
    TResult Function(int id)? deleteSocialAccount,
    TResult Function(UpdateProfile updateProfile)? updateProfile,
    TResult Function(String imagePath)? updateProfilePhoto,
    required TResult orElse(),
  }) {
    if (updateEmail != null) {
      return updateEmail(changeEmailRequest);
    }
    return orElse();
  }
}

abstract class _UpdateEmail implements AccountSettingEvent {
  const factory _UpdateEmail(final ChangeEmailRequest changeEmailRequest) =
      _$_UpdateEmail;

  ChangeEmailRequest get changeEmailRequest;
}

/// @nodoc

class _$_UpdatePersonalInformation implements _UpdatePersonalInformation {
  const _$_UpdatePersonalInformation(this.personalInformation);

  @override
  final PersonalInformation personalInformation;

  @override
  String toString() {
    return 'AccountSettingEvent.updatePersonalInformation(personalInformation: $personalInformation)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ChangePassword changePassword) changePassword,
    required TResult Function(PhoneNumberRequest phoneNumberRequest)
        updatePhoneNumber,
    required TResult Function(ChangeEmailRequest changeEmailRequest)
        updateEmail,
    required TResult Function(PersonalInformation personalInformation)
        updatePersonalInformation,
    required TResult Function(SignInSocialAccount signInSocialAccount)
        addSocialAccount,
    required TResult Function(int id) deleteSocialAccount,
    required TResult Function(UpdateProfile updateProfile) updateProfile,
    required TResult Function(String imagePath) updateProfilePhoto,
  }) {
    return updatePersonalInformation(personalInformation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ChangePassword changePassword)? changePassword,
    TResult? Function(PhoneNumberRequest phoneNumberRequest)? updatePhoneNumber,
    TResult? Function(ChangeEmailRequest changeEmailRequest)? updateEmail,
    TResult? Function(PersonalInformation personalInformation)?
        updatePersonalInformation,
    TResult? Function(SignInSocialAccount signInSocialAccount)?
        addSocialAccount,
    TResult? Function(int id)? deleteSocialAccount,
    TResult? Function(UpdateProfile updateProfile)? updateProfile,
    TResult? Function(String imagePath)? updateProfilePhoto,
  }) {
    return updatePersonalInformation?.call(personalInformation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ChangePassword changePassword)? changePassword,
    TResult Function(PhoneNumberRequest phoneNumberRequest)? updatePhoneNumber,
    TResult Function(ChangeEmailRequest changeEmailRequest)? updateEmail,
    TResult Function(PersonalInformation personalInformation)?
        updatePersonalInformation,
    TResult Function(SignInSocialAccount signInSocialAccount)? addSocialAccount,
    TResult Function(int id)? deleteSocialAccount,
    TResult Function(UpdateProfile updateProfile)? updateProfile,
    TResult Function(String imagePath)? updateProfilePhoto,
    required TResult orElse(),
  }) {
    if (updatePersonalInformation != null) {
      return updatePersonalInformation(personalInformation);
    }
    return orElse();
  }
}

abstract class _UpdatePersonalInformation implements AccountSettingEvent {
  const factory _UpdatePersonalInformation(
          final PersonalInformation personalInformation) =
      _$_UpdatePersonalInformation;

  PersonalInformation get personalInformation;
}

/// @nodoc

class _$_AddSocialAccount implements _AddSocialAccount {
  const _$_AddSocialAccount(this.signInSocialAccount);

  @override
  final SignInSocialAccount signInSocialAccount;

  @override
  String toString() {
    return 'AccountSettingEvent.addSocialAccount(signInSocialAccount: $signInSocialAccount)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ChangePassword changePassword) changePassword,
    required TResult Function(PhoneNumberRequest phoneNumberRequest)
        updatePhoneNumber,
    required TResult Function(ChangeEmailRequest changeEmailRequest)
        updateEmail,
    required TResult Function(PersonalInformation personalInformation)
        updatePersonalInformation,
    required TResult Function(SignInSocialAccount signInSocialAccount)
        addSocialAccount,
    required TResult Function(int id) deleteSocialAccount,
    required TResult Function(UpdateProfile updateProfile) updateProfile,
    required TResult Function(String imagePath) updateProfilePhoto,
  }) {
    return addSocialAccount(signInSocialAccount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ChangePassword changePassword)? changePassword,
    TResult? Function(PhoneNumberRequest phoneNumberRequest)? updatePhoneNumber,
    TResult? Function(ChangeEmailRequest changeEmailRequest)? updateEmail,
    TResult? Function(PersonalInformation personalInformation)?
        updatePersonalInformation,
    TResult? Function(SignInSocialAccount signInSocialAccount)?
        addSocialAccount,
    TResult? Function(int id)? deleteSocialAccount,
    TResult? Function(UpdateProfile updateProfile)? updateProfile,
    TResult? Function(String imagePath)? updateProfilePhoto,
  }) {
    return addSocialAccount?.call(signInSocialAccount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ChangePassword changePassword)? changePassword,
    TResult Function(PhoneNumberRequest phoneNumberRequest)? updatePhoneNumber,
    TResult Function(ChangeEmailRequest changeEmailRequest)? updateEmail,
    TResult Function(PersonalInformation personalInformation)?
        updatePersonalInformation,
    TResult Function(SignInSocialAccount signInSocialAccount)? addSocialAccount,
    TResult Function(int id)? deleteSocialAccount,
    TResult Function(UpdateProfile updateProfile)? updateProfile,
    TResult Function(String imagePath)? updateProfilePhoto,
    required TResult orElse(),
  }) {
    if (addSocialAccount != null) {
      return addSocialAccount(signInSocialAccount);
    }
    return orElse();
  }
}

abstract class _AddSocialAccount implements AccountSettingEvent {
  const factory _AddSocialAccount(
      final SignInSocialAccount signInSocialAccount) = _$_AddSocialAccount;

  SignInSocialAccount get signInSocialAccount;
}

/// @nodoc

class _$_DeleteSocialAccount implements _DeleteSocialAccount {
  const _$_DeleteSocialAccount(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'AccountSettingEvent.deleteSocialAccount(id: $id)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ChangePassword changePassword) changePassword,
    required TResult Function(PhoneNumberRequest phoneNumberRequest)
        updatePhoneNumber,
    required TResult Function(ChangeEmailRequest changeEmailRequest)
        updateEmail,
    required TResult Function(PersonalInformation personalInformation)
        updatePersonalInformation,
    required TResult Function(SignInSocialAccount signInSocialAccount)
        addSocialAccount,
    required TResult Function(int id) deleteSocialAccount,
    required TResult Function(UpdateProfile updateProfile) updateProfile,
    required TResult Function(String imagePath) updateProfilePhoto,
  }) {
    return deleteSocialAccount(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ChangePassword changePassword)? changePassword,
    TResult? Function(PhoneNumberRequest phoneNumberRequest)? updatePhoneNumber,
    TResult? Function(ChangeEmailRequest changeEmailRequest)? updateEmail,
    TResult? Function(PersonalInformation personalInformation)?
        updatePersonalInformation,
    TResult? Function(SignInSocialAccount signInSocialAccount)?
        addSocialAccount,
    TResult? Function(int id)? deleteSocialAccount,
    TResult? Function(UpdateProfile updateProfile)? updateProfile,
    TResult? Function(String imagePath)? updateProfilePhoto,
  }) {
    return deleteSocialAccount?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ChangePassword changePassword)? changePassword,
    TResult Function(PhoneNumberRequest phoneNumberRequest)? updatePhoneNumber,
    TResult Function(ChangeEmailRequest changeEmailRequest)? updateEmail,
    TResult Function(PersonalInformation personalInformation)?
        updatePersonalInformation,
    TResult Function(SignInSocialAccount signInSocialAccount)? addSocialAccount,
    TResult Function(int id)? deleteSocialAccount,
    TResult Function(UpdateProfile updateProfile)? updateProfile,
    TResult Function(String imagePath)? updateProfilePhoto,
    required TResult orElse(),
  }) {
    if (deleteSocialAccount != null) {
      return deleteSocialAccount(id);
    }
    return orElse();
  }
}

abstract class _DeleteSocialAccount implements AccountSettingEvent {
  const factory _DeleteSocialAccount(final int id) = _$_DeleteSocialAccount;

  int get id;
}

/// @nodoc

class _$_UpdateProfile implements _UpdateProfile {
  const _$_UpdateProfile(this.updateProfile);

  @override
  final UpdateProfile updateProfile;

  @override
  String toString() {
    return 'AccountSettingEvent.updateProfile(updateProfile: $updateProfile)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ChangePassword changePassword) changePassword,
    required TResult Function(PhoneNumberRequest phoneNumberRequest)
        updatePhoneNumber,
    required TResult Function(ChangeEmailRequest changeEmailRequest)
        updateEmail,
    required TResult Function(PersonalInformation personalInformation)
        updatePersonalInformation,
    required TResult Function(SignInSocialAccount signInSocialAccount)
        addSocialAccount,
    required TResult Function(int id) deleteSocialAccount,
    required TResult Function(UpdateProfile updateProfile) updateProfile,
    required TResult Function(String imagePath) updateProfilePhoto,
  }) {
    return updateProfile(this.updateProfile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ChangePassword changePassword)? changePassword,
    TResult? Function(PhoneNumberRequest phoneNumberRequest)? updatePhoneNumber,
    TResult? Function(ChangeEmailRequest changeEmailRequest)? updateEmail,
    TResult? Function(PersonalInformation personalInformation)?
        updatePersonalInformation,
    TResult? Function(SignInSocialAccount signInSocialAccount)?
        addSocialAccount,
    TResult? Function(int id)? deleteSocialAccount,
    TResult? Function(UpdateProfile updateProfile)? updateProfile,
    TResult? Function(String imagePath)? updateProfilePhoto,
  }) {
    return updateProfile?.call(this.updateProfile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ChangePassword changePassword)? changePassword,
    TResult Function(PhoneNumberRequest phoneNumberRequest)? updatePhoneNumber,
    TResult Function(ChangeEmailRequest changeEmailRequest)? updateEmail,
    TResult Function(PersonalInformation personalInformation)?
        updatePersonalInformation,
    TResult Function(SignInSocialAccount signInSocialAccount)? addSocialAccount,
    TResult Function(int id)? deleteSocialAccount,
    TResult Function(UpdateProfile updateProfile)? updateProfile,
    TResult Function(String imagePath)? updateProfilePhoto,
    required TResult orElse(),
  }) {
    if (updateProfile != null) {
      return updateProfile(this.updateProfile);
    }
    return orElse();
  }
}

abstract class _UpdateProfile implements AccountSettingEvent {
  const factory _UpdateProfile(final UpdateProfile updateProfile) =
      _$_UpdateProfile;

  UpdateProfile get updateProfile;
}

/// @nodoc

class _$_UpdateProfilePhoto implements _UpdateProfilePhoto {
  const _$_UpdateProfilePhoto(this.imagePath);

  @override
  final String imagePath;

  @override
  String toString() {
    return 'AccountSettingEvent.updateProfilePhoto(imagePath: $imagePath)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ChangePassword changePassword) changePassword,
    required TResult Function(PhoneNumberRequest phoneNumberRequest)
        updatePhoneNumber,
    required TResult Function(ChangeEmailRequest changeEmailRequest)
        updateEmail,
    required TResult Function(PersonalInformation personalInformation)
        updatePersonalInformation,
    required TResult Function(SignInSocialAccount signInSocialAccount)
        addSocialAccount,
    required TResult Function(int id) deleteSocialAccount,
    required TResult Function(UpdateProfile updateProfile) updateProfile,
    required TResult Function(String imagePath) updateProfilePhoto,
  }) {
    return updateProfilePhoto(imagePath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ChangePassword changePassword)? changePassword,
    TResult? Function(PhoneNumberRequest phoneNumberRequest)? updatePhoneNumber,
    TResult? Function(ChangeEmailRequest changeEmailRequest)? updateEmail,
    TResult? Function(PersonalInformation personalInformation)?
        updatePersonalInformation,
    TResult? Function(SignInSocialAccount signInSocialAccount)?
        addSocialAccount,
    TResult? Function(int id)? deleteSocialAccount,
    TResult? Function(UpdateProfile updateProfile)? updateProfile,
    TResult? Function(String imagePath)? updateProfilePhoto,
  }) {
    return updateProfilePhoto?.call(imagePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ChangePassword changePassword)? changePassword,
    TResult Function(PhoneNumberRequest phoneNumberRequest)? updatePhoneNumber,
    TResult Function(ChangeEmailRequest changeEmailRequest)? updateEmail,
    TResult Function(PersonalInformation personalInformation)?
        updatePersonalInformation,
    TResult Function(SignInSocialAccount signInSocialAccount)? addSocialAccount,
    TResult Function(int id)? deleteSocialAccount,
    TResult Function(UpdateProfile updateProfile)? updateProfile,
    TResult Function(String imagePath)? updateProfilePhoto,
    required TResult orElse(),
  }) {
    if (updateProfilePhoto != null) {
      return updateProfilePhoto(imagePath);
    }
    return orElse();
  }
}

abstract class _UpdateProfilePhoto implements AccountSettingEvent {
  const factory _UpdateProfilePhoto(final String imagePath) =
      _$_UpdateProfilePhoto;

  String get imagePath;
}

/// @nodoc
mixin _$AccountSettingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function() uploadingImage,
    required TResult Function(NetworkExceptions networkExceptions) isError,
    required TResult Function(String message) success,
    required TResult Function(String message) successUpdatePhoneNumber,
    required TResult Function(PersonalInformation personalInformation)
        successUpdatePersonalInformation,
    required TResult Function(String message) successUpdateEmail,
    required TResult Function(String imagePath) successUpdateProfilePhoto,
    required TResult Function(SocialAccount socialAccount)
        successAddSocialAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function()? uploadingImage,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
    TResult? Function(String message)? success,
    TResult? Function(String message)? successUpdatePhoneNumber,
    TResult? Function(PersonalInformation personalInformation)?
        successUpdatePersonalInformation,
    TResult? Function(String message)? successUpdateEmail,
    TResult? Function(String imagePath)? successUpdateProfilePhoto,
    TResult? Function(SocialAccount socialAccount)? successAddSocialAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function()? uploadingImage,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    TResult Function(String message)? success,
    TResult Function(String message)? successUpdatePhoneNumber,
    TResult Function(PersonalInformation personalInformation)?
        successUpdatePersonalInformation,
    TResult Function(String message)? successUpdateEmail,
    TResult Function(String imagePath)? successUpdateProfilePhoto,
    TResult Function(SocialAccount socialAccount)? successAddSocialAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'AccountSettingState.initial()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function() uploadingImage,
    required TResult Function(NetworkExceptions networkExceptions) isError,
    required TResult Function(String message) success,
    required TResult Function(String message) successUpdatePhoneNumber,
    required TResult Function(PersonalInformation personalInformation)
        successUpdatePersonalInformation,
    required TResult Function(String message) successUpdateEmail,
    required TResult Function(String imagePath) successUpdateProfilePhoto,
    required TResult Function(SocialAccount socialAccount)
        successAddSocialAccount,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function()? uploadingImage,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
    TResult? Function(String message)? success,
    TResult? Function(String message)? successUpdatePhoneNumber,
    TResult? Function(PersonalInformation personalInformation)?
        successUpdatePersonalInformation,
    TResult? Function(String message)? successUpdateEmail,
    TResult? Function(String imagePath)? successUpdateProfilePhoto,
    TResult? Function(SocialAccount socialAccount)? successAddSocialAccount,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function()? uploadingImage,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    TResult Function(String message)? success,
    TResult Function(String message)? successUpdatePhoneNumber,
    TResult Function(PersonalInformation personalInformation)?
        successUpdatePersonalInformation,
    TResult Function(String message)? successUpdateEmail,
    TResult Function(String imagePath)? successUpdateProfilePhoto,
    TResult Function(SocialAccount socialAccount)? successAddSocialAccount,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }
}

abstract class _Initial implements AccountSettingState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc

class _$_IsLoading implements _IsLoading {
  const _$_IsLoading();

  @override
  String toString() {
    return 'AccountSettingState.isLoading()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function() uploadingImage,
    required TResult Function(NetworkExceptions networkExceptions) isError,
    required TResult Function(String message) success,
    required TResult Function(String message) successUpdatePhoneNumber,
    required TResult Function(PersonalInformation personalInformation)
        successUpdatePersonalInformation,
    required TResult Function(String message) successUpdateEmail,
    required TResult Function(String imagePath) successUpdateProfilePhoto,
    required TResult Function(SocialAccount socialAccount)
        successAddSocialAccount,
  }) {
    return isLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function()? uploadingImage,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
    TResult? Function(String message)? success,
    TResult? Function(String message)? successUpdatePhoneNumber,
    TResult? Function(PersonalInformation personalInformation)?
        successUpdatePersonalInformation,
    TResult? Function(String message)? successUpdateEmail,
    TResult? Function(String imagePath)? successUpdateProfilePhoto,
    TResult? Function(SocialAccount socialAccount)? successAddSocialAccount,
  }) {
    return isLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function()? uploadingImage,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    TResult Function(String message)? success,
    TResult Function(String message)? successUpdatePhoneNumber,
    TResult Function(PersonalInformation personalInformation)?
        successUpdatePersonalInformation,
    TResult Function(String message)? successUpdateEmail,
    TResult Function(String imagePath)? successUpdateProfilePhoto,
    TResult Function(SocialAccount socialAccount)? successAddSocialAccount,
    required TResult orElse(),
  }) {
    if (isLoading != null) {
      return isLoading();
    }
    return orElse();
  }
}

abstract class _IsLoading implements AccountSettingState {
  const factory _IsLoading() = _$_IsLoading;
}

/// @nodoc

class _$_UploadingImage implements _UploadingImage {
  const _$_UploadingImage();

  @override
  String toString() {
    return 'AccountSettingState.uploadingImage()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function() uploadingImage,
    required TResult Function(NetworkExceptions networkExceptions) isError,
    required TResult Function(String message) success,
    required TResult Function(String message) successUpdatePhoneNumber,
    required TResult Function(PersonalInformation personalInformation)
        successUpdatePersonalInformation,
    required TResult Function(String message) successUpdateEmail,
    required TResult Function(String imagePath) successUpdateProfilePhoto,
    required TResult Function(SocialAccount socialAccount)
        successAddSocialAccount,
  }) {
    return uploadingImage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function()? uploadingImage,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
    TResult? Function(String message)? success,
    TResult? Function(String message)? successUpdatePhoneNumber,
    TResult? Function(PersonalInformation personalInformation)?
        successUpdatePersonalInformation,
    TResult? Function(String message)? successUpdateEmail,
    TResult? Function(String imagePath)? successUpdateProfilePhoto,
    TResult? Function(SocialAccount socialAccount)? successAddSocialAccount,
  }) {
    return uploadingImage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function()? uploadingImage,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    TResult Function(String message)? success,
    TResult Function(String message)? successUpdatePhoneNumber,
    TResult Function(PersonalInformation personalInformation)?
        successUpdatePersonalInformation,
    TResult Function(String message)? successUpdateEmail,
    TResult Function(String imagePath)? successUpdateProfilePhoto,
    TResult Function(SocialAccount socialAccount)? successAddSocialAccount,
    required TResult orElse(),
  }) {
    if (uploadingImage != null) {
      return uploadingImage();
    }
    return orElse();
  }
}

abstract class _UploadingImage implements AccountSettingState {
  const factory _UploadingImage() = _$_UploadingImage;
}

/// @nodoc

class _$_IsError implements _IsError {
  const _$_IsError(this.networkExceptions);

  @override
  final NetworkExceptions networkExceptions;

  @override
  String toString() {
    return 'AccountSettingState.isError(networkExceptions: $networkExceptions)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function() uploadingImage,
    required TResult Function(NetworkExceptions networkExceptions) isError,
    required TResult Function(String message) success,
    required TResult Function(String message) successUpdatePhoneNumber,
    required TResult Function(PersonalInformation personalInformation)
        successUpdatePersonalInformation,
    required TResult Function(String message) successUpdateEmail,
    required TResult Function(String imagePath) successUpdateProfilePhoto,
    required TResult Function(SocialAccount socialAccount)
        successAddSocialAccount,
  }) {
    return isError(networkExceptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function()? uploadingImage,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
    TResult? Function(String message)? success,
    TResult? Function(String message)? successUpdatePhoneNumber,
    TResult? Function(PersonalInformation personalInformation)?
        successUpdatePersonalInformation,
    TResult? Function(String message)? successUpdateEmail,
    TResult? Function(String imagePath)? successUpdateProfilePhoto,
    TResult? Function(SocialAccount socialAccount)? successAddSocialAccount,
  }) {
    return isError?.call(networkExceptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function()? uploadingImage,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    TResult Function(String message)? success,
    TResult Function(String message)? successUpdatePhoneNumber,
    TResult Function(PersonalInformation personalInformation)?
        successUpdatePersonalInformation,
    TResult Function(String message)? successUpdateEmail,
    TResult Function(String imagePath)? successUpdateProfilePhoto,
    TResult Function(SocialAccount socialAccount)? successAddSocialAccount,
    required TResult orElse(),
  }) {
    if (isError != null) {
      return isError(networkExceptions);
    }
    return orElse();
  }
}

abstract class _IsError implements AccountSettingState {
  const factory _IsError(final NetworkExceptions networkExceptions) =
      _$_IsError;

  NetworkExceptions get networkExceptions;
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AccountSettingState.success(message: $message)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function() uploadingImage,
    required TResult Function(NetworkExceptions networkExceptions) isError,
    required TResult Function(String message) success,
    required TResult Function(String message) successUpdatePhoneNumber,
    required TResult Function(PersonalInformation personalInformation)
        successUpdatePersonalInformation,
    required TResult Function(String message) successUpdateEmail,
    required TResult Function(String imagePath) successUpdateProfilePhoto,
    required TResult Function(SocialAccount socialAccount)
        successAddSocialAccount,
  }) {
    return success(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function()? uploadingImage,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
    TResult? Function(String message)? success,
    TResult? Function(String message)? successUpdatePhoneNumber,
    TResult? Function(PersonalInformation personalInformation)?
        successUpdatePersonalInformation,
    TResult? Function(String message)? successUpdateEmail,
    TResult? Function(String imagePath)? successUpdateProfilePhoto,
    TResult? Function(SocialAccount socialAccount)? successAddSocialAccount,
  }) {
    return success?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function()? uploadingImage,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    TResult Function(String message)? success,
    TResult Function(String message)? successUpdatePhoneNumber,
    TResult Function(PersonalInformation personalInformation)?
        successUpdatePersonalInformation,
    TResult Function(String message)? successUpdateEmail,
    TResult Function(String imagePath)? successUpdateProfilePhoto,
    TResult Function(SocialAccount socialAccount)? successAddSocialAccount,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(message);
    }
    return orElse();
  }
}

abstract class _Success implements AccountSettingState {
  const factory _Success(final String message) = _$_Success;

  String get message;
}

/// @nodoc

class _$_SuccessUpdatePhoneNumber implements _SuccessUpdatePhoneNumber {
  const _$_SuccessUpdatePhoneNumber(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AccountSettingState.successUpdatePhoneNumber(message: $message)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function() uploadingImage,
    required TResult Function(NetworkExceptions networkExceptions) isError,
    required TResult Function(String message) success,
    required TResult Function(String message) successUpdatePhoneNumber,
    required TResult Function(PersonalInformation personalInformation)
        successUpdatePersonalInformation,
    required TResult Function(String message) successUpdateEmail,
    required TResult Function(String imagePath) successUpdateProfilePhoto,
    required TResult Function(SocialAccount socialAccount)
        successAddSocialAccount,
  }) {
    return successUpdatePhoneNumber(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function()? uploadingImage,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
    TResult? Function(String message)? success,
    TResult? Function(String message)? successUpdatePhoneNumber,
    TResult? Function(PersonalInformation personalInformation)?
        successUpdatePersonalInformation,
    TResult? Function(String message)? successUpdateEmail,
    TResult? Function(String imagePath)? successUpdateProfilePhoto,
    TResult? Function(SocialAccount socialAccount)? successAddSocialAccount,
  }) {
    return successUpdatePhoneNumber?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function()? uploadingImage,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    TResult Function(String message)? success,
    TResult Function(String message)? successUpdatePhoneNumber,
    TResult Function(PersonalInformation personalInformation)?
        successUpdatePersonalInformation,
    TResult Function(String message)? successUpdateEmail,
    TResult Function(String imagePath)? successUpdateProfilePhoto,
    TResult Function(SocialAccount socialAccount)? successAddSocialAccount,
    required TResult orElse(),
  }) {
    if (successUpdatePhoneNumber != null) {
      return successUpdatePhoneNumber(message);
    }
    return orElse();
  }
}

abstract class _SuccessUpdatePhoneNumber implements AccountSettingState {
  const factory _SuccessUpdatePhoneNumber(final String message) =
      _$_SuccessUpdatePhoneNumber;

  String get message;
}

/// @nodoc

class _$_SuccessUpdatePersonalInformation
    implements _SuccessUpdatePersonalInformation {
  const _$_SuccessUpdatePersonalInformation(this.personalInformation);

  @override
  final PersonalInformation personalInformation;

  @override
  String toString() {
    return 'AccountSettingState.successUpdatePersonalInformation(personalInformation: $personalInformation)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function() uploadingImage,
    required TResult Function(NetworkExceptions networkExceptions) isError,
    required TResult Function(String message) success,
    required TResult Function(String message) successUpdatePhoneNumber,
    required TResult Function(PersonalInformation personalInformation)
        successUpdatePersonalInformation,
    required TResult Function(String message) successUpdateEmail,
    required TResult Function(String imagePath) successUpdateProfilePhoto,
    required TResult Function(SocialAccount socialAccount)
        successAddSocialAccount,
  }) {
    return successUpdatePersonalInformation(personalInformation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function()? uploadingImage,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
    TResult? Function(String message)? success,
    TResult? Function(String message)? successUpdatePhoneNumber,
    TResult? Function(PersonalInformation personalInformation)?
        successUpdatePersonalInformation,
    TResult? Function(String message)? successUpdateEmail,
    TResult? Function(String imagePath)? successUpdateProfilePhoto,
    TResult? Function(SocialAccount socialAccount)? successAddSocialAccount,
  }) {
    return successUpdatePersonalInformation?.call(personalInformation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function()? uploadingImage,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    TResult Function(String message)? success,
    TResult Function(String message)? successUpdatePhoneNumber,
    TResult Function(PersonalInformation personalInformation)?
        successUpdatePersonalInformation,
    TResult Function(String message)? successUpdateEmail,
    TResult Function(String imagePath)? successUpdateProfilePhoto,
    TResult Function(SocialAccount socialAccount)? successAddSocialAccount,
    required TResult orElse(),
  }) {
    if (successUpdatePersonalInformation != null) {
      return successUpdatePersonalInformation(personalInformation);
    }
    return orElse();
  }
}

abstract class _SuccessUpdatePersonalInformation
    implements AccountSettingState {
  const factory _SuccessUpdatePersonalInformation(
          final PersonalInformation personalInformation) =
      _$_SuccessUpdatePersonalInformation;

  PersonalInformation get personalInformation;
}

/// @nodoc

class _$_SuccessUpdateEmail implements _SuccessUpdateEmail {
  const _$_SuccessUpdateEmail(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AccountSettingState.successUpdateEmail(message: $message)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function() uploadingImage,
    required TResult Function(NetworkExceptions networkExceptions) isError,
    required TResult Function(String message) success,
    required TResult Function(String message) successUpdatePhoneNumber,
    required TResult Function(PersonalInformation personalInformation)
        successUpdatePersonalInformation,
    required TResult Function(String message) successUpdateEmail,
    required TResult Function(String imagePath) successUpdateProfilePhoto,
    required TResult Function(SocialAccount socialAccount)
        successAddSocialAccount,
  }) {
    return successUpdateEmail(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function()? uploadingImage,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
    TResult? Function(String message)? success,
    TResult? Function(String message)? successUpdatePhoneNumber,
    TResult? Function(PersonalInformation personalInformation)?
        successUpdatePersonalInformation,
    TResult? Function(String message)? successUpdateEmail,
    TResult? Function(String imagePath)? successUpdateProfilePhoto,
    TResult? Function(SocialAccount socialAccount)? successAddSocialAccount,
  }) {
    return successUpdateEmail?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function()? uploadingImage,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    TResult Function(String message)? success,
    TResult Function(String message)? successUpdatePhoneNumber,
    TResult Function(PersonalInformation personalInformation)?
        successUpdatePersonalInformation,
    TResult Function(String message)? successUpdateEmail,
    TResult Function(String imagePath)? successUpdateProfilePhoto,
    TResult Function(SocialAccount socialAccount)? successAddSocialAccount,
    required TResult orElse(),
  }) {
    if (successUpdateEmail != null) {
      return successUpdateEmail(message);
    }
    return orElse();
  }
}

abstract class _SuccessUpdateEmail implements AccountSettingState {
  const factory _SuccessUpdateEmail(final String message) =
      _$_SuccessUpdateEmail;

  String get message;
}

/// @nodoc

class _$_SuccessUpdateProfilePhoto implements _SuccessUpdateProfilePhoto {
  const _$_SuccessUpdateProfilePhoto(this.imagePath);

  @override
  final String imagePath;

  @override
  String toString() {
    return 'AccountSettingState.successUpdateProfilePhoto(imagePath: $imagePath)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function() uploadingImage,
    required TResult Function(NetworkExceptions networkExceptions) isError,
    required TResult Function(String message) success,
    required TResult Function(String message) successUpdatePhoneNumber,
    required TResult Function(PersonalInformation personalInformation)
        successUpdatePersonalInformation,
    required TResult Function(String message) successUpdateEmail,
    required TResult Function(String imagePath) successUpdateProfilePhoto,
    required TResult Function(SocialAccount socialAccount)
        successAddSocialAccount,
  }) {
    return successUpdateProfilePhoto(imagePath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function()? uploadingImage,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
    TResult? Function(String message)? success,
    TResult? Function(String message)? successUpdatePhoneNumber,
    TResult? Function(PersonalInformation personalInformation)?
        successUpdatePersonalInformation,
    TResult? Function(String message)? successUpdateEmail,
    TResult? Function(String imagePath)? successUpdateProfilePhoto,
    TResult? Function(SocialAccount socialAccount)? successAddSocialAccount,
  }) {
    return successUpdateProfilePhoto?.call(imagePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function()? uploadingImage,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    TResult Function(String message)? success,
    TResult Function(String message)? successUpdatePhoneNumber,
    TResult Function(PersonalInformation personalInformation)?
        successUpdatePersonalInformation,
    TResult Function(String message)? successUpdateEmail,
    TResult Function(String imagePath)? successUpdateProfilePhoto,
    TResult Function(SocialAccount socialAccount)? successAddSocialAccount,
    required TResult orElse(),
  }) {
    if (successUpdateProfilePhoto != null) {
      return successUpdateProfilePhoto(imagePath);
    }
    return orElse();
  }
}

abstract class _SuccessUpdateProfilePhoto implements AccountSettingState {
  const factory _SuccessUpdateProfilePhoto(final String imagePath) =
      _$_SuccessUpdateProfilePhoto;

  String get imagePath;
}

/// @nodoc

class _$_SuccessAddSocialAccount implements _SuccessAddSocialAccount {
  const _$_SuccessAddSocialAccount(this.socialAccount);

  @override
  final SocialAccount socialAccount;

  @override
  String toString() {
    return 'AccountSettingState.successAddSocialAccount(socialAccount: $socialAccount)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function() uploadingImage,
    required TResult Function(NetworkExceptions networkExceptions) isError,
    required TResult Function(String message) success,
    required TResult Function(String message) successUpdatePhoneNumber,
    required TResult Function(PersonalInformation personalInformation)
        successUpdatePersonalInformation,
    required TResult Function(String message) successUpdateEmail,
    required TResult Function(String imagePath) successUpdateProfilePhoto,
    required TResult Function(SocialAccount socialAccount)
        successAddSocialAccount,
  }) {
    return successAddSocialAccount(socialAccount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function()? uploadingImage,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
    TResult? Function(String message)? success,
    TResult? Function(String message)? successUpdatePhoneNumber,
    TResult? Function(PersonalInformation personalInformation)?
        successUpdatePersonalInformation,
    TResult? Function(String message)? successUpdateEmail,
    TResult? Function(String imagePath)? successUpdateProfilePhoto,
    TResult? Function(SocialAccount socialAccount)? successAddSocialAccount,
  }) {
    return successAddSocialAccount?.call(socialAccount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function()? uploadingImage,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    TResult Function(String message)? success,
    TResult Function(String message)? successUpdatePhoneNumber,
    TResult Function(PersonalInformation personalInformation)?
        successUpdatePersonalInformation,
    TResult Function(String message)? successUpdateEmail,
    TResult Function(String imagePath)? successUpdateProfilePhoto,
    TResult Function(SocialAccount socialAccount)? successAddSocialAccount,
    required TResult orElse(),
  }) {
    if (successAddSocialAccount != null) {
      return successAddSocialAccount(socialAccount);
    }
    return orElse();
  }
}

abstract class _SuccessAddSocialAccount implements AccountSettingState {
  const factory _SuccessAddSocialAccount(final SocialAccount socialAccount) =
      _$_SuccessAddSocialAccount;

  SocialAccount get socialAccount;
}
