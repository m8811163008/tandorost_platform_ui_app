// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserUpdateRequest _$UserUpdateRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'UserUpdateRequest',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const ['phone_number', 'address', 'full_name', 'language'],
    );
    final val = UserUpdateRequest(
      phoneNumber: $checkedConvert('phone_number', (v) => v as String),
      address: $checkedConvert(
        'address',
        (v) => v == null ? null : Address.fromJson(v as Map<String, dynamic>),
      ),
      fullName: $checkedConvert('full_name', (v) => v as String?),
      language: $checkedConvert(
        'language',
        (v) => $enumDecodeNullable(_$LanguageEnumMap, v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'phoneNumber': 'phone_number', 'fullName': 'full_name'},
);

Map<String, dynamic> _$UserUpdateRequestToJson(UserUpdateRequest instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
      'address': ?instance.address?.toJson(),
      'full_name': ?instance.fullName,
      'language': ?_$LanguageEnumMap[instance.language],
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
