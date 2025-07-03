import 'dart:async';
import 'dart:io';

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
    this.flutterLocalNotificationsPlugin,
  ) : super(ProfileState()) {
    readProfile();
    readImageProfile();
    isReminderEnabled();
    tz.initializeTimeZones();
  }
  final ProfileRepository _profile;
  final ImageRepository _imageRepository;
  final PaymentRepository _paymentRepository;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

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
          profileImage: actualImage,
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
      final userImage = UserImage(
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
          profileImage: actualImage,
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
      final profile = await _profile.userProfile();
      _enhancedEmit(
        state.copyWith(
          name: profile.fullName,
          phoneNumber: profile.phoneNumber,
          changeWeightSpeed: profile.changeWeightSpeed,
          isTimeRestrictedEating: profile.isTimeRestrictedEating,
          userProfile: profile,
          language: profile.language,
        ),
      );
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

  void onChangeName(String name) async {
    _enhancedEmit(state.copyWith(name: name));
  }

  void updateName() async {
    await updateProfile(state.userProfile!.copyWith(fullName: state.name));
  }

  void onChangeWeightSpeed(ChangeWeightSpeed speed) async {
    await updateProfile(state.userProfile!.copyWith(changeWeightSpeed: speed));
    _enhancedEmit(state.copyWith(changeWeightSpeed: speed));
  }

  void onChangeIsFasting(bool isTimeRestrictedEating) async {
    await updateProfile(
      state.userProfile!.copyWith(
        isTimeRestrictedEating: isTimeRestrictedEating,
      ),
    );
    _enhancedEmit(
      state.copyWith(isTimeRestrictedEating: isTimeRestrictedEating),
    );
  }

  void onToggleReminderNotifications(bool _) async {
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
          await _scheduleNotificationWithTextInput();
          await _profile.toggleNotificationReminderSetting();
          _enhancedEmit(
            state.copyWith(isReminderNotificationPermissionGranted: !isEnable),
          );
        }
      }
    }
  }

  Future<void> _scheduleNotificationWithTextInput() async {
    final AndroidNotificationAction replyAction = AndroidNotificationAction(
      'text_reply_id_scheduled', // Use a unique ID for scheduled notifications if needed
      'Reply',
      inputs: <AndroidNotificationActionInput>[
        const AndroidNotificationActionInput(label: 'Type eaten foods'),
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
    var currentTehranTime = tz.getLocation('Asia/Tehran');
    final scheduledTime = tz.TZDateTime.now(
      currentTehranTime,
    ).add(const Duration(seconds: 20));
    // Example: schedule for 9am, 2pm, and 8pm
    final scheduledTimes = [
      scheduledTime,
      _nextInstanceOfHour(9, currentTimeZone),
      _nextInstanceOfHour(14, currentTimeZone),
      _nextInstanceOfHour(20, currentTimeZone),
    ];
    for (tz.TZDateTime scheduledTime in scheduledTimes) {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        scheduledTimes.indexOf(
          scheduledTime,
        ), // Use a different Notification ID for scheduled notifications (e.g., 2 instead of 0)
        'Scheduled Reply Notification', // Title
        'This notification with input will appear in 15 seconds!', // Body
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
    _enhancedEmit(state.copyWith(language: language));
  }

  void updateLanguage() async {
    await updateProfile(state.userProfile!.copyWith(language: state.language));
  }

  Future<void> updateProfile(UserProfile updatedProfile) async {
    if (state.userProfile == null) return;
    _enhancedEmit(
      state.copyWith(updatingProfileStatus: AsyncProcessingStatus.loading),
    );
    try {
      final profile = await _profile.updateProfile(updatedProfile);
      _enhancedEmit(state.copyWith(userProfile: profile));
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

  void _enhancedEmit(ProfileState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
