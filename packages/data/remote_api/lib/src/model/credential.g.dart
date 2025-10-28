// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credential.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Credential _$CredentialFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Credential',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const [
        'grant_type',
        'username',
        'password',
        'scope',
        'client_id',
        'client_secret',
      ],
    );
    final val = Credential(
      grantType: $checkedConvert(
        'grant_type',
        (v) => v as String? ?? 'password',
      ),
      username: $checkedConvert('username', (v) => v as String),
      password: $checkedConvert('password', (v) => v as String),
      scope: $checkedConvert('scope', (v) => v as String? ?? ''),
      clientId: $checkedConvert('client_id', (v) => v as String? ?? ''),
      clientSecret: $checkedConvert('client_secret', (v) => v as String? ?? ''),
    );
    return val;
  },
  fieldKeyMap: const {
    'grantType': 'grant_type',
    'clientId': 'client_id',
    'clientSecret': 'client_secret',
  },
);

Map<String, dynamic> _$CredentialToJson(Credential instance) =>
    <String, dynamic>{
      'grant_type': instance.grantType,
      'username': instance.username,
      'password': instance.password,
      'scope': instance.scope,
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
    };
