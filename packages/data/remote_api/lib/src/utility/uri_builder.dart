import 'package:remote_api/src/model/verification_type.dart';

class UriBuilder {
  // static final baseUri = Uri(scheme: 'http', host: '10.0.2.2', port: 8001);
  static final baseUri = Uri(scheme: 'http', host: '127.0.0.1', port: 8001);
  static final basePath = '/api/v1';
  static Uri authSendVerificationCode(VerificationType verificationType) {
    return baseUri.replace(
      path: '$basePath/auth/send_verification_code/',
      queryParameters: {'verification_type': verificationType.name},
    );
  }

  static Uri register() {
    return baseUri.replace(path: '$basePath/auth/register/');
  }

  static Uri forgotPasswrd() {
    return baseUri.replace(path: '$basePath/auth/forgot_password/');
  }

  static Uri authToken() {
    return baseUri.replace(path: '$basePath/auth/token/');
  }

  static Uri userProfile() {
    return baseUri.replace(path: '$basePath/user/user_profile/');
  }

  static Uri updateProfile() {
    return baseUri.replace(path: '$basePath/user/update_profile/');
  }

  static Uri readUserBioData() {
    return baseUri.replace(path: '$basePath/user/read_user_bio_data/');
  }

  static Uri updateUserBioData() {
    return baseUri.replace(path: '$basePath/user/update_user_bio_data/');
  }

  static Uri deleteUserBioData(String dataPointsId) {
    return baseUri.replace(
      path: '$basePath/user/delete_user_bio_data/',
      queryParameters: {'data_point_id': dataPointsId},
    );
  }
}
