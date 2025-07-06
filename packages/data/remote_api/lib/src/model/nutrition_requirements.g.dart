// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_requirements.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NutritionRequirement _$NutritionRequirementFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'NutritionRequirement',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const [
        'fat',
        'protein',
        'carbohydrate_fruits_or_non_starchy_vegetables',
        'carbohydrate_other',
        'effective_total_daily_energy_expenditure',
      ],
    );
    final val = NutritionRequirement(
      fat: $checkedConvert('fat', (v) => (v as num).toInt()),
      protein: $checkedConvert('protein', (v) => (v as num).toInt()),
      carbohydrateFruitsOrNonStarchyVegetables: $checkedConvert(
        'carbohydrate_fruits_or_non_starchy_vegetables',
        (v) => (v as num).toInt(),
      ),
      carbohydrateOther: $checkedConvert(
        'carbohydrate_other',
        (v) => (v as num).toInt(),
      ),
      effectiveTotalDailyEnergyExpenditure: $checkedConvert(
        'effective_total_daily_energy_expenditure',
        (v) => (v as num).toInt(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'carbohydrateFruitsOrNonStarchyVegetables':
        'carbohydrate_fruits_or_non_starchy_vegetables',
    'carbohydrateOther': 'carbohydrate_other',
    'effectiveTotalDailyEnergyExpenditure':
        'effective_total_daily_energy_expenditure',
  },
);

Map<String, dynamic> _$NutritionRequirementToJson(
  NutritionRequirement instance,
) => <String, dynamic>{
  'fat': instance.fat,
  'protein': instance.protein,
  'carbohydrate_fruits_or_non_starchy_vegetables':
      instance.carbohydrateFruitsOrNonStarchyVegetables,
  'carbohydrate_other': instance.carbohydrateOther,
  'effective_total_daily_energy_expenditure':
      instance.effectiveTotalDailyEnergyExpenditure,
};

NutritionRequirements _$NutritionRequirementsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'NutritionRequirements',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['rest_day', 'training_day']);
    final val = NutritionRequirements(
      restDay: $checkedConvert(
        'rest_day',
        (v) => NutritionRequirement.fromJson(v as Map<String, dynamic>),
      ),
      trainingDay: $checkedConvert(
        'training_day',
        (v) => NutritionRequirement.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'restDay': 'rest_day', 'trainingDay': 'training_day'},
);

Map<String, dynamic> _$NutritionRequirementsToJson(
  NutritionRequirements instance,
) => <String, dynamic>{
  'rest_day': instance.restDay.toJson(),
  'training_day': instance.trainingDay.toJson(),
};
