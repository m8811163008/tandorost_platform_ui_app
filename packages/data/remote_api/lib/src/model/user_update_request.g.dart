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

Map<String, dynamic> _$UserUpdateRequestToJson(
  UserUpdateRequest instance,
) => <String, dynamic>{
  'phone_number': instance.phoneNumber,
  if (instance.address?.toJson() case final value?) 'address': value,
  if (instance.fullName case final value?) 'full_name': value,
  if (_$LanguageEnumMap[instance.language] case final value?) 'language': value,
};

const _$LanguageEnumMap = {
  Language.english: 'english',
  Language.chinese: 'chinese',
  Language.hindi: 'hindi',
  Language.spanish: 'spanish',
  Language.french: 'french',
  Language.arabic: 'arabic',
  Language.bengali: 'bengali',
  Language.russian: 'russian',
  Language.portuguese: 'portuguese',
  Language.urdu: 'urdu',
  Language.indonesian: 'indonesian',
  Language.german: 'german',
  Language.japanese: 'japanese',
  Language.marathi: 'marathi',
  Language.telugu: 'telugu',
  Language.turkish: 'turkish',
  Language.tamil: 'tamil',
  Language.vietnamese: 'vietnamese',
  Language.tagalog: 'tagalog',
  Language.korean: 'korean',
  Language.persian: 'persian',
  Language.hausa: 'hausa',
  Language.javanese: 'javanese',
  Language.italian: 'italian',
  Language.punjabi: 'punjabi',
  Language.kannada: 'kannada',
  Language.gujarati: 'gujarati',
  Language.thai: 'thai',
  Language.polish: 'polish',
  Language.ukrainian: 'ukrainian',
};
