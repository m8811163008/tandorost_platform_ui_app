import 'package:remote_api/remote_api.dart';

void main() async {
  final remote_api = RemoteApiBase(
    get_user_language: () => Future.value(Language.english),
    get_access_token:
        () => Future.value(
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwOTIxMjgwNTIzMCIsInVzZXJfaWQiOiJkMDVjMTFkOS0wYmUxLTQ2Y2EtYmUzMy04MWQ5NWE5MzIzMzAiLCJleHAiOjE3NDY3MDQ4NTN9.r9ff3OFo2OBSoVx1k5gXRL7J4QCn0T3eEf-kFoKIPSE',
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
  // final res = await remote_api.user_profile();
  // final profile = res.copyWith(fullName: 'miladk');
  // final updated = await remote_api.update_profile(profile);
  // final bioDataUpdate = await remote_api.updateUserBioData(
  //   UserBioDataUpsert(
  //     age: 10,
  //     gender: Gender.male,
  //     activityLevel: ActivityLevel.active,
  //     weight: 39.7,
  //     waistCircumference: 78.8,
  //     height: 35,
  //   ),
  // );
  // final bioData = await remote_api.userBioData();
  // print(bioData);
  // final deleted_id = await remote_api.deleteUserBioDataPoint(
  //   dataPointsId: 'bcca7e54-260a-4d6e-97bd-3d5af69fbffc',
  // );
  // final bioData2 = await remote_api.userBioData();
  // print(bioData2);
  // print(deleted_id);
}
