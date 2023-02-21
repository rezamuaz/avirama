import 'dart:async';
import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:absensi_app/src/core/api/network_exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import '../../../../network/data/account_setting/account_setting_repository.dart';
import '../../../../network/domain_manager.dart';
import '../../../../network/model/account_setting/change_email/change_email_request.dart';
import '../../../../network/model/account_setting/change_password/change_password.dart';
import '../../../../network/model/account_setting/social_account/social_account.dart';
import '../../../../network/model/account_setting/update_profile/update_profile.dart';
import '../../../../network/model/auth/sign_in/phone_number_request.dart';
import '../../../../network/model/auth/sign_in/sign_in_social_account.dart';
import '../../../../network/model/user/personal_information.dart';

part 'account_setting_bloc.freezed.dart';
part 'account_setting_event.dart';
part 'account_setting_state.dart';

class AccountSettingBloc
    extends Bloc<AccountSettingEvent, AccountSettingState> {
  AccountSettingBloc() : super(const _Initial()) {
    on<AccountSettingEvent>(_onAccountSettingEvent);
  }

  final AccountSettingRepository _repository =
      GetIt.I<DomainManager>().accountSettingRepository;

  Future<void> _onAccountSettingEvent(
    AccountSettingEvent event,
    Emitter<AccountSettingState> emit,
  ) async {
    await event.when(
      started: () async {},
      changePassword: (ChangePassword changePassword) async {
        emit(_getLoadingState());

        final ApiResult<String> apiResult =
            await _repository.changePassword(changePassword: changePassword);

        apiResult.when(success: (String data) async {
          emit(AccountSettingState.success(data));
        }, failure: (NetworkExceptions error) async {
          emit(_getErrorState(error));
        });
      },
      updatePhoneNumber: (PhoneNumberRequest phoneNumberRequest) async {
        emit(_getLoadingState());

        final ApiResult<String> apiResult = await _repository.updatePhoneNumber(
          phoneNumberRequest: phoneNumberRequest,
        );

        apiResult.when(success: (String data) async {
          emit(AccountSettingState.successUpdatePhoneNumber(data));
        }, failure: (NetworkExceptions error) async {
          emit(_getErrorState(error));
        });
      },
      updatePersonalInformation:
          (PersonalInformation personalInformation) async {
        emit(_getLoadingState());

        final ApiResult<PersonalInformation> apiResult =
            await _repository.updatePersonalInformation(
          request: personalInformation,
        );

        apiResult.when(success: (PersonalInformation data) async {
          emit(AccountSettingState.successUpdatePersonalInformation(data));
        }, failure: (NetworkExceptions error) async {
          emit(_getErrorState(error));
        });
      },
      updateEmail: (ChangeEmailRequest changeEmailRequest) async {
        emit(_getLoadingState());

        final ApiResult<String> apiResult = await _repository.changeEmail(
          request: changeEmailRequest,
        );

        apiResult.when(success: (String data) async {
          emit(AccountSettingState.successUpdateEmail(data));
        }, failure: (NetworkExceptions error) async {
          emit(_getErrorState(error));
        });
      },
      updateProfile: (UpdateProfile updateProfile) async {
        emit(_getLoadingState());

        final ApiResult<String> apiResult =
            await _repository.updateProfile(updateProfile: updateProfile);

        apiResult.when(success: (String data) async {
          emit(AccountSettingState.success(data));
        }, failure: (NetworkExceptions error) async {
          emit(_getErrorState(error));
        });
      },
      updateProfilePhoto: (String imagePath) async {
        emit(const AccountSettingState.uploadingImage());

        final ApiResult<String> apiResult =
            await _repository.updateProfilePhoto(imagePath: imagePath);

        apiResult.when(success: (String data) async {
          emit(AccountSettingState.successUpdateProfilePhoto(data));
        }, failure: (NetworkExceptions error) async {
          emit(_getErrorState(error));
        });
      },
      addSocialAccount: (SignInSocialAccount signInSocialAccount) async {
        emit(_getLoadingState());

        final ApiResult<SocialAccount> apiResult = await _repository
            .addSocialAccount(signInSocialAccount: signInSocialAccount);

        apiResult.when(success: (SocialAccount data) async {
          emit(AccountSettingState.successAddSocialAccount(data));
        }, failure: (NetworkExceptions error) async {
          emit(_getErrorState(error));
        });
      },
      deleteSocialAccount: (int id) async {
        emit(_getLoadingState());

        final ApiResult<String> apiResult =
            await _repository.deleteSocialAccount(id: id);

        apiResult.when(success: (String data) async {
          emit(AccountSettingState.success(data));
        }, failure: (NetworkExceptions error) async {
          emit(_getErrorState(error));
        });
      },
    );
  }

  AccountSettingState _getErrorState(NetworkExceptions networkExceptions) {
    return AccountSettingState.isError(networkExceptions);
  }

  AccountSettingState _getLoadingState() {
    return const AccountSettingState.isLoading();
  }
}
