import 'package:remote_api/src/model/model.dart';

abstract interface class RemoteApi {
  Future<String> sendVerificationCode({
    required VerificationCodeRequest verificationCodeRequest,
  });
  Future<String> register({required RegisterRequest registerRequest});

  Future<String> forgot_password({
    required ForgotPasswordRequest forgotPasswordRequest,
  });

  Future<Token> authenticate({required Credential credential});

  Future<UserProfile> user_profile();
}
