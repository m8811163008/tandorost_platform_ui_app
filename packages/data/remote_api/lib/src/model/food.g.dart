// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Food _$FoodFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Food',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const [
        'id',
        'user_id',
        'upsert_date',
        'user_language',
        'user_native_language_food_name',
        'translated_to_english_food_name',
        'unit_of_measurement_native_language',
        'translated_to_english_unit_of_measurement',
        'calculated_calorie',
        'quantity_of_unit_of_measurement',
        'carbohydrate_source',
        'macro_nutrition',
      ],
    );
    final val = Food(
      id: $checkedConvert('id', (v) => v as String),
      userId: $checkedConvert('user_id', (v) => v as String),
      upsertDate: $checkedConvert(
        'upsert_date',
        (v) => DateTime.parse(v as String),
      ),
      userLanguage: $checkedConvert(
        'user_language',
        (v) => $enumDecode(_$LanguageEnumMap, v),
      ),
      userNativeLanguageFoodName: $checkedConvert(
        'user_native_language_food_name',
        (v) => v as String,
      ),
      translatedToEnglishFoodName: $checkedConvert(
        'translated_to_english_food_name',
        (v) => v as String,
      ),
      unitOfMeasurementNativeLanguage: $checkedConvert(
        'unit_of_measurement_native_language',
        (v) => v as String,
      ),
      translatedToEnglishUnitOfMeasurement: $checkedConvert(
        'translated_to_english_unit_of_measurement',
        (v) => v as String,
      ),
      calculatedCalorie: $checkedConvert(
        'calculated_calorie',
        (v) => (v as num).toInt(),
      ),
      quantityOfUnitOfMeasurement: $checkedConvert(
        'quantity_of_unit_of_measurement',
        (v) => (v as num).toInt(),
      ),
      carbohydrateSource: $checkedConvert(
        'carbohydrate_source',
        (v) => $enumDecode(_$CarbohydrateSourceLDEnumMap, v),
      ),
      macroNutrition: $checkedConvert(
        'macro_nutrition',
        (v) => MacroNutrition.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'userId': 'user_id',
    'upsertDate': 'upsert_date',
    'userLanguage': 'user_language',
    'userNativeLanguageFoodName': 'user_native_language_food_name',
    'translatedToEnglishFoodName': 'translated_to_english_food_name',
    'unitOfMeasurementNativeLanguage': 'unit_of_measurement_native_language',
    'translatedToEnglishUnitOfMeasurement':
        'translated_to_english_unit_of_measurement',
    'calculatedCalorie': 'calculated_calorie',
    'quantityOfUnitOfMeasurement': 'quantity_of_unit_of_measurement',
    'carbohydrateSource': 'carbohydrate_source',
    'macroNutrition': 'macro_nutrition',
  },
);

Map<String, dynamic> _$FoodToJson(Food instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'upsert_date': instance.upsertDate.toIso8601String(),
  'user_language': _$LanguageEnumMap[instance.userLanguage]!,
  'user_native_language_food_name': instance.userNativeLanguageFoodName,
  'translated_to_english_food_name': instance.translatedToEnglishFoodName,
  'unit_of_measurement_native_language':
      instance.unitOfMeasurementNativeLanguage,
  'translated_to_english_unit_of_measurement':
      instance.translatedToEnglishUnitOfMeasurement,
  'calculated_calorie': instance.calculatedCalorie,
  'quantity_of_unit_of_measurement': instance.quantityOfUnitOfMeasurement,
  'carbohydrate_source':
      _$CarbohydrateSourceLDEnumMap[instance.carbohydrateSource]!,
  'macro_nutrition': instance.macroNutrition.toJson(),
};

const _$LanguageEnumMap = {
  Language.english: 'en',
  Language.chinese: 'zh',
  Language.hindi: 'hi',
  Language.spanish: 'es',
  Language.french: 'fr',
  Language.arabic: 'ar',
  Language.bengali: 'bn',
  Language.russian: 'ru',
  Language.portuguese: 'pt',
  Language.urdu: 'ur',
  Language.indonesian: 'id',
  Language.german: 'de',
  Language.japanese: 'ja',
  Language.marathi: 'mr',
  Language.telugu: 'te',
  Language.turkish: 'tr',
  Language.tamil: 'ta',
  Language.vietnamese: 'vi',
  Language.tagalog: 'tl',
  Language.korean: 'ko',
  Language.persian: 'fa',
  Language.hausa: 'ha',
  Language.javanese: 'jv',
  Language.italian: 'it',
  Language.punjabi: 'pa',
  Language.kannada: 'kn',
  Language.gujarati: 'gu',
  Language.thai: 'th',
  Language.polish: 'pl',
  Language.ukrainian: 'uk',
};

const _$CarbohydrateSourceLDEnumMap = {
  CarbohydrateSourceLD.fruitsOrNonStarchyVegetables:
      'fruits_or_non_starchy_vegetables',
  CarbohydrateSourceLD.others: 'others',
};

MacroNutrition _$MacroNutritionFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MacroNutrition', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['fat', 'carbohydrate', 'protein']);
      final val = MacroNutrition(
        fat: $checkedConvert('fat', (v) => (v as num).toInt()),
        carbohydrate: $checkedConvert(
          'carbohydrate',
          (v) => (v as num).toInt(),
        ),
        protein: $checkedConvert('protein', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$MacroNutritionToJson(MacroNutrition instance) =>
    <String, dynamic>{
      'fat': instance.fat,
      'carbohydrate': instance.carbohydrate,
      'protein': instance.protein,
    };
