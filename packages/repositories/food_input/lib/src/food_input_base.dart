import 'package:remote_api/remote_api.dart';

class FoodInputRepository {
  final RemoteApi remoteApi;

  FoodInputRepository({required this.remoteApi});

  Future<List<Food>> readFoodsNutritionsByText(String prompt) =>
      remoteApi.readFoodsNutritionsByText(prompt);

  Future<Food> updateFoodsNutritions(Food food) =>
      remoteApi.updateFoodsNutritions(food);

  Future<void> deleteFoodsNutritions(List<String> foodIds) =>
      remoteApi.deleteFoodsNutritions(foodIds);

  Future<List<Food>> readFoodsNutritionsByVoice({
    required FileDetail prompt,
    required Language userSpokenLanguage,
  }) => remoteApi.readFoodsNutritionsByVoice(
    prompt: prompt,
    userSpokenLanguage: userSpokenLanguage,
  );
}
