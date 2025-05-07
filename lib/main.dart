import 'package:remote_api/remote_api.dart';

void main() async {
  final remote_api = RemoteApiBase(
    get_user_language: () => Future.value(Language.english),
    get_access_token:
        () => Future.value(
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwOTIxMjgwNTIzMCIsInVzZXJfaWQiOiJkMDVjMTFkOS0wYmUxLTQ2Y2EtYmUzMy04MWQ5NWE5MzIzMzAiLCJleHAiOjE3NDY2MzIzODB9.Ksm58mvOpyWTD49_FVLlBQ9_wHctCoi3lhluWGlbSMc',
        ),
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
  // final res = await remote_api.authenticate(
  //   credential: Credential(
  //     username: '09212805230',
  //     password: '4321',
  //   ),
  // );
  final res = await remote_api.user_profile();
  print(res.phoneNumber);
}
