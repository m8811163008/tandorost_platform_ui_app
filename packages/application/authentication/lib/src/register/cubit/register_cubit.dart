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
        verificationType: VerificationType.register,
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

  void onRegister() async {
    emit(state.copyWith(registerStatus: AsyncProcessingStatus.loading));
    try {
      final registerReques = RegisterRequest(
        userName: state.phoneNumber,
        password: state.password,
        verificationCode: state.verificationCode,
      );
      await _authenticationRepository.register(registerRequest: registerReques);
      emit(state.copyWith(registerStatus: AsyncProcessingStatus.success));
    } on InternetConnectionException {
      emit(
        state.copyWith(
          registerStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException catch (e) {
      emit(
        state.copyWith(
          registerStatus: AsyncProcessingStatus.serverConnectionError,
          exception: e.message,
        ),
      );
    }
  }
}
