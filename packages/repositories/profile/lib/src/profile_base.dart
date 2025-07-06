import 'package:profile/src/storage_key.dart';
import 'package:remote_api/remote_api.dart';
import 'package:local_storage/local_storage.dart';
import 'package:rxdart/rxdart.dart';

class ProfileRepository {
  final RemoteApi remoteApi;
  final LocalStorage localStorage;
  final BehaviorSubject<Language> _controller;

  ProfileRepository({required this.remoteApi, required this.localStorage})
    : _controller = BehaviorSubject.seeded(Language.persian);

  Future<Language> userLanguage() => _controller.first;

  Future<Language> get userSpokenLanguage async {
    final language = await localStorage.read(StorageKey.userspokenLanguage);
    final String languageCode =
        language != null
            ? language[StorageKey.userspokenLanguage]
            : Language.persian.code;

    return Language.values.singleWhere((item) => item.code == languageCode);
  }

  Future<void> upsertUserSpokenLanguage(Language language) async {
    await localStorage.upsert(StorageKey.userspokenLanguage, {
      StorageKey.userspokenLanguage: language.code,
    });
  }

  Future<UserProfile> userProfile() async {
    final profile = await remoteApi.userProfile();
    _controller.add(profile.language);
    return profile;
  }

  Future<UserProfile> updateProfile(UserProfile updatedProfile) async {
    final profile = await remoteApi.updateProfile(updatedProfile);
    _controller.add(profile.language);
    return profile;
  }

  Future<void> visitedIntroductionRoute() async {
    await localStorage.upsert(StorageKey.visitedIntroductionRoute, {
      StorageKey.visitedIntroductionRoute: true,
    });
  }

  Future<bool> get isVisitedIntroductionRoute async {
    final result = await localStorage.read(StorageKey.visitedIntroductionRoute);
    if (result == null) return false;
    return result[StorageKey.visitedIntroductionRoute];
  }

  Future<void> toggleNotificationReminderSetting() async {
    await localStorage.upsert(StorageKey.notificationReminderSetting, {
      StorageKey.notificationReminderSetting:
          !(await isNotificationReminderSettingEnabled),
    });
  }

  Future<bool> get isNotificationReminderSettingEnabled async {
    final result = await localStorage.read(
      StorageKey.notificationReminderSetting,
    );
    if (result == null) return false;
    return result[StorageKey.notificationReminderSetting];
  }

  Future<void> reviewedBazzar() async {
    await localStorage.upsert(StorageKey.reviewedBazzar, {
      StorageKey.reviewedBazzar: true,
    });
  }

  Future<bool> get isReviewedBazzar async {
    final result = await localStorage.read(StorageKey.reviewedBazzar);
    if (result == null) return false;
    return result[StorageKey.reviewedBazzar];
  }

  Future<void> toggleIsShowAddHomeWidgetDialog() async {
    await localStorage.upsert(StorageKey.isShowAddHomeWidgetDialog, {
      StorageKey.isShowAddHomeWidgetDialog: true,
    });
  }

  Future<bool> get isShowAddHomeWidgetDialog async {
    final result = await localStorage.read(
      StorageKey.isShowAddHomeWidgetDialog,
    );
    if (result == null) return false;
    return result[StorageKey.isShowAddHomeWidgetDialog];
  }
}
