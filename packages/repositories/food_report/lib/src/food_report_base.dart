import 'package:remote_api/remote_api.dart';

class FoodReport {
  final RemoteApi remoteApi;

  FoodReport({required this.remoteApi});

  Future<List<Food>> readFoodsNutrition(DateTime date1, DateTime date2) =>
      remoteApi.readFoodsNutrition(date1, date2);

  Future<Food> updateFoodsNutritions(Food food) =>
      remoteApi.updateFoodsNutritions(food);

  Future<void> deleteFoodsNutritions(List<String> foodIds) =>
      remoteApi.deleteFoodsNutritions(foodIds);
}
