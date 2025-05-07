import 'package:remote_api/remote_api.dart';

void main() async {
  final remote_api = RemoteApiBase(
    get_user_language: () => Future.value(Language.english),
  );
  // final res = await remote_api.sendVerificationCode(
  //   verificationCodeRequest: VerificationCodeRequest(
  //     phoneNumber: '09212805230',
  //     verificationType: VerificationType.register,
  //   ),
  // );
  // final res = await remote_api.register(
  //   registerRequest: RegisterRequest(
  //     userName: '09212805230',
  //     password: '1234',
  //     verificationCode: '9601',
  //   ),
  // );
  // final res = await remote_api.forgot_password(
  //   forgotPasswordRequest: ForgotPasswordRequest(
  //     userName: '09212805230',
  //     newPassword: '4321',
  //     verificationCode: '9601',
  //   ),
  // );
  final res = await remote_api.authenticate(
    credential: Credential(
      username: '09212805230',
      password: '4321',
    ),
  );
  print(res.accessToken);
}
