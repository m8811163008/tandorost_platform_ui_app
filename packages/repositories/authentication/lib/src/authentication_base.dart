import 'dart:async';

import 'package:authentication/src/storage_key.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:remote_api/remote_api.dart';
import 'package:local_storage/local_storage.dart';

final GoogleSignIn signIn = GoogleSignIn.instance;

class AuthenticationRepository {
  final RemoteApi remoteApi;
  final LocalStorage localStorage;
  final _androidClientId =
      '1050674706678-onasa3m725nai77beq20t9np2thnbnsn.apps.googleusercontent.com';
  final _webServerClientId =
      '1050674706678-b6mpufv8njbec0gp4jf6ie9oj7oncb1b.apps.googleusercontent.com';
  // Client secret
  // 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

  AuthenticationRepository({
    required this.remoteApi,
    required this.localStorage,
  });
  Stream<AuthenticationStatus> get authenticationStatusStream =>
      remoteApi.authenticationStatusStream;

  Stream<GoogleSignInAuthenticationEvent> get googleAuthenticationEvents =>
      signIn.authenticationEvents;

  Future<void> initializeGoogleSignIn() async {
    try {
      await signIn.initialize(
        clientId: _androidClientId, // This is for the Android app itself
        serverClientId: _webServerClientId, // This is for your backend server,
      );

      // await signIn.attemptLightweightAuthentication();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> singInWithGoogle() async {
    try {
      await signIn.authenticate();
    } catch (e) {
      rethrow;
    }
  }

  // TODO add user spoken language
  Future<void> onVerifyByAi(FileDetail recordedFile) =>
      remoteApi.onVerifyByAi(recordedFile, Language.persian);

  Future<String> sendVerificationCode({
    required VerificationCodeRequest verificationCodeRequest,
  }) => remoteApi.sendVerificationCode(
    verificationCodeRequest: verificationCodeRequest,
  );

  Future<Credential?> get cachedCredential async {
    final credential = await localStorage.read(StorageKey.credential);

    return credential != null ? Credential.fromJson(credential) : null;
  }

  Future<String> register({required RegisterRequest registerRequest}) async {
    await upsertCredential(
      registerRequest.identifier,
      registerRequest.password,
    );
    return remoteApi.register(registerRequest: registerRequest);
  }

  Future<String> forgotPassword({
    required ForgotPasswordRequest forgotPasswordRequest,
  }) async {
    await upsertCredential(
      forgotPasswordRequest.identifier,
      forgotPasswordRequest.newPassword,
    );
    return remoteApi.forgotPassword(
      forgotPasswordRequest: forgotPasswordRequest,
    );
  }

  Future<void> upsertCredential(String identifier, String password) async {
    final credential = Credential(username: identifier, password: password);
    await localStorage.upsert(StorageKey.credential, credential.toJson());
  }

  Future<void> authenticate({required Credential credential}) async {
    final token = await remoteApi.authenticate(credential: credential);
    await localStorage.upsert(StorageKey.token, token.toJson());
  }

  Future<void> verifyGoogle({required String googleToken}) async {
    final token = await remoteApi.verifyGoogle(googleToken);
    await localStorage.upsert(StorageKey.token, token.toJson());
  }

  Future<void> logout() async {
    await signIn.signOut();
    await remoteApi.logout();
    await localStorage.delete(StorageKey.token);
  }

  Future<void> verifyVerificationCode({
    required String identifier,
    required String verificationCode,
  }) => remoteApi.verifyVerificationCode(
    identifier: identifier,
    verificationCode: verificationCode,
  );
  Future<Token?> accessTokenProvider() async {
    final tokenMap = await localStorage.read(StorageKey.token);
    if (tokenMap == null) {
      return null;
    }
    return Token.fromJson(tokenMap);
  }
}
