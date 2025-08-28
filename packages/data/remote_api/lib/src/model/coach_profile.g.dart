// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coach_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoachProfile _$CoachProfileFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CoachProfile',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['id', 'user_id', 'biography', 'is_active'],
        );
        final val = CoachProfile(
          id: $checkedConvert('id', (v) => v as String?),
          userId: $checkedConvert('user_id', (v) => v as String),
          biography: $checkedConvert('biography', (v) => v as String),
          isActive: $checkedConvert('is_active', (v) => v as bool),
        );
        return val;
      },
      fieldKeyMap: const {'userId': 'user_id', 'isActive': 'is_active'},
    );

Map<String, dynamic> _$CoachProfileToJson(CoachProfile instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'user_id': instance.userId,
      'biography': instance.biography,
      'is_active': instance.isActive,
    };
