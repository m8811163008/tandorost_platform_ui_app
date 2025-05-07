import 'package:remote_api/src/model/verification_type.dart';

class UriBuilder {
  static final baseUri = Uri(scheme: 'http', host: '10.0.2.2', port: 8001);
  static Uri authSendVerificationCode(VerificationType verificationType) {
    return baseUri.replace(
      path: '/auth/send_verification_code/',
      queryParameters: {'verification_type': verificationType.name},
    );
  }
  static Uri register() {
    return baseUri.replace(
      path: '/auth/register/'
    );
  }

  static Uri forgotPasswrd() {
    return baseUri.replace(
      path: '/auth/forgot_password/'
    );
  }
  static Uri authToken() {
    return baseUri.replace(
      path: '/auth/token/'
    );
  }
}
