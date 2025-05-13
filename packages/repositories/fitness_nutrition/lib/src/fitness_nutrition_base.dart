import 'package:remote_api/remote_api.dart';

class FitnessNutrition {
  final RemoteApi remoteApi;

  FitnessNutrition({required this.remoteApi});

  Future<UserBioData> userBioData() => remoteApi.userBioData();

  Future<void> deleteUserBioDataPoint({required String dataPointsId}) =>
      remoteApi.deleteUserBioDataPoint(dataPointsId: dataPointsId);

  Future<UserBioData> updateUserBioData(UserBioDataUpsert userBioDataUpsert) =>
      remoteApi.updateUserBioData(userBioDataUpsert);
}
