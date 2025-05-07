import 'package:remote_api/src/model/model.dart';

abstract interface class RemoteApi {
  Future<ApiResponse> sendVerificationCode({
    required VerificationCodeRequest verificationCodeRequest,
  });
  Future<ApiResponse> register({required RegisterRequest registerRequest});

  Future<ApiResponse> forgot_password({
    required ForgotPasswordRequest forgotPasswordRequest,
  });

  Future<Token> authenticate({required Credential credential});
}
