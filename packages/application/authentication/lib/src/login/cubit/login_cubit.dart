import 'dart:async';
import 'dart:io';

import 'package:authentication/authentication.dart';

import 'package:domain_model/domain_model.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tandorost_components/tandorost_components.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository) : super(LoginState()) {
    _initializeGoogleSignIn();
    _initalizeCachedCredential();
  }
  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription _googleAuthSubscription;
  @override
  Future<void> close() {
    _googleAuthSubscription.cancel();
    return super.close();
  }

  void _initalizeCachedCredential() async {
    final credential = await _authenticationRepository.cachedCredential;
    _enhancedEmit(state.copyWith(cachedCredential: credential));
  }

  void _initializeGoogleSignIn() async {
    try {
      _googleAuthSubscription = _authenticationRepository
          .googleAuthenticationEvents
          .listen(
            _handleAuthenticationEvent,
            onError: _handleAuthenticationError,
          );
      await _authenticationRepository.initializeGoogleSignIn();
    } catch (e) {
      _enhancedEmit(
        state.copyWith(
          initializingGoogleAuthStatus: AsyncProcessingStatus.connectionError,
          exception: e.toString(),
        ),
      );
    }
  }

  Future<void> _handleAuthenticationEvent(
    GoogleSignInAuthenticationEvent event,
  ) async {
    GoogleSignInAccount? user;

    if (event is GoogleSignInAuthenticationEventSignIn) {
      user = event.user;
      _onVerifyGoogleToken(user);
    }

    // // Check for existing authorization.
    // // #docregion CheckAuthorization
    // final GoogleSignInClientAuthorization? authorization = await user
    //     ?.authorizationClient
    //     .authorizationForScopes(['email']);
    // // #enddocregion CheckAuthorization

    // // If the user has already granted access to the required scopes, call the
    // // REST API.
    // if (user != null && authorization != null) {
    //   unawaited(_handleGetContact(user));
    // }
  }

  void _onVerifyGoogleToken(GoogleSignInAccount user) async {
    _enhancedEmit(
      state.copyWith(onVerifyGoogleTokenStatus: AsyncProcessingStatus.loading),
    );
    try {
      await _authenticationRepository.verifyGoogle(
        googleToken: user.authentication.idToken!,
      );
      await _authenticationRepository.upsertCredential(user.email, '4321');

      _enhancedEmit(
        state.copyWith(
          onVerifyGoogleTokenStatus: AsyncProcessingStatus.success,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          onVerifyGoogleTokenStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException catch (e) {
      try {
        await _authenticationRepository.logout();
      } catch (_) {}

      _enhancedEmit(
        state.copyWith(
          onVerifyGoogleTokenStatus: AsyncProcessingStatus.connectionError,
          exception: e.message,
        ),
      );
    }
  }

  Future<void> _handleAuthenticationError(Object e) async {
    if (e is GoogleSignInException) {
      _enhancedEmit(
        state.copyWith(
          initializingGoogleAuthStatus: AsyncProcessingStatus.connectionError,
          googleSignInException: e,
        ),
      );
    } else {
      _enhancedEmit(
        state.copyWith(
          initializingGoogleAuthStatus: AsyncProcessingStatus.connectionError,
          exception: e.toString(),
        ),
      );
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      _enhancedEmit(
        state.copyWith(
          initializingGoogleAuthStatus: AsyncProcessingStatus.loading,
        ),
      );
      await _authenticationRepository.singInWithGoogle();

      _enhancedEmit(
        state.copyWith(
          initializingGoogleAuthStatus: AsyncProcessingStatus.success,
        ),
      );
    } catch (e) {
      if (e is GoogleSignInException) {
        _enhancedEmit(
          state.copyWith(
            initializingGoogleAuthStatus: AsyncProcessingStatus.connectionError,
            googleSignInException: e,
          ),
        );
      } else {
        _enhancedEmit(
          state.copyWith(
            initializingGoogleAuthStatus: AsyncProcessingStatus.connectionError,
            exception: e.toString(),
          ),
        );
      }
    }
  }

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
        username: state.phoneNumber.isEmpty
            ? state.cachedCredential?.username ?? state.phoneNumber
            : state.phoneNumber,
        password: state.password.isEmpty
            ? state.cachedCredential?.password ?? state.password
            : state.password,
      );
      // save credential on device
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
