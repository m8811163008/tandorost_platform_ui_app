import 'package:remote_api/src/model/verification_type.dart';

class UriBuilder {
  static final baseUri = Uri(scheme: 'http', host: '10.0.2.2', port: 8001);
  static Uri authSendVerificationCode(VerificationType verificationType) {
    return baseUri.replace(
      path: '/auth/send_verification_code/',
      queryParameters: {'verification_type': verificationType.name},
    );
  }
}
