import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'nutrition_requirements.g.dart';

@JsonSerializable()
class NutritionRequirement extends Equatable {
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

  int get carbohydrateTotal =>
      carbohydrateFruitsOrNonStarchyVegetables + carbohydrateOther;

  factory NutritionRequirement.fromJson(Map<String, dynamic> json) =>
      _$NutritionRequirementFromJson(json);

  Map<String, dynamic> toJson() => _$NutritionRequirementToJson(this);

  @override
  List<Object?> get props => [
    fat,
    protein,
    carbohydrateFruitsOrNonStarchyVegetables,
    carbohydrateOther,
    effectiveTotalDailyEnergyExpenditure,
  ];
}

@JsonSerializable()
class NutritionRequirements extends Equatable {
  final NutritionRequirement restDay;
  final NutritionRequirement trainingDay;

  NutritionRequirements({required this.restDay, required this.trainingDay});

  factory NutritionRequirements.fromJson(Map<String, dynamic> json) =>
      _$NutritionRequirementsFromJson(json);

  Map<String, dynamic> toJson() => _$NutritionRequirementsToJson(this);

  @override
  List<Object?> get props => [restDay, trainingDay];
}
