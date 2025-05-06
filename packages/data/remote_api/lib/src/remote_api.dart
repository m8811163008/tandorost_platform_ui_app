import 'package:remote_api/src/model/model.dart';

abstract interface class RemoteApi {
  Future<SuccessResponse> sendVerificationCode({
    required VerificationCodeRequest verificationCodeRequest,
  });
  Future<SuccessResponse> register({required RegisterRequest registerRequest});
}
