import 'package:json_annotation/json_annotation.dart';

part 'nutrition_requirements.g.dart';

@JsonSerializable(createToJson: false)
class NutritionRequirement {
  final int fat;
  final int protein;
  final int carbohydrateFruitsOrNonStarchyVegetables;
  final int carbohydrateOther;
  final int effectiveTotalDailyEnergyExpenditure;

  NutritionRequirement({
    required this.fat,
    required this.protein,
    required this.carbohydrateFruitsOrNonStarchyVegetables,
    required this.carbohydrateOther,
    required this.effectiveTotalDailyEnergyExpenditure,
  });

  factory NutritionRequirement.fromJson(Map<String, dynamic> json) =>
      _$NutritionRequirementFromJson(json);
}

@JsonSerializable(createToJson: false)
class NutritionRequirements {
  final NutritionRequirement restDay;
  final NutritionRequirement trainingDay;

  NutritionRequirements({required this.restDay, required this.trainingDay});

  factory NutritionRequirements.fromJson(Map<String, dynamic> json) =>
      _$NutritionRequirementsFromJson(json);
}
