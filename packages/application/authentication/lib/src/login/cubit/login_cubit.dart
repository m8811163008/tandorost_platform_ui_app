import 'dart:async';
import 'dart:io';

import 'package:authentication/authentication.dart';

import 'package:domain_model/domain_model.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tandorost_components/tandorost_components.dart';

part 'login_state.dart';

final GoogleSignIn signIn = GoogleSignIn.instance;

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository) : super(LoginState()) {
    _initializeGoogleSignIn();
  }
  final AuthenticationRepository _authenticationRepository;
  final _clientId =
      '1050674706678-onasa3m725nai77beq20t9np2thnbnsn.apps.googleusercontent.com';

  void _initializeGoogleSignIn() async {
    try {
      await signIn.initialize(serverClientId: _clientId);
      // unawaited(
      //   signIn.initialize(serverClientId: _clientId).then((_) {
      //     signIn.authenticationEvents
      //         .listen(_handleAuthenticationEvent)
      //         .onError(_handleAuthenticationError);

      //     signIn.attemptLightweightAuthentication();
      //   }),
      // );
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
    // // #docregion CheckAuthorization
    // GoogleSignInAccount? user;
    // // #enddocregion CheckAuthorization
    // if (event is GoogleSignInAuthenticationEventSignIn) {
    //   user = event.user;
    // } else if (event is GoogleSignInAuthenticationEventSignOut) {
    //   user = null;
    // }

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

  Future<void> _handleAuthenticationError(Object e) async {
    // if (e is GoogleSignInException) {
    //   _enhancedEmit(
    //     state.copyWith(
    //       initializingGoogleAuthStatus: AsyncProcessingStatus.connectionError,
    //       googleSignInException: e,
    //     ),
    //   );
    // } else {
    //   _enhancedEmit(
    //     state.copyWith(
    //       initializingGoogleAuthStatus: AsyncProcessingStatus.connectionError,
    //       exception: e.toString(),
    //     ),
    //   );
    // }
  }

  // Calls the People API REST endpoint for the signed-in user to retrieve information.
  Future<void> _handleGetContact(GoogleSignInAccount user) async {}

  Future<void> signInWithGoogle() async {
    try {
      _enhancedEmit(
        state.copyWith(
          initializingGoogleAuthStatus: AsyncProcessingStatus.loading,
        ),
      );
      final GoogleSignInAccount googleUser = await signIn.authenticate();

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;
      final String? idToken = googleAuth.idToken;
      _enhancedEmit(
        state.copyWith(
          initializingGoogleAuthStatus: AsyncProcessingStatus.success,
        ),
      );

      if (idToken != null) {
        // Send this ID Token to your FastAPI backend
        // and get your own JWT in return.
        // await sendIdTokenToBackend(idToken);
      }
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
        username: state.phoneNumber,
        password: state.password,
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
