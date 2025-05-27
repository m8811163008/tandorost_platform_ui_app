import 'package:remote_api/remote_api.dart';

class FitnessNutrition {
  final RemoteApi remoteApi;

  FitnessNutrition({required this.remoteApi});

  Future<UserPhysicalProfile?> readUserPhysicalProfile() =>
      remoteApi.readUserPhysicalProfile();

  Future<void> deleteUserPhysicalDataPoint({required String dataPointsId}) =>
      remoteApi.deleteUserPhysicalDataPoint(dataPointsId: dataPointsId);

  Future<UserPhysicalProfile> updateUserPhysicalData(
    UserPhysicalDataUpsert userPhysicalDataUpsert,
  ) => remoteApi.updateUserPhysicalData(userPhysicalDataUpsert);

  Future<FitnessData?> readFitnessData() => remoteApi.readFitnessData();

  Future<NutritionRequirements?> readNutritionRequirements() =>
      remoteApi.readNutritionRequirements();
}
