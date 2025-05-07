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
      allowedKeys: const ['_id', 'user_id', 'access_token', 'token_type'],
    );
    final val = Token(
      id: $checkedConvert('_id', (v) => v as String),
      userId: $checkedConvert('user_id', (v) => v as String),
      accessToken: $checkedConvert('access_token', (v) => v as String),
      tokenType: $checkedConvert('token_type', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'id': '_id',
    'userId': 'user_id',
    'accessToken': 'access_token',
    'tokenType': 'token_type',
  },
);
