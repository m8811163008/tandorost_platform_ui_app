import 'package:remote_api/remote_api.dart';

class FoodReport {
  final RemoteApi remoteApi;

  FoodReport({required this.remoteApi});

  Future<List<Food>> readFoodsNutrition(DateTime startDate, DateTime endDate) =>
      remoteApi.readFoodsNutrition(startDate, endDate);

  Future<Food> updateFoodsNutritions(Food food) =>
      remoteApi.updateFoodsNutritions(food);

  Future<void> deleteFoodsNutritions(List<String> foodIds) =>
      remoteApi.deleteFoodsNutritions(foodIds);
}
