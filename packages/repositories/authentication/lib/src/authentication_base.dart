import 'package:authentication/src/storage_key.dart';
import 'package:remote_api/remote_api.dart';
import 'package:local_storage/local_storage.dart';

class AuthenticationRepository {
  final RemoteApi remoteApi;
  final LocalStorage localStorage;

  AuthenticationRepository({
    required this.remoteApi,
    required this.localStorage,
  });
  Stream<AuthenticationStatus> get authenticationStatusStream =>
      remoteApi.authenticationStatusStream;

  Future<String> sendVerificationCode({
    required VerificationCodeRequest verificationCodeRequest,
  }) => remoteApi.sendVerificationCode(
    verificationCodeRequest: verificationCodeRequest,
  );

  Future<String> register({required RegisterRequest registerRequest}) =>
      remoteApi.register(registerRequest: registerRequest);

  Future<String> forgotPassword({
    required ForgotPasswordRequest forgotPasswordRequest,
  }) => remoteApi.forgotPassword(forgotPasswordRequest: forgotPasswordRequest);

  Future<void> authenticate({required Credential credential}) async {
    final token = await remoteApi.authenticate(credential: credential);
    await localStorage.upsert(StorageKey.token, token.toJson());
  }

  Future<void> logout() async {
    await remoteApi.logout();
    await localStorage.delete(StorageKey.token);
  }

  Future<Token?> accessTokenProvider() async {
    final tokenMap = await localStorage.read(StorageKey.token);
    if (tokenMap == null) {
      return null;
    }
    return Token.fromJson(tokenMap);
  }
}
