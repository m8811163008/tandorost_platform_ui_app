import 'package:json_annotation/json_annotation.dart';
import 'package:remote_api/remote_api.dart';

part 'food.g.dart';

@JsonSerializable()
class Food {
  @JsonKey(name: '_id')
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

  Food copyWith({
    String? id,
    String? userId,
    DateTime? upsertDate,
    Language? userLanguage,
    String? userNativeLanguageFoodName,
    String? translatedToEnglishFoodName,
    String? unitOfMeasurementNativeLanguage,
    String? translatedToEnglishUnitOfMeasurement,
    int? calculatedCalorie,
    int? quantityOfUnitOfMeasurement,
    CarbohydrateSourceLD? carbohydrateSource,
    MacroNutrition? macroNutrition,
  }) {
    return Food(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      upsertDate: upsertDate ?? this.upsertDate,
      userLanguage: userLanguage ?? this.userLanguage,
      userNativeLanguageFoodName:
          userNativeLanguageFoodName ?? this.userNativeLanguageFoodName,
      translatedToEnglishFoodName:
          translatedToEnglishFoodName ?? this.translatedToEnglishFoodName,
      unitOfMeasurementNativeLanguage: unitOfMeasurementNativeLanguage ??
          this.unitOfMeasurementNativeLanguage,
      translatedToEnglishUnitOfMeasurement:
          translatedToEnglishUnitOfMeasurement ??
              this.translatedToEnglishUnitOfMeasurement,
      calculatedCalorie: calculatedCalorie ?? this.calculatedCalorie,
      quantityOfUnitOfMeasurement:
          quantityOfUnitOfMeasurement ?? this.quantityOfUnitOfMeasurement,
      carbohydrateSource: carbohydrateSource ?? this.carbohydrateSource,
      macroNutrition: macroNutrition ?? this.macroNutrition,
    );
  }

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

  MacroNutrition copyWith({
    int? fat,
    int? carbohydrate,
    int? protein,
  }) {
    return MacroNutrition(
      fat: fat ?? this.fat,
      carbohydrate: carbohydrate ?? this.carbohydrate,
      protein: protein ?? this.protein,
    );
  }

  MacroNutrition({
    required this.fat,
    required this.carbohydrate,
    required this.protein,
  });

  factory MacroNutrition.fromJson(Map<String, dynamic> json) =>
      _$MacroNutritionFromJson(json);

  Map<String, dynamic> toJson() => _$MacroNutritionToJson(this);
}
