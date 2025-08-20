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
        '_id',
        'phone_number',
        'email',
        'address',
        'full_name',
        'language',
        'change_weight_speed',
        'is_time_restricted_eating',
      ],
    );
    final val = UserProfile(
      id: $checkedConvert('_id', (v) => v as String),
      phoneNumber: $checkedConvert('phone_number', (v) => v as String?),
      email: $checkedConvert('email', (v) => v as String?),
      address: $checkedConvert(
        'address',
        (v) => v == null ? null : Address.fromJson(v as Map<String, dynamic>),
      ),
      fullName: $checkedConvert('full_name', (v) => v as String?),
      language: $checkedConvert(
        'language',
        (v) => $enumDecode(_$LanguageEnumMap, v),
      ),
      changeWeightSpeed: $checkedConvert(
        'change_weight_speed',
        (v) => $enumDecode(_$ChangeWeightSpeedEnumMap, v),
      ),
      isTimeRestrictedEating: $checkedConvert(
        'is_time_restricted_eating',
        (v) => v as bool,
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'id': '_id',
    'phoneNumber': 'phone_number',
    'fullName': 'full_name',
    'changeWeightSpeed': 'change_weight_speed',
    'isTimeRestrictedEating': 'is_time_restricted_eating',
  },
);

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'phone_number': ?instance.phoneNumber,
      'email': ?instance.email,
      'address': ?instance.address?.toJson(),
      'full_name': ?instance.fullName,
      'language': _$LanguageEnumMap[instance.language]!,
      'change_weight_speed':
          _$ChangeWeightSpeedEnumMap[instance.changeWeightSpeed]!,
      'is_time_restricted_eating': instance.isTimeRestrictedEating,
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

const _$ChangeWeightSpeedEnumMap = {
  ChangeWeightSpeed.constant: 'constant',
  ChangeWeightSpeed.slowAndEasy: 'slow_and_easy',
  ChangeWeightSpeed.medium: 'medium',
  ChangeWeightSpeed.fast: 'fast',
  ChangeWeightSpeed.fastAndHard: 'fast_and_hard',
};
