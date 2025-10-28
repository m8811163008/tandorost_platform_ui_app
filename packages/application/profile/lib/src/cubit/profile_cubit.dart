import 'dart:async';
import 'dart:io';

import 'package:authentication/authentication.dart';
import 'package:coach_repository/coach_repository.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:image_repository/image_repository.dart';
import 'package:payment_repository/payment.dart';

import 'package:profile/profile.dart';
import 'package:profile_app/src/cubit/time_zone_helper.dart';
import 'package:tandorost_components/tandorost_components.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this._profile,
    this._imageRepository,
    this._paymentRepository,
    this._coachRepository,
    this._authenticationRepositry,
    this.flutterLocalNotificationsPlugin,
  ) : super(ProfileState()) {
    readProfile();
    readImageProfile();
    isReminderEnabled();

    tz.initializeTimeZones();
    userProfileSubscription = _profile.userProfileStream.listen((profile) {
      if (profile == null) return;
      _enhancedEmit(
        state.copyWith(
          userProfile: () => profile,
          updatedUserProfile: () => state.updatedUserProfile ?? profile,
        ),
      );
    });
    coachProfileSubscription = _coachRepository.coachProfileStream.listen((
      coachProfile,
    ) {
      if (coachProfile == null) return;
      _enhancedEmit(
        state.copyWith(
          coachProfile: () => coachProfile,
          updatedCoachProfile: () => state.updatedCoachProfile ?? coachProfile,
        ),
      );
    });
  }
  final ProfileRepository _profile;
  final ImageRepository _imageRepository;
  final PaymentRepository _paymentRepository;
  final CoachRepository _coachRepository;
  final AuthenticationRepository _authenticationRepositry;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late final StreamSubscription<UserProfile?> userProfileSubscription;
  late final StreamSubscription<CoachProfile?> coachProfileSubscription;

  @override
  Future<void> close() async {
    await Future.wait([
      userProfileSubscription.cancel(),
      coachProfileSubscription.cancel(),
    ]);
    return super.close();
  }

  void readImageProfile() async {
    _enhancedEmit(
      state.copyWith(readProfileImageStatus: AsyncProcessingStatus.loading),
    );
    try {
      final profileImage = await _imageRepository.readUserProfileImage();
      FileDetail? actualImage;
      if (profileImage.isNotEmpty) {
        actualImage = await _imageRepository.readImage(profileImage.last);
      }

      _enhancedEmit(
        state.copyWith(
          readProfileImageStatus: AsyncProcessingStatus.success,
          profileImage: () => actualImage,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          readProfileImageStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          readProfileImageStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void isReminderEnabled() async {
    final isEnable = await _profile.isNotificationReminderSettingEnabled;
    _enhancedEmit(
      state.copyWith(isReminderNotificationPermissionGranted: isEnable),
    );
  }

  void readSubscriptions() async {
    _enhancedEmit(
      state.copyWith(readSubscriptionStatus: AsyncProcessingStatus.loading),
    );
    try {
      final subscriptions = await _paymentRepository.readSubscriptionPayments();

      _enhancedEmit(
        state.copyWith(
          readSubscriptionStatus: AsyncProcessingStatus.success,
          subscriptions: subscriptions,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          readSubscriptionStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          readSubscriptionStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void updateImageProfile(FileDetail profileImage) async {
    _enhancedEmit(
      state.copyWith(updatingProfileStatus: AsyncProcessingStatus.loading),
    );
    try {
      final userImage = UserFile(
        gallaryTag: GallaryTag.profileImage,
        imageGallaryFiles: [profileImage],
      );
      final updatedProfileImage = await _imageRepository.addUserImages(
        userImage,
      );
      final actualImage = await _imageRepository.readImage(
        updatedProfileImage.last,
      );

      _enhancedEmit(
        state.copyWith(
          updatingProfileStatus: AsyncProcessingStatus.success,
          profileImage: () => actualImage,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          updatingProfileStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          updatingProfileStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void readProfile() async {
    _enhancedEmit(
      state.copyWith(readProfileStatus: AsyncProcessingStatus.loading),
    );
    try {
      await _profile.userProfile();

      _enhancedEmit(
        state.copyWith(readProfileStatus: AsyncProcessingStatus.success),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          readProfileStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          readProfileStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void readCoachProfile() async {
    _enhancedEmit(
      state.copyWith(readCoachProfileStatus: AsyncProcessingStatus.loading),
    );
    try {
      await _coachRepository.readCoachProfile();

      _enhancedEmit(
        state.copyWith(readCoachProfileStatus: AsyncProcessingStatus.success),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          readCoachProfileStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          readCoachProfileStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void onChangeName(String name) async {
    _enhancedEmit(
      state.copyWith(
        updatedUserProfile: () =>
            state.updatedUserProfile!.copyWith(fullName: name),
      ),
    );
  }

  void onChangPhoneNumber(String phoneNumber) async {
    _enhancedEmit(
      state.copyWith(
        updatedUserProfile: () =>
            state.updatedUserProfile!.copyWith(phoneNumber: phoneNumber),
      ),
    );
  }

  void onChangVerificationCode(String verificationCode) async {
    _enhancedEmit(state.copyWith(verificationCode: verificationCode));
  }

  void onChangEmail(String email) async {
    _enhancedEmit(
      state.copyWith(
        updatedUserProfile: () =>
            state.updatedUserProfile!.copyWith(email: email),
      ),
    );
  }

  void updateName() async {
    await updateProfile(state.updatedUserProfile!);
  }

  void updatePhoneNumber() async {
    await updateProfile(state.updatedUserProfile!);
  }

  Future<void> sendVerificationCode({required bool isVerifyPhoneNumber}) async {
    _enhancedEmit(
      state.copyWith(sendVerificationCodeStatus: AsyncProcessingStatus.loading),
    );
    try {
      await _authenticationRepositry.sendVerificationCode(
        verificationCodeRequest: VerificationCodeRequest(
          identifier: isVerifyPhoneNumber
              ? state.updatedUserProfile!.phoneNumber!
              : state.updatedUserProfile!.email!,
          verificationType: VerificationType.securityCheck,
        ),
      );

      _enhancedEmit(
        state.copyWith(
          isVerifyPhoneNumber: isVerifyPhoneNumber,
          sendVerificationCodeStatus: AsyncProcessingStatus.success,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          sendVerificationCodeStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          sendVerificationCodeStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void verifyVerificationCode() async {
    _enhancedEmit(
      state.copyWith(
        verifyVerificationCodeStatus: AsyncProcessingStatus.loading,
      ),
    );
    try {
      await _authenticationRepositry.verifyVerificationCode(
        identifier: state.isVerifyPhoneNumber!
            ? state.updatedUserProfile!.phoneNumber!
            : state.updatedUserProfile!.email!,
        verificationCode: state.verificationCode,
      );

      _enhancedEmit(
        state.copyWith(
          verifyVerificationCodeStatus: AsyncProcessingStatus.success,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          verifyVerificationCodeStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          verifyVerificationCodeStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void updateEmail() async {
    await updateProfile(state.updatedUserProfile!);
  }

  void onChangeWeightSpeed(ChangeWeightSpeed speed) async {
    final updatedProfileVar = state.updatedUserProfile!.copyWith(
      changeWeightSpeed: speed,
    );
    await updateProfile(updatedProfileVar);
    // _enhancedEmit(state.copyWith(updatedUserProfile: updatedProfileVar));
  }

  void onChangeIsFasting(bool isTimeRestrictedEating) async {
    final updatedProfileVar = state.updatedUserProfile!.copyWith(
      isTimeRestrictedEating: isTimeRestrictedEating,
    );
    await updateProfile(updatedProfileVar);
    // _enhancedEmit(state.copyWith(updatedUserProfile: updatedProfileVar));
  }

  void onChangeIsCoachAvailable(bool isAvailable) async {
    final updatedProfileVar = state.updatedCoachProfile!.copyWith(
      isActive: isAvailable,
    );
    await updateCoachProfile(updatedProfileVar);
    _enhancedEmit(state.copyWith(updatedCoachProfile: () => updatedProfileVar));
  }

  void onChangeBodybuildingCoachRole(bool isBodybuildingCoach) async {
    final currentRoles = Set<Role>.from(state.updatedUserProfile!.role);
    isBodybuildingCoach
        ? currentRoles.add(Role.bodybuildingCoach)
        : currentRoles.remove(Role.bodybuildingCoach);
    final updatedProfileVar = state.updatedUserProfile!.copyWith(
      role: currentRoles.toList(),
    );
    // await _coachRepository.clearCacheCoachProfile();
    await updateProfile(updatedProfileVar);

    // _enhancedEmit(state.copyWith(updatedUserProfile: updatedProfileVar));
  }

  void logout() => // log out to get new access token
      _authenticationRepositry.logout();

  void onToggleReminderNotifications(
    NotiticationTexts notiticationTexts,
  ) async {
    final isEnable = await _profile.isNotificationReminderSettingEnabled;

    if (isEnable) {
      await _profile.toggleNotificationReminderSetting();
      await flutterLocalNotificationsPlugin.cancelAll();
      _enhancedEmit(
        state.copyWith(isReminderNotificationPermissionGranted: !isEnable),
      );
    } else {
      if (Platform.isAndroid) {
        final isNotificationsPermissionGranted =
            await flutterLocalNotificationsPlugin
                .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin
                >()
                ?.requestNotificationsPermission() ??
            false;

        final isExactAlarmsPermissionGranted =
            await flutterLocalNotificationsPlugin
                .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin
                >()
                ?.requestExactAlarmsPermission() ??
            false;
        if (isNotificationsPermissionGranted &&
            isExactAlarmsPermissionGranted) {
          await _scheduleNotificationWithTextInput(notiticationTexts);
          await _profile.toggleNotificationReminderSetting();
          _enhancedEmit(
            state.copyWith(isReminderNotificationPermissionGranted: !isEnable),
          );
        }
      }
    }
  }

  Future<void> _scheduleNotificationWithTextInput(
    NotiticationTexts notiticationTexts,
  ) async {
    final AndroidNotificationAction replyAction = AndroidNotificationAction(
      'text_reply_id_scheduled', // Use a unique ID for scheduled notifications if needed
      'Reply',
      inputs: <AndroidNotificationActionInput>[
        AndroidNotificationActionInput(label: notiticationTexts.hint),
      ],
      showsUserInterface: true,
    );

    final AndroidNotificationDetails
    androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'input_channel_id', // Re-using the same channel ID as before or create a new one
      'Input Notifications',
      channelDescription: 'Notifications that allow text input',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      actions: <AndroidNotificationAction>[replyAction], // Add the action here
      icon: '@drawable/app_icon',
    );
    final NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    final String currentTimeZone =
        timezoneNames[DateTime.now().timeZoneOffset.inMilliseconds];
    // Example: schedule for 9am, 2pm, and 8pm
    final scheduledTimes = [
      _nextInstanceOfHour(9, currentTimeZone),
      _nextInstanceOfHour(14, currentTimeZone),
      _nextInstanceOfHour(20, currentTimeZone),
    ];
    for (tz.TZDateTime scheduledTime in scheduledTimes) {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        scheduledTimes.indexOf(
          scheduledTime,
        ), // Use a different Notification ID for scheduled notifications (e.g., 2 instead of 0)
        notiticationTexts.title, // Title
        notiticationTexts.body, // Body
        scheduledTime, // Schedule time using TZDateTime
        platformChannelSpecifics,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time, // <-- Repeat daily
        payload: 'scheduled_reply_notification', // Optional payload
      );
      debugPrint('Notification with text input scheduled for: $scheduledTime');
    }
  }

  // Helper to get the next occurrence of a specific hour (today or tomorrow)
  tz.TZDateTime _nextInstanceOfHour(int hour, String currentTimeZone) {
    final location = tz.getLocation(currentTimeZone);
    final now = tz.TZDateTime.now(location);
    var scheduled = tz.TZDateTime(location, now.year, now.month, now.day, hour);
    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }
    return scheduled;
  }

  void onChangeLanguage(Language? language) async {
    _enhancedEmit(
      state.copyWith(
        updatedUserProfile: () =>
            state.updatedUserProfile!.copyWith(language: language),
      ),
    );
  }

  void onChangeCoachBiography(String biography) async {
    _enhancedEmit(
      state.copyWith(
        updatedCoachProfile: () =>
            state.updatedCoachProfile!.copyWith(biography: biography),
      ),
    );
  }

  void updateCoachBiography() async {
    await updateCoachProfile(state.updatedCoachProfile!);
  }

  void updateLanguage() async {
    await updateProfile(state.updatedUserProfile!);
  }

  Future<void> updateProfile(UserProfile updatedProfile) async {
    if (state.userProfile == null) return;
    _enhancedEmit(
      state.copyWith(updatingProfileStatus: AsyncProcessingStatus.loading),
    );
    try {
      await _profile.updateProfile(updatedProfile);

      _enhancedEmit(
        state.copyWith(updatingProfileStatus: AsyncProcessingStatus.success),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          updatingProfileStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          updatingProfileStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  Future<void> updateCoachProfile(CoachProfile updatedCoachProfile) async {
    if (state.coachProfile == null) return;
    _enhancedEmit(
      state.copyWith(updateCoachProfileStatus: AsyncProcessingStatus.loading),
    );
    try {
      await _coachRepository.updateCoachProfile(updatedCoachProfile);

      _enhancedEmit(
        state.copyWith(updateCoachProfileStatus: AsyncProcessingStatus.success),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          updateCoachProfileStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          updateCoachProfileStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void readUserImageGallary() async {
    _enhancedEmit(
      state.copyWith(readUserImageGallaryStatus: AsyncProcessingStatus.loading),
    );

    try {
      final userImagesDetail = await _imageRepository
          .readUnarchivedUserImageGallary([
            GallaryTag.achievement,
            GallaryTag.certificate,
          ]);

      final filesDetail = <FileDetail>[];
      for (var imageDetail in userImagesDetail) {
        final result = await _imageRepository.readImage(imageDetail);

        filesDetail.add(result);
      }
      _enhancedEmit(
        state.copyWith(
          readUserImageGallaryStatus: AsyncProcessingStatus.success,
          filesData: userImagesDetail,
          filesDetail: filesDetail.toList(),
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          readUserImageGallaryStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          readUserImageGallaryStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void onEditImageComplete(
    Uint8List bytes,
    String fileName,
    GallaryTag tag,
    String? description, [
    DateTime? uploadDate,
  ]) async {
    final fileDetail = FileDetail(
      fileName: fileName,
      bytes: bytes,
      uploadDate: uploadDate,
    );
    final userImage = UserFile(
      gallaryTag: tag,
      imageGallaryFiles: [fileDetail],
      uploadDate: uploadDate,
      description: description,
    );
    _enhancedEmit(
      state.copyWith(addUserImageStatus: AsyncProcessingStatus.loading),
    );

    try {
      final userImagesDetail = await _imageRepository.addUserImages(userImage);
      // fetch image
      final fetchImageDetail = await _imageRepository.readImage(
        userImagesDetail.first,
      );
      // update state
      final fileDetail = List<FileDetail>.from(state.filesDetail);
      final filesData = List<FileData>.from(state.filesData);

      fileDetail.add(fetchImageDetail);
      filesData.addAll(userImagesDetail);
      _enhancedEmit(
        state.copyWith(
          addUserImageStatus: AsyncProcessingStatus.success,
          filesData: filesData,
          filesDetail: fileDetail,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          addUserImageStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          addUserImageStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void insertOrDeleteFromArchiveImageList(String? imageId) {
    if (imageId == null) return;
    final imagesId = List<String>.from(state.archiveImagesId);
    state.archiveImagesId.contains(imageId)
        ? imagesId.remove(imageId)
        : imagesId.add(imageId);
    _enhancedEmit(state.copyWith(archiveImagesId: imagesId));
  }

  void archiveImages() async {
    _enhancedEmit(
      state.copyWith(archivingImagesStatus: AsyncProcessingStatus.loading),
    );

    try {
      await _imageRepository.archiveUserImages(state.archiveImagesId);
      _enhancedEmit(
        state.copyWith(
          archivingImagesStatus: AsyncProcessingStatus.success,
          archiveImagesId: [],
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          archivingImagesStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          archivingImagesStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void readCoachPrograms() async {
    _enhancedEmit(
      state.copyWith(readingCoachProgram: AsyncProcessingStatus.loading),
    );

    try {
      await _coachRepository.readCoachPrograms();
      _enhancedEmit(
        state.copyWith(readingCoachProgram: AsyncProcessingStatus.success),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          readingCoachProgram: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          readingCoachProgram: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void onChangeCoachProgram(CoachProgram coachProgram) {
    _enhancedEmit(state.copyWith(cacheCoachProgram: () => coachProgram));
  }

  void upsertCoachProgram() async {
    assert(state.cacheCoachProgram != null);
    _enhancedEmit(
      state.copyWith(updatingCoachProgram: AsyncProcessingStatus.loading),
    );

    try {
      await _coachRepository.upsertCoachProgram(state.cacheCoachProgram!);

      _enhancedEmit(
        state.copyWith(
          cacheCoachProgram: null,
          updatingCoachProgram: AsyncProcessingStatus.success,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          updatingCoachProgram: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          updatingCoachProgram: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void deleteCoachProgram(String programId) async {
    _enhancedEmit(
      state.copyWith(deletingCoachProgram: AsyncProcessingStatus.loading),
    );

    try {
      await _coachRepository.deleteCoachProgram(programId);
      // updat the stream
      // read programs
      _enhancedEmit(
        state.copyWith(deletingCoachProgram: AsyncProcessingStatus.success),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          deletingCoachProgram: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          deletingCoachProgram: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void _enhancedEmit(ProfileState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}

class NotiticationTexts {
  final String title, body, hint;

  NotiticationTexts({
    required this.title,
    required this.body,
    required this.hint,
  });
}
