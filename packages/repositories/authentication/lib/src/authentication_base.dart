import 'package:remote_api/remote_api.dart';
import 'package:local_storage/local_storage.dart';
class AuthenticationRepository {
  final RemoteApi remoteApi;
  final LocalStorage localStorage;

  AuthenticationRepository({required this.remoteApi, required this.localStorage});


  Future<String> sendVerificationCode({
    required VerificationCodeRequest verificationCodeRequest,
  })=> remoteApi.sendVerificationCode(verificationCodeRequest: verificationCodeRequest);

  Future<String> register({required RegisterRequest registerRequest}) => remoteApi.register(registerRequest: registerRequest);

  Future<String> forgotPassword({
    required ForgotPasswordRequest forgotPasswordRequest,
  }) => remoteApi.forgotPassword(forgotPasswordRequest: forgotPasswordRequest);

  Future<void> authenticate({required Credential credential}) async {
    try{
      final token = await remoteApi.authenticate(credential: credential);
      await localStorage.saveToken(token);
    }on Exception{
      rethrow;
    }
  } 

}
