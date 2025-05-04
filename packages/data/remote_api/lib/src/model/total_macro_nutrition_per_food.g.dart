// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_macro_nutrition_per_food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TotalMacroNutritionPerFood _$TotalMacroNutritionPerFoodFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('TotalMacroNutritionPerFood', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['fat', 'carbohydrate', 'protein']);
  final val = TotalMacroNutritionPerFood(
    fat: $checkedConvert('fat', (v) => (v as num).toDouble()),
    carbohydrate: $checkedConvert('carbohydrate', (v) => (v as num).toDouble()),
    protein: $checkedConvert('protein', (v) => (v as num).toDouble()),
  );
  return val;
});

Map<String, dynamic> _$TotalMacroNutritionPerFoodToJson(
  TotalMacroNutritionPerFood instance,
) => <String, dynamic>{
  'fat': instance.fat,
  'carbohydrate': instance.carbohydrate,
  'protein': instance.protein,
};
