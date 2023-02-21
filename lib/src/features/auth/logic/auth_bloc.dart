import 'dart:async';
import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:absensi_app/src/core/api/network_exceptions.dart';
import 'package:absensi_app/src/dialogs/flash_message_wrapper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../../../network/data/auth/auth_repository.dart';
import '../../../network/domain_manager.dart';
import '../../../network/model/auth/auth_response.dart';
import '../../../network/model/auth/reset_password/reset_password.dart';
import '../../../network/model/auth/sign_in/phone_number_request.dart';
import '../../../network/model/auth/sign_in/sign_in.dart';
import '../../../network/model/auth/sign_in/sign_in_social_account.dart';
import '../../../network/model/auth/sign_up/sign_up.dart';
import '../../../network/model/user/user.dart';
import '../../../router/coordinator.dart';
import '../../../services/auth_service.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const _Initial()) {
    on<AuthEvent>(_onAuthEvent);
  }

  final AuthRepository _repository = GetIt.I<DomainManager>().authRepository;

  Future<void> _onAuthEvent(AuthEvent event, Emitter<AuthState> emit) async {
    await event.when(
      started: () async {},
      //ANCHOR - Signin Function
      signIn: (SignIn signIn) async {
        emit(_getLoadingState());

        final ApiResult<AuthResponse> apiResult =
            await _repository.signIn(signIn: signIn);

        await apiResult.when(success: (AuthResponse response) async {
          _saveAuthResponse(response);
          _pushFirebaseDeviceToken();
          emit(AuthState.loggedIn(response.data));
        }, failure: (NetworkExceptions error) async {
          Logger().e(apiResult);
          emit(_getErrorState(error));
        });
      },

      // ANCHOR - SignUp Function
      signUp: (SignUp signUp) async {
        emit(_getLoadingState());

        final ApiResult<AuthResponse> apiResult =
            await _repository.signUp(signUp: signUp);

        apiResult.when(success: (AuthResponse response) async {
          _saveAuthResponse(response);

          _pushFirebaseDeviceToken();
          emit(AuthState.loggedIn(response.data));
        }, failure: (NetworkExceptions error) async {
          emit(_getErrorState(error));
        });
      },

      //ANCHOR - Signin by Phone Number
      phoneNumber: (PhoneNumberRequest phoneNumberRequest) async {
        emit(_getLoadingState());

        final ApiResult<AuthResponse> apiResult =
            await _repository.signInPhoneNumber(
          phoneNumberRequest: phoneNumberRequest,
        );

        await apiResult.when(success: (AuthResponse response) async {
          _saveAuthResponse(response);

          _pushFirebaseDeviceToken();
          emit(AuthState.loggedIn(response.data));
        }, failure: (NetworkExceptions error) async {
          emit(_getErrorState(error));
        });
      },

      //ANCHOR - Signin by Social Account
      socialAccount: (SignInSocialAccount signInSocialAccount) async {
        emit(_getLoadingState());

        final ApiResult<AuthResponse> apiResult =
            await _repository.signInSocialAccount(
          signInSocialAccount: signInSocialAccount,
        );

        await apiResult.when(success: (AuthResponse response) async {
          _saveAuthResponse(response);

          _pushFirebaseDeviceToken();
          emit(AuthState.loggedIn(response.data));
        }, failure: (NetworkExceptions error) async {
          emit(_getErrorState(error));
        });
      },
      resetPassword: (ResetPassword resetPassword) async {
        emit(_getLoadingState());

        final ApiResult<String> apiResult =
            await _repository.resetPassword(resetPassword: resetPassword);

        apiResult.when(success: (String data) async {
          emit(AuthState.success(data));
        }, failure: (NetworkExceptions error) async {
          emit(_getErrorState(error));
        });
      },
      checkData: () async {
        emit(_getLoadingState());

        bool isLoggedIn = Auth.instance.isLoggedIn;

        if (isLoggedIn) {
          final apiResult = await _repository.fetchUser();

          apiResult.when(success: (AuthResponse response) async {
            Auth.instance.setTokenAndUserData(
              response.bearerToken,
              response.data,
            );

            _pushFirebaseDeviceToken();
            emit(AuthState.loggedIn(response.data));
          }, failure: (NetworkExceptions error) async {
            error.maybeWhen(
              orElse: () {
                emit(_getErrorState(error));
              },
              unauthorisedRequest: (_) {
                Auth.instance.clear();

                emit(const AuthState.notLoggedIn());
              },
            );
          });
        } else {
          emit(const AuthState.notLoggedIn());
        }
      },
      checkEmailExists: (String email) async {
        emit(_getLoadingState());

        final ApiResult<String> apiResult =
            await _repository.checkEmailExists(email: email);

        apiResult.when(success: (String data) async {
          emit(AuthState.success(data));
        }, failure: (NetworkExceptions error) async {
          emit(_getErrorState(error));
        });
      },
      logout: () async {
        emit(const AuthState.logouting());

        final ApiResult<String> apiResult = await _repository.signOut();

        apiResult.when(success: (String data) async {
          Auth.instance.clear();
          emit(AuthState.successLogout(data));
        }, failure: (NetworkExceptions error) async {
          emit(_getErrorState(error));
        });
      },
    );
  }

  // save json auth response data to local storage
  void _saveAuthResponse(AuthResponse response) {
    Auth.instance.setTokenAndUserData(response.bearerToken, response.data);
  }

  AuthState _getErrorState(NetworkExceptions networkExceptions) {
    return AuthState.isError(networkExceptions);
  }

  AuthState _getLoadingState() {
    return const AuthState.isLoading();
  }

  void _pushFirebaseDeviceToken() {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    messaging.subscribeToTopic('allDevices');

    messaging.getToken().then((token) async {
      if (token != null) {
        ApiResult<String> apiResult = await GetIt.I<DomainManager>()
            .notificationRepository
            .updateDeviceToken(
              token: token,
            );
        apiResult.whenOrNull(
          failure: (e) => FlashMessage.error(
            context: XCoordinator.context,
            error: token,
          ),
        );
      }
    });
  }
}
