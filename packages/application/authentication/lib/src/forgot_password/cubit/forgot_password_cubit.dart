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
    _enhancedEmit(state.copyWith(phoneNumber: value));
  }

  void onChangePinCode(String value) {
    _enhancedEmit(state.copyWith(password: value));
  }

  void onChangeVerificationCode(String value) {
    _enhancedEmit(state.copyWith(verificationCode: value));
  }

  void sendVerificationCode() async {
    _enhancedEmit(
      state.copyWith(verificationStatus: AsyncProcessingStatus.loading),
    );
    try {
      final request = VerificationCodeRequest(
        identifier: state.phoneNumber,
        verificationType: VerificationType.forgotPassword,
      );
      await _authenticationRepository.sendVerificationCode(
        verificationCodeRequest: request,
      );
      _enhancedEmit(
        state.copyWith(verificationStatus: AsyncProcessingStatus.success),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          verificationStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException catch (e) {
      _enhancedEmit(
        state.copyWith(
          verificationStatus: AsyncProcessingStatus.connectionError,
          exception: e.message,
        ),
      );
    }
  }

  void onForgotPassword() async {
    _enhancedEmit(
      state.copyWith(forgotPasswordStatus: AsyncProcessingStatus.loading),
    );
    try {
      final forgotPasswordRequest = ForgotPasswordRequest(
        userName: state.phoneNumber,
        newPassword: state.password,
        verificationCode: state.verificationCode,
      );
      await _authenticationRepository.forgotPassword(
        forgotPasswordRequest: forgotPasswordRequest,
      );
      _enhancedEmit(
        state.copyWith(forgotPasswordStatus: AsyncProcessingStatus.success),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          forgotPasswordStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException catch (e) {
      _enhancedEmit(
        state.copyWith(
          forgotPasswordStatus: AsyncProcessingStatus.connectionError,
          exception: e.message,
        ),
      );
    }
  }

  void _enhancedEmit(ForgotPasswordState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
