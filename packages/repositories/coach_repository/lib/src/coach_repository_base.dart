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

  Stream<CoachProfile?> get coachProfileStream async* {
    yield* _coachStreamController.stream.asBroadcastStream();
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

  Future<List<CoachProgram>> readCoachPrograms() =>
      remoteApi.readCoachPrograms();

  Future<List<CoachProfile>> readCoaches() => remoteApi.readCoaches();
  Future<List<UserProfile>> readCoachesProfiles() =>
      remoteApi.readCoachesProfiles();
  Future<List<CoachProgram>> readCoachProgramsById(String coachId) =>
      remoteApi.readCoachProgramsById(coachId);
  Future<List<FileData>> readCoachImages(String coachId) =>
      remoteApi.readCoachImages(coachId);

  Future<List<ProgramEnrollment>?> readEnrollments({
    String? coachId,
    String? traineeId,
  }) => remoteApi.readEnrollments(coachId: coachId, traineeId: traineeId);
  Future<ProgramEnrollment> upsertEnrollment(
    ProgramEnrollment programEnrollment,
  ) => remoteApi.upsertEnrollment(programEnrollment);
  Future<List<UserProfile>> readCoachAthletesProfile() =>
      remoteApi.readCoachAthletesProfile();

  Future<WorkoutProgram> upsertWorkoutProgram({
    required WorkoutProgram workoutProgram,
  }) => remoteApi.upsertWorkoutProgram(workoutProgram: workoutProgram);

  Future<WorkoutProgram?> readWorkoutProgram({required String workoutId}) =>
      remoteApi.readWorkoutProgram(workoutId: workoutId);

  Future<List<ExerciseDefinition>> readExerciseDefinition() =>
      remoteApi.readExerciseDefinition();

  Future<List<UserProfile>> readCoachProfiles() => remoteApi.readCoachProfiles();
}
