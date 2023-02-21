import 'dart:async';

import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:absensi_app/src/core/api/network_exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'verification_bloc.freezed.dart';
part 'verification_event.dart';
part 'verification_state.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  VerificationBloc() : super(const _Initial()) {
    on<VerificationEvent>(_onProgramEvent);
  }

  Future<void> _onProgramEvent(
      VerificationEvent event, Emitter<VerificationState> emit) async {
    await event.when(
      started: () async {},
      sendVerificationCode: (onSendEmail) async {
        emit(const VerificationState.isSending());

        final ApiResult<String> apiResult = await onSendEmail();
        print("result: $apiResult");
        apiResult.when(success: (String data) async {
          emit(const VerificationState.successSend());
        }, failure: (NetworkExceptions error) async {
          emit(_getErrorState(error));
        });
      },
      verifyOtp: (onVerifyOtp, otpText) async {
        emit(_getLoadingState());

        final ApiResult<String> apiResult = await onVerifyOtp(otpText);

        apiResult.when(success: (_) async {
          emit(VerificationState.successVerify(otpText));
        }, failure: (NetworkExceptions error) async {
          emit(_getErrorState(error));
        });
      },
    );
  }

  VerificationState _getErrorState(NetworkExceptions networkExceptions) {
    return VerificationState.isError(networkExceptions);
  }

  VerificationState _getLoadingState() {
    return const VerificationState.isLoading();
  }
}
