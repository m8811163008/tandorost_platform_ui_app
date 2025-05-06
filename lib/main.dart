import 'package:remote_api/remote_api.dart';

void main() {
  final remote_api = RemoteApiBase(
    get_user_language: () => Future.value(Language.english),
  );
  remote_api.sendVerificationCode(
    verificationCodeRequest: VerificationCodeRequest(
      phoneNumber: '09212805230',
      verificationType: VerificationType.register,
    ),
  );
}
