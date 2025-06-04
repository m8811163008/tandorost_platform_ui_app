import 'dart:io';

import 'package:authentication/authentication.dart';

import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._authenticationRepository) : super(RegisterState());
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
        phoneNumber: state.phoneNumber,
        verificationType: VerificationType.register,
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
          verificationStatus: AsyncProcessingStatus.serverConnectionError,
          exception: e.message,
        ),
      );
    }
  }

  void onRegister() async {
    _enhancedEmit(
      state.copyWith(registerStatus: AsyncProcessingStatus.loading),
    );
    try {
      final registerReques = RegisterRequest(
        userName: state.phoneNumber,
        password: state.password,
        verificationCode: state.verificationCode,
      );
      await _authenticationRepository.register(registerRequest: registerReques);
      _enhancedEmit(
        state.copyWith(registerStatus: AsyncProcessingStatus.success),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          registerStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException catch (e) {
      _enhancedEmit(
        state.copyWith(
          registerStatus: AsyncProcessingStatus.serverConnectionError,
          exception: e.message,
        ),
      );
    }
  }

  void _enhancedEmit(RegisterState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
