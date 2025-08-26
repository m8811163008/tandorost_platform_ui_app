// TODO: Put public facing types in this file.

import 'package:remote_api/remote_api.dart';

/// Checks if you are awesome. Spoiler: you are.
class CoachRepository {
  final RemoteApi remoteApi;

  CoachRepository({required this.remoteApi});

  Future<CoachProfile> readCoachProfile() => remoteApi.readCoachProfile();
  Future<CoachProfile> updateCoachProfile(CoachProfile coachProfile) =>
      remoteApi.updateCoachProfile(coachProfile);
  Future<CoachProgram> addCoachProgram(CoachProgram program) =>
      remoteApi.addCoachProgram(program);
  Future<void> deleteCoachProgram(String programId) =>
      remoteApi.deleteCoachProgram(programId);
  Future<List<CoachProgram>> readCoachPrograms() =>
      remoteApi.readCoachPrograms();
}
