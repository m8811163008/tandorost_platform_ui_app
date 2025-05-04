// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bio_data_upsert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$UserBioDataUpsertToJson(UserBioDataUpsert instance) =>
    <String, dynamic>{
      'gender': _$GenderEnumMap[instance.gender],
      'age': instance.age,
      'height': instance.height,
      'weight': instance.weight,
      'waist_circumference': instance.waistCircumference,
      'arm_circumference': instance.armCircumference,
      'chest_circumference': instance.chestCircumference,
      'thigh_circumference': instance.thighCircumference,
      'calf_muscle_circumference': instance.calfMuscleCircumference,
      'hip_circumference': instance.hipCircumference,
      'activity_level': _$ActivityLevelEnumMap[instance.activityLevel],
    };

const _$GenderEnumMap = {Gender.male: 'male', Gender.female: 'female'};

const _$ActivityLevelEnumMap = {
  ActivityLevel.sedentary: 'sedentary',
  ActivityLevel.fairyActive: 'fairyActive',
  ActivityLevel.moderatelyActive: 'moderatelyActive',
  ActivityLevel.active: 'active',
  ActivityLevel.veryActive: 'veryActive',
  ActivityLevel.other: 'other',
};
