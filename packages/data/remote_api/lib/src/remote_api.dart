import 'package:remote_api/src/model/success_response.dart';
import 'package:remote_api/src/model/verification_code_request.dart';

abstract interface class RemoteApi {
  Future<SuccessResponse> sendVerificationCode({
    required VerificationCodeRequest verificationCodeRequest,
  });
}
