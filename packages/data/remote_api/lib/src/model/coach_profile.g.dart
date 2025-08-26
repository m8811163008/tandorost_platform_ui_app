// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coach_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoachProfile _$CoachProfileFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CoachProfile', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['biography', 'is_active']);
      final val = CoachProfile(
        biography: $checkedConvert('biography', (v) => v as String),
        isActive: $checkedConvert('is_active', (v) => v as bool),
      );
      return val;
    }, fieldKeyMap: const {'isActive': 'is_active'});

Map<String, dynamic> _$CoachProfileToJson(CoachProfile instance) =>
    <String, dynamic>{
      'biography': instance.biography,
      'is_active': instance.isActive,
    };
