import 'package:absensi_app/src/core/api/api_result.dart';
import '../../model/account_setting/change_email/change_email_request.dart';
import '../../model/account_setting/change_password/change_password.dart';
import '../../model/account_setting/social_account/social_account.dart';
import '../../model/account_setting/update_profile/update_profile.dart';
import '../../model/auth/sign_in/phone_number_request.dart';
import '../../model/auth/sign_in/sign_in_social_account.dart';
import '../../model/common/pagination_type.dart';
import '../../model/user/personal_information.dart';

abstract class AccountSettingRepository {
  Future<ApiResult<String>> changePassword({
    required ChangePassword changePassword,
  });

  Future<ApiResult<String>> updatePhoneNumber({
    required PhoneNumberRequest phoneNumberRequest,
  });

  Future<ApiResult<String>> updateProfile({
    required UpdateProfile updateProfile,
  });

  Future<ApiResult<String>> updateProfilePhoto({
    required String imagePath,
  });

  Future<ApiResult<PersonalInformation>> updatePersonalInformation({
    required PersonalInformation request,
  });

  Future<ApiResult<PaginationType<SocialAccount>>> socialAccount({
    required int pageNumber,
  });

  Future<ApiResult<String>> sendChangeEmailVerficationCode();

  Future<ApiResult<String>> verifEmailVerficationKey({
    required String key,
  });

  Future<ApiResult<String>> changeEmail({
    required ChangeEmailRequest request,
  });

  Future<ApiResult<SocialAccount>> addSocialAccount({
    required SignInSocialAccount signInSocialAccount,
  });

  Future<ApiResult<String>> deleteSocialAccount({
    required int id,
  });
}
