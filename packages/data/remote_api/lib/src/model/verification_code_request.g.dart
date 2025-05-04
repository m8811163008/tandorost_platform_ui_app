// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_code_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerificationCodeRequest _$VerificationCodeRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'VerificationCodeRequest',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['phone_number', 'verification_type']);
    final val = VerificationCodeRequest(
      phoneNumber: $checkedConvert('phone_number', (v) => v as String),
      verificationType: $checkedConvert(
        'verification_type',
        (v) => $enumDecode(_$VerificationTypeEnumMap, v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'phoneNumber': 'phone_number',
    'verificationType': 'verification_type',
  },
);

Map<String, dynamic> _$VerificationCodeRequestToJson(
  VerificationCodeRequest instance,
) => <String, dynamic>{
  'phone_number': instance.phoneNumber,
  'verification_type': _$VerificationTypeEnumMap[instance.verificationType]!,
};

const _$VerificationTypeEnumMap = {
  VerificationType.register: 'register',
  VerificationType.forgotPassword: 'forgotPassword',
};
