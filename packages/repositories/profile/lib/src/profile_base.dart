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

  Future<Language>  userLanguage() => _controller.first;

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
}
