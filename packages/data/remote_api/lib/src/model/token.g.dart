// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Token',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const ['id', 'user_id', 'access_token', 'token_type'],
    );
    final val = Token(
      id: $checkedConvert('id', (v) => v as String),
      userId: $checkedConvert('user_id', (v) => v as String),
      accessToken: $checkedConvert('access_token', (v) => v as String),
      tokenType: $checkedConvert('token_type', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'userId': 'user_id',
    'accessToken': 'access_token',
    'tokenType': 'token_type',
  },
);

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'access_token': instance.accessToken,
  'token_type': instance.tokenType,
};
