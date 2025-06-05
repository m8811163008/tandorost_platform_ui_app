import 'dart:io';

import 'package:authentication/authentication.dart';

import 'package:domain_model/domain_model.dart';
import 'package:flutter/foundation.dart';
import 'package:tandorost_components/tandorost_components.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository) : super(LoginState());
  final AuthenticationRepository _authenticationRepository;

  void onChangePhoneNumber(String value) {
    _enhancedEmit(state.copyWith(phoneNumber: value));
  }

  void onChangePinCode(String value) {
    _enhancedEmit(state.copyWith(password: value));
  }

  void login() async {
    _enhancedEmit(state.copyWith(loginStatus: AsyncProcessingStatus.loading));
    try {
      final credential = Credential(
        username: state.phoneNumber,
        password: state.password,
      );
      await _authenticationRepository.authenticate(credential: credential);
      _enhancedEmit(state.copyWith(loginStatus: AsyncProcessingStatus.success));
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          loginStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException catch (e) {
      _enhancedEmit(
        state.copyWith(
          loginStatus: AsyncProcessingStatus.connectionError,
          exception: e.message,
        ),
      );
    }
  }

  void _enhancedEmit(LoginState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
