import 'dart:async';

import 'package:remote_api/remote_api.dart';
import 'package:local_storage/local_storage.dart';

class AthleteRepository {
  final RemoteApi remoteApi;
  final LocalStorage localStorage;

  AthleteRepository({required this.remoteApi, required this.localStorage});

  Future<List<TraineeHistory>> readTraineeHistory(String traineeId) =>
      remoteApi.readTraineeHistory(traineeId);

  Future<TraineeHistory> upsertTraineeHistory(TraineeHistory traineeHistory) =>
      remoteApi.upsertTraineeHistory(traineeHistory);
}
