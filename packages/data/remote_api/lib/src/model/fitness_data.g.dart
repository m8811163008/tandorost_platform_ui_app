// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fitness_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FitnessData _$FitnessDataFromJson(Map<String, dynamic> json) => $checkedCreate(
  'FitnessData',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const [
        'resting_metabolic_rate',
        'total_daily_energy_expenditure',
        'bmi',
        'bmi_prime',
        'bmi_level',
        'waist_circumference_to_height_ratio',
        'is_waist_circumference_to_height_ratio_safe',
        'is_waist_circumference_safe_range',
      ],
    );
    final val = FitnessData(
      restingMetabolicRate: $checkedConvert(
        'resting_metabolic_rate',
        (v) => (v as num).toDouble(),
      ),
      totalDailyEnergyExpenditure: $checkedConvert(
        'total_daily_energy_expenditure',
        (v) => (v as num).toDouble(),
      ),
      bmi: $checkedConvert('bmi', (v) => (v as num).toDouble()),
      bmiPrime: $checkedConvert('bmi_prime', (v) => (v as num).toDouble()),
      bmiLevel: $checkedConvert(
        'bmi_level',
        (v) => $enumDecode(_$BmiLevelEnumMap, v),
      ),
      waistCircumferenceToHeightRatio: $checkedConvert(
        'waist_circumference_to_height_ratio',
        (v) => (v as num?)?.toDouble(),
      ),
      isWaistCircumferenceToHeightRatioSafe: $checkedConvert(
        'is_waist_circumference_to_height_ratio_safe',
        (v) => v as bool?,
      ),
      isWaistCircumferenceSafeRange: $checkedConvert(
        'is_waist_circumference_safe_range',
        (v) => v as bool?,
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'restingMetabolicRate': 'resting_metabolic_rate',
    'totalDailyEnergyExpenditure': 'total_daily_energy_expenditure',
    'bmiPrime': 'bmi_prime',
    'bmiLevel': 'bmi_level',
    'waistCircumferenceToHeightRatio': 'waist_circumference_to_height_ratio',
    'isWaistCircumferenceToHeightRatioSafe':
        'is_waist_circumference_to_height_ratio_safe',
    'isWaistCircumferenceSafeRange': 'is_waist_circumference_safe_range',
  },
);

const _$BmiLevelEnumMap = {
  BmiLevel.underWeight: 'under_weight',
  BmiLevel.healthyWeight: 'healthy_weight',
  BmiLevel.overWeight: 'over_weight',
  BmiLevel.obeseClassOne: 'obese_class_one',
  BmiLevel.obeseClassTwo: 'obese_class_two',
  BmiLevel.obeseClassThree: 'obese_class_three',
};
