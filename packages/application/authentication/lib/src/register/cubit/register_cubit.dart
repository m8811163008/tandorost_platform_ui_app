import 'dart:io';
import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:authentication/authentication.dart';

import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._authenticationRepository) : super(RegisterState());
  final AuthenticationRepository _authenticationRepository;

  void onChangePhoneNumber(String value) {
    emit(state.copyWith(phoneNumber: TextInput.dirty(value)));
  }

  void onChangeVerificationCode(String value) {
    emit(state.copyWith(verificationCode: TextInput.dirty(value)));
  }

  void onSendVerificationCode() async {
    if (state.phoneNumber.isValid && state.password.isValid) {
      emit(state.copyWith(verificationStatus: AsyncProcessingStatus.loading));
      try {
        final request = VerificationCodeRequest(
          phoneNumber: state.phoneNumber.value,
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
      } on HttpException {
        emit(
          state.copyWith(
            verificationStatus: AsyncProcessingStatus.serverConnectionError,
          ),
        );
      }
    }
  }

  void onRegister() async {
    if (state.phoneNumber.isValid &&
        state.password.isValid &&
        state.verificationCode.isValid) {
      emit(state.copyWith(registerStatus: AsyncProcessingStatus.loading));
      try {
        final registerReques = RegisterRequest(
          userName: state.phoneNumber.value,
          password: state.password.value,
          verificationCode: state.verificationCode.value,
        );
        await _authenticationRepository.register(
          registerRequest: registerReques,
        );
        emit(state.copyWith(registerStatus: AsyncProcessingStatus.success));
      } on InternetConnectionException {
        emit(
          state.copyWith(
            registerStatus: AsyncProcessingStatus.internetConnectionError,
          ),
        );
      } on HttpException {
        emit(
          state.copyWith(
            registerStatus: AsyncProcessingStatus.serverConnectionError,
          ),
        );
      }
    }
  }
}
