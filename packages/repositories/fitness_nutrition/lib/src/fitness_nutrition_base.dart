import 'package:fitness_nutrition/src/local_storage_keys.dart';
import 'package:local_storage/local_storage.dart';
import 'package:remote_api/remote_api.dart';
import 'package:rxdart/rxdart.dart';

class FitnessNutrition {
  final RemoteApi remoteApi;
  final LocalStorage localStorage;
  final BehaviorSubject<NutritionRequirements?>
  _nutritionRequirementsController = BehaviorSubject.seeded(null);

  final BehaviorSubject<UserPhysicalProfile?> _userPhysicalProfileController =
      BehaviorSubject.seeded(null);

  final BehaviorSubject<FitnessData?> _fitnessDataController =
      BehaviorSubject.seeded(null);

  FitnessNutrition({required this.remoteApi, required this.localStorage});

  Future<void> readUserPhysicalProfile() async {
    final userPhysicalProfile = await remoteApi.readUserPhysicalProfile();
    if (userPhysicalProfile != null) {
      _userPhysicalProfileController.add(userPhysicalProfile);
      localStorage.upsert(userPhysicalProfileKey, userPhysicalProfile.toJson());
    }
  }

  Future<void> deleteUserPhysicalDataPoint({required String dataPointsId}) =>
      remoteApi.deleteUserPhysicalDataPoint(dataPointsId: dataPointsId);

  Future<void> updateUserPhysicalData(
    UserPhysicalDataUpsert userPhysicalDataUpsert,
  ) async {
    final userPhysicalProfile = await remoteApi.updateUserPhysicalData(
      userPhysicalDataUpsert,
    );
    _userPhysicalProfileController.add(userPhysicalProfile);
    localStorage.upsert(userPhysicalProfileKey, userPhysicalProfile.toJson());
  }

  Stream<UserPhysicalProfile?> get userPhysicalProfileStream async* {
    final userPhysicalProfileJson = await localStorage.read(
      userPhysicalProfileKey,
    );
    if (userPhysicalProfileJson != null) {
      yield UserPhysicalProfile.fromJson(userPhysicalProfileJson);
    }
    yield* _userPhysicalProfileController.stream.asBroadcastStream();
  }

  Future<void> readFitnessData() async {
    final fitnessData = await remoteApi.readFitnessData();
    if (fitnessData != null) {
      _fitnessDataController.add(fitnessData);
      localStorage.upsert(fitnessDataKey, fitnessData.toJson());
    }
  }

  Stream<FitnessData?> get readFitnessDataStream async* {
    final readFitnessDataJson = await localStorage.read(fitnessDataKey);
    if (readFitnessDataJson != null) {
      yield FitnessData.fromJson(readFitnessDataJson);
    }
    yield* _fitnessDataController.stream.asBroadcastStream();
  }

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

  Future<void> dispose() async {
    await _nutritionRequirementsController.close();
    await _userPhysicalProfileController.close();
  }
}
