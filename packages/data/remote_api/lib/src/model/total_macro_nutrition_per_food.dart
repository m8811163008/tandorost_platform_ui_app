import 'package:json_annotation/json_annotation.dart';

part 'total_macro_nutrition_per_food.g.dart';

@JsonSerializable()
class TotalMacroNutritionPerFood {
  final double fat;
  final double carbohydrate;
  final double protein;

  TotalMacroNutritionPerFood({
    required this.fat,
    required this.carbohydrate,
    required this.protein,
  });

  factory TotalMacroNutritionPerFood.fromJson(Map<String, dynamic> json) =>
      _$TotalMacroNutritionPerFoodFromJson(json);

  Map<String, dynamic> toJson() => _$TotalMacroNutritionPerFoodToJson(this);
}