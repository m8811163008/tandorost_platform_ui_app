import 'dart:html' as webFile;
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

import 'package:remote_api/remote_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final remote_api = RemoteApiBase(
    get_user_language: () => Future.value(Language.english),
    get_access_token:
        () => Future.value(
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwOTIxMjgwNTIzMCIsInVzZXJfaWQiOiJkMDVjMTFkOS0wYmUxLTQ2Y2EtYmUzMy04MWQ5NWE5MzIzMzAiLCJleHAiOjE3NDY4MTc5MDJ9.r-tD3_xZhJjvt4D3-O3xJ0oEjuyZL6h0yEVtE3a8j9M',
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
  // if (kIsWeb) {
  //   PickedFile localFile = PickedFile('1.png');
  //   Uint8List bytes = await localFile.readAsBytes();
  //   final res = await remote_api.addUserImages(
  //     UserImage(
  //       gallaryTag: GallaryTag.profileImage,
  //       imageGallaryFiles: [bytes],
  //     ),
  //   );
  // }
  // final res = await remote_api.readUserImageGallary([
  //   GallaryTag.defaultTag,
  //   GallaryTag.profileImage,
  // ]);
  // final res = await remote_api.readUserProfileImage();
  // print(res.first.id);
  // final res2 = await remote_api.archiveUserImages(res.map((e)=> e.id).skip(2).toList());
  // print(res2);
  // final res3 = await remote_api.readImage(res.first);
  // runApp(MyApp(remote_api: remote_api));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key, required this.remote_api});
//   final RemoteApiBase remote_api;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Center(
//         child: FutureBuilder<List<FileData>>(
//           future: remote_api.readUserProfileImage(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               final fileDate = snapshot.data!.first;
//               return FutureBuilder<FileDetail>(
//                 future: remote_api.readImage(fileDate),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.done) {
//                     return SizedBox(child: Image.memory(snapshot.data!.bytes));
//                   }else{
//                     return CircularProgressIndicator();
//                   }
//                 },
//               );
//             }else{
//               return CircularProgressIndicator();
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
