// TODO: Put public facing types in this file.

import 'dart:async';

import 'package:coach_repository/src/storage_key.dart';
import 'package:remote_api/remote_api.dart';
import 'package:local_storage/local_storage.dart';

/// Checks if you are awesome. Spoiler: you are.
class CoachRepository {
  final RemoteApi remoteApi;
  final LocalStorage localStorage;

  CoachRepository({required this.remoteApi, required this.localStorage});
  final StreamController<CoachProfile?> _coachStreamController =
      StreamController.broadcast();
  final StreamController<List<CoachProgram>> _coachProgramStreamController =
      StreamController.broadcast();

  Stream<CoachProfile?> get coachProfileStream async* {
    yield* _coachStreamController.stream.asBroadcastStream();
  }

  Stream<List<CoachProgram>> get coachProgramsStream async* {
    yield* _coachProgramStreamController.stream.asBroadcastStream();
  }

  Future<void> readCoachProfile() async {
    final cacheCoachProfile = await localStorage.read(coachProfileKey);
    if (cacheCoachProfile != null) {
      _coachStreamController.add(CoachProfile.fromJson(cacheCoachProfile));
    }
    final coachProfile = await remoteApi.readCoachProfile();
    _coachStreamController.add(coachProfile);
    await localStorage.upsert(coachProfileKey, coachProfile.toJson());
  }

  Future<void> updateCoachProfile(CoachProfile coachProfile) async {
    final profile = await remoteApi.updateCoachProfile(coachProfile);

    _coachStreamController.add(profile);
    await localStorage.upsert(coachProfileKey, profile.toJson());
  }

  Future<void> clearCacheCoachProfile() => localStorage.delete(coachProfileKey);

  Future<void> upsertCoachProgram(CoachProgram program) =>
      remoteApi.upsertCoachProgram(program);

  Future<void> deleteCoachProgram(String programId) =>
      remoteApi.deleteCoachProgram(programId);

  Future<void> readCoachPrograms() async {
    final cachedPrograms = await localStorage.read(coachProgramKey);
    if (cachedPrograms != null) {
      final programsList = cachedPrograms[coachProgramKey] as List;
      final List<CoachProgram> programs = [];
      for (final program in programsList) {
        programs.add(CoachProgram.fromJson(program as Map<String, dynamic>));
      }
      _coachProgramStreamController.add(programs);
    }
    final coachPrograms = await remoteApi.readCoachPrograms();
    _coachProgramStreamController.add(coachPrograms);

    final coachProgramListJson = <Map<String, dynamic>>[];
    for (final program in coachPrograms) {
      coachProgramListJson.add(program.toJson());
    }
    final coachProgramJson = {coachProgramKey: coachProgramListJson};
    await localStorage.upsert(coachProgramKey, coachProgramJson);
  }
}
