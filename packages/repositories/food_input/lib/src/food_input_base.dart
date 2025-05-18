import 'package:remote_api/remote_api.dart';
import 'package:rxdart/rxdart.dart';

class FoodInputRepository {
  final RemoteApi remoteApi;

  FoodInputRepository({required this.remoteApi})
    : _cotroller = BehaviorSubject.seeded([]);
  final BehaviorSubject<List<Food>> _cotroller;

  Future<void> readFoodsNutritionsByText(String prompt) async {
    final result = await remoteApi.readFoodsNutritionsByText(prompt);
    _cotroller.add(result);
  }

  Future<void> updateFoodsNutritions(Food food) async {
    final updatedFood = await remoteApi.updateFoodsNutritions(food);
    final foods = _cotroller.value;
    final updatedFoods =
        foods.map((item) => item.id == updatedFood.id ? food : item).toList();
    _cotroller.add(updatedFoods);
  }

  Future<void> deleteFoodsNutritions(List<String> foodIds) async {
    await remoteApi.deleteFoodsNutritions(foodIds);
    final foods = _cotroller.value;
    foods.removeWhere((item) => foodIds.contains(item.id));
    _cotroller.add(foods);
  }

  Future<void> readFoodsNutritionsByVoice({
    required FileDetail prompt,
    required Language userSpokenLanguage,
  }) async {
    final result = await remoteApi.readFoodsNutritionsByVoice(
      prompt: prompt,
      userSpokenLanguage: userSpokenLanguage,
    );
    _cotroller.add(result);
  }

  Future<void> dispose() => _cotroller.close();
}
