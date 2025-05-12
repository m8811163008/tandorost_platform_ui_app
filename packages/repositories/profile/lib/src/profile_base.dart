import 'package:remote_api/remote_api.dart';
import 'package:rxdart/rxdart.dart';

class ProfileRepository {
  final RemoteApi remoteApi;
  final BehaviorSubject<Language> _controller;

  ProfileRepository({required this.remoteApi})
    : _controller = BehaviorSubject.seeded(Language.english);

  Stream<Language> get userLanguage async* {
    yield* _controller.stream.asBroadcastStream();
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
