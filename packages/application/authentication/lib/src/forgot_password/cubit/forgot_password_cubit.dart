import 'dart:io';

import 'package:authentication/authentication.dart';

import 'package:domain_model/domain_model.dart';
import 'package:flutter/foundation.dart';

import 'package:tandorost_components/tandorost_components.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this._authenticationRepository)
    : super(ForgotPasswordState());
  final AuthenticationRepository _authenticationRepository;
  void onChangePhoneNumber(String value) {
    emit(state.copyWith(phoneNumber: value));
  }

  void onChangePinCode(String value) {
    emit(state.copyWith(password: value));
  }

  void onChangeVerificationCode(String value) {
    emit(state.copyWith(verificationCode: value));
  }

  void sendVerificationCode() async {
    emit(state.copyWith(verificationStatus: AsyncProcessingStatus.loading));
    try {
      final request = VerificationCodeRequest(
        phoneNumber: state.phoneNumber,
        verificationType: VerificationType.forgotPassword,
      );
      await _authenticationRepository.sendVerificationCode(
        verificationCodeRequest: request,
      );
      emit(state.copyWith(verificationStatus: AsyncProcessingStatus.success));
    } on InternetConnectionException {
      emit(
        state.copyWith(
          verificationStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException catch (e) {
      emit(
        state.copyWith(
          verificationStatus: AsyncProcessingStatus.serverConnectionError,
          exception: e.message,
        ),
      );
    }
  }

  void onForgotPassword() async {
    emit(state.copyWith(forgotPasswordStatus: AsyncProcessingStatus.loading));
    try {
      final forgotPasswordRequest = ForgotPasswordRequest(
        userName: state.phoneNumber,
        newPassword: state.password,
        verificationCode: state.verificationCode,
      );
      await _authenticationRepository.forgotPassword(
        forgotPasswordRequest: forgotPasswordRequest,
      );
      emit(state.copyWith(forgotPasswordStatus: AsyncProcessingStatus.success));
    } on InternetConnectionException {
      emit(
        state.copyWith(
          forgotPasswordStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException catch (e) {
      emit(
        state.copyWith(
          forgotPasswordStatus: AsyncProcessingStatus.serverConnectionError,
          exception: e.message,
        ),
      );
    }
  }
}
