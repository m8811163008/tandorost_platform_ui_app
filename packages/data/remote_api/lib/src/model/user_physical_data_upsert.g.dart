// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_physical_data_upsert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPhysicalDataUpsert _$UserPhysicalDataUpsertFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'UserPhysicalDataUpsert',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const [
        'activity_level',
        'height',
        'birthday',
        'gender',
        'weight',
        'waist_circumference',
        'arm_circumference',
        'chest_circumference',
        'thigh_circumference',
        'calf_muscle_circumference',
        'hip_circumference',
      ],
    );
    final val = UserPhysicalDataUpsert(
      activityLevel: $checkedConvert(
        'activity_level',
        (v) => $enumDecodeNullable(_$ActivityLevelEnumMap, v),
      ),
      gender: $checkedConvert(
        'gender',
        (v) => $enumDecodeNullable(_$GenderEnumMap, v),
      ),
      birthday: $checkedConvert(
        'birthday',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      height: $checkedConvert('height', (v) => (v as num?)?.toDouble()),
      weight: $checkedConvert('weight', (v) => (v as num?)?.toDouble()),
      waistCircumference: $checkedConvert(
        'waist_circumference',
        (v) => (v as num?)?.toDouble(),
      ),
      armCircumference: $checkedConvert(
        'arm_circumference',
        (v) => (v as num?)?.toDouble(),
      ),
      chestCircumference: $checkedConvert(
        'chest_circumference',
        (v) => (v as num?)?.toDouble(),
      ),
      thighCircumference: $checkedConvert(
        'thigh_circumference',
        (v) => (v as num?)?.toDouble(),
      ),
      calfMuscleCircumference: $checkedConvert(
        'calf_muscle_circumference',
        (v) => (v as num?)?.toDouble(),
      ),
      hipCircumference: $checkedConvert(
        'hip_circumference',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'activityLevel': 'activity_level',
    'waistCircumference': 'waist_circumference',
    'armCircumference': 'arm_circumference',
    'chestCircumference': 'chest_circumference',
    'thighCircumference': 'thigh_circumference',
    'calfMuscleCircumference': 'calf_muscle_circumference',
    'hipCircumference': 'hip_circumference',
  },
);

Map<String, dynamic> _$UserPhysicalDataUpsertToJson(
  UserPhysicalDataUpsert instance,
) => <String, dynamic>{
  'activity_level': ?_$ActivityLevelEnumMap[instance.activityLevel],
  'height': ?instance.height,
  'birthday': ?instance.birthday?.toIso8601String(),
  'gender': ?_$GenderEnumMap[instance.gender],
  'weight': ?instance.weight,
  'waist_circumference': ?instance.waistCircumference,
  'arm_circumference': ?instance.armCircumference,
  'chest_circumference': ?instance.chestCircumference,
  'thigh_circumference': ?instance.thighCircumference,
  'calf_muscle_circumference': ?instance.calfMuscleCircumference,
  'hip_circumference': ?instance.hipCircumference,
};

const _$ActivityLevelEnumMap = {
  ActivityLevel.sedentary: 'sedentary',
  ActivityLevel.fairyActive: 'fairy_active',
  ActivityLevel.moderatelyActive: 'moderately_active',
  ActivityLevel.active: 'active',
  ActivityLevel.veryActive: 'very_active',
  ActivityLevel.other: 'other',
};

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.unknown: 'unknown',
};
