// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bio_data_upsert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$UserBioDataUpsertToJson(
  UserBioDataUpsert instance,
) => <String, dynamic>{
  if (_$GenderEnumMap[instance.gender] case final value?) 'gender': value,
  if (instance.age case final value?) 'age': value,
  if (instance.height case final value?) 'height': value,
  if (instance.weight case final value?) 'weight': value,
  if (instance.waistCircumference case final value?)
    'waist_circumference': value,
  if (instance.armCircumference case final value?) 'arm_circumference': value,
  if (instance.chestCircumference case final value?)
    'chest_circumference': value,
  if (instance.thighCircumference case final value?)
    'thigh_circumference': value,
  if (instance.calfMuscleCircumference case final value?)
    'calf_muscle_circumference': value,
  if (instance.hipCircumference case final value?) 'hip_circumference': value,
  if (_$ActivityLevelEnumMap[instance.activityLevel] case final value?)
    'activity_level': value,
};

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.unknown: 'unknown',
};

const _$ActivityLevelEnumMap = {
  ActivityLevel.sedentary: 'sedentary',
  ActivityLevel.fairyActive: 'fairy_active',
  ActivityLevel.moderatelyActive: 'moderately_active',
  ActivityLevel.active: 'active',
  ActivityLevel.veryActive: 'very_active',
  ActivityLevel.other: 'other',
};
