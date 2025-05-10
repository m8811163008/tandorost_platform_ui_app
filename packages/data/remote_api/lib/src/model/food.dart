import 'package:json_annotation/json_annotation.dart';
import 'package:remote_api/remote_api.dart';

part 'food.g.dart';

@JsonSerializable()
class Food {
  final String id;

  final String userId;

  final DateTime upsertDate;

  final Language userLanguage;

  final String userNativeLanguageFoodName;

  final String translatedToEnglishFoodName;

  final String unitOfMeasurementNativeLanguage;

  final String translatedToEnglishUnitOfMeasurement;

  final int calculatedCalorie;

  final int quantityOfUnitOfMeasurement;

  final CarbohydrateSourceLD carbohydrateSource;

  final MacroNutrition macroNutrition;

  Food({
    required this.id,
    required this.userId,
    required this.upsertDate,
    required this.userLanguage,
    required this.userNativeLanguageFoodName,
    required this.translatedToEnglishFoodName,
    required this.unitOfMeasurementNativeLanguage,
    required this.translatedToEnglishUnitOfMeasurement,
    required this.calculatedCalorie,
    required this.quantityOfUnitOfMeasurement,
    required this.carbohydrateSource,
    required this.macroNutrition,
  });

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);

  Map<String, dynamic> toJson() => _$FoodToJson(this);
}

@JsonSerializable()
class MacroNutrition {
  final int fat;
  final int carbohydrate;
  final int protein;

  MacroNutrition({
    required this.fat,
    required this.carbohydrate,
    required this.protein,
  });

  factory MacroNutrition.fromJson(Map<String, dynamic> json) =>
      _$MacroNutritionFromJson(json);

  Map<String, dynamic> toJson() => _$MacroNutritionToJson(this);
}
