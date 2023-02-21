import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../model/account_setting/change_email/change_email_request.dart';
import '../../model/account_setting/change_password/change_password.dart';
import '../../model/account_setting/social_account/social_account.dart';
import '../../model/account_setting/update_profile/update_profile.dart';
import '../../model/auth/sign_in/phone_number_request.dart';
import '../../model/auth/sign_in/sign_in_social_account.dart';
import '../../model/common/pagination_type.dart';
import '../../model/user/personal_information.dart';
import '../common/http.dart';
import 'account_setting_repository.dart';

class AccountSettingRepositoryImpl extends AccountSettingRepository {
  late XHttp http;

  AccountSettingRepositoryImpl() {
    http = XHttp(
      xBaseUrl: dotenv.env['LARAJET_API_BASE_URL'],
    );
  }

  @override
  Future<ApiResult<String>> changePassword({
    required ChangePassword changePassword,
  }) async {
    return await http.post(
      '/password',
      data: changePassword.toJson(),
    );
  }

  @override
  Future<ApiResult<String>> sendChangeEmailVerficationCode() async {
    return await http.post('/profile/send-change-email-code');
  }

  @override
  Future<ApiResult<String>> verifEmailVerficationKey({
    required String key,
  }) async {
    return await http.post('/profile/change-email-verif-key/$key');
  }

  @override
  Future<ApiResult<String>> changeEmail({
    required ChangeEmailRequest request,
  }) async {
    return await http.post(
      '/profile/change-email',
      data: request.toJson(),
    );
  }

  @override
  Future<ApiResult<String>> updatePhoneNumber({
    required PhoneNumberRequest phoneNumberRequest,
  }) async {
    return await http.post(
      '/profile/phone-number',
      data: phoneNumberRequest.toJson(),
    );
  }

  @override
  Future<ApiResult<String>> updateProfile({
    required UpdateProfile updateProfile,
  }) async {
    return await http.post(
      '/profile',
      data: updateProfile.toJson(),
    );
  }

  @override
  Future<ApiResult<String>> updateProfilePhoto({
    required String imagePath,
  }) async {
    final FormData formData = FormData.fromMap(
      {'photo': await MultipartFile.fromFile(imagePath)},
    );

    return await http.post(
      '/profile/photo',
      data: formData,
      onSuccess: (response) => response.data['data']['profile_photo_url'],
    );
  }

  @override
  Future<ApiResult<PersonalInformation>> updatePersonalInformation({
    required PersonalInformation request,
  }) async {
    return await http.post(
      '/profile/personal-information',
      data: request.toJson(),
      onSuccess: (response) => PersonalInformation.fromJson(
        response.data['data'],
      ),
    );
  }

  @override
  Future<ApiResult<PaginationType<SocialAccount>>> socialAccount({
    required int pageNumber,
  }) async {
    return await http.get(
      '/profile/social-account?page[number]=$pageNumber',
      onSuccess: (response) => PaginationType<SocialAccount>.fromJson(
        response.data,
      ),
      authorization: true,
    );
  }

  @override
  Future<ApiResult<SocialAccount>> addSocialAccount({
    required SignInSocialAccount signInSocialAccount,
  }) async {
    return await http.post(
      '/profile/social-account',
      data: signInSocialAccount.toJson(),
      onSuccess: (response) => SocialAccount.fromJson(response.data['data']),
    );
  }

  @override
  Future<ApiResult<String>> deleteSocialAccount({required int id}) async {
    return http.delete('/profile/social-account/$id');
  }
}
