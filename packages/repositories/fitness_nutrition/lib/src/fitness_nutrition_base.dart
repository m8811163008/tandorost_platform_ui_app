import 'package:fitness_nutrition/src/local_storage_keys.dart';
import 'package:local_storage/local_storage.dart';
import 'package:remote_api/remote_api.dart';
import 'package:rxdart/rxdart.dart';

class FitnessNutrition {
  final RemoteApi remoteApi;
  final LocalStorage localStorage;
  final BehaviorSubject<NutritionRequirements?>
  _nutritionRequirementsController = BehaviorSubject.seeded(null);

  FitnessNutrition({required this.remoteApi, required this.localStorage});

  Future<UserPhysicalProfile?> readUserPhysicalProfile() =>
      remoteApi.readUserPhysicalProfile();

  Future<void> deleteUserPhysicalDataPoint({required String dataPointsId}) =>
      remoteApi.deleteUserPhysicalDataPoint(dataPointsId: dataPointsId);

  Future<UserPhysicalProfile> updateUserPhysicalData(
    UserPhysicalDataUpsert userPhysicalDataUpsert,
  ) => remoteApi.updateUserPhysicalData(userPhysicalDataUpsert);

  Future<FitnessData?> readFitnessData() => remoteApi.readFitnessData();

  Future<void> readNutritionRequirements() async {
    // add to stream after fetching data
    // save to storage after fetching data
    //
    final nutritionRequirements = await remoteApi.readNutritionRequirements();
    if (nutritionRequirements != null) {
      _nutritionRequirementsController.add(nutritionRequirements);
      localStorage.upsert(
        nutritionRequirementsKey,
        nutritionRequirements.toJson(),
      );
    }
  }

  Stream<NutritionRequirements?> get nutritionRequirementsStream async* {
    final nutritionRequirementsJson = await localStorage.read(
      nutritionRequirementsKey,
    );
    if (nutritionRequirementsJson != null) {
      yield NutritionRequirements.fromJson(nutritionRequirementsJson);
    }
    yield* _nutritionRequirementsController.stream.asBroadcastStream();
  }

  Future<void> dispose() => _nutritionRequirementsController.close();
}
