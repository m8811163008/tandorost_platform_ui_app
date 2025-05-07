// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => $checkedCreate(
  'UserProfile',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const [
        'id',
        'phone_number',
        'address',
        'full_name',
        'language',
      ],
    );
    final val = UserProfile(
      id: $checkedConvert('id', (v) => v as String),
      phoneNumber: $checkedConvert('phone_number', (v) => v as String),
      address: $checkedConvert(
        'address',
        (v) => v == null ? null : Address.fromJson(v as Map<String, dynamic>),
      ),
      fullName: $checkedConvert('full_name', (v) => v as String?),
      language: $checkedConvert('language', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'phoneNumber': 'phone_number', 'fullName': 'full_name'},
);

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone_number': instance.phoneNumber,
      'address': instance.address?.toJson(),
      'full_name': instance.fullName,
      'language': instance.language,
    };
