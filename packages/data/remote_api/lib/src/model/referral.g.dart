// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Referral _$ReferralFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Referral',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const [
        'id',
        'inviter_id',
        'invited_contact',
        'referral_value',
        'referral_benefit',
        'status',
        'invited_user_id',
        'created_at',
        'updated_at',
      ],
    );
    final val = Referral(
      inviterId: $checkedConvert('inviter_id', (v) => v as String),
      invitedContact: $checkedConvert('invited_contact', (v) => v as String),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => DateTime.parse(v as String),
      ),
      id: $checkedConvert('id', (v) => v as String?),
      referralValue: $checkedConvert('referral_value', (v) => v as String?),
      referralBenefit: $checkedConvert('referral_benefit', (v) => v as String?),
      status: $checkedConvert(
        'status',
        (v) => $enumDecodeNullable(_$ReferralStatusEnumMap, v),
      ),
      invitedUserId: $checkedConvert('invited_user_id', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'inviterId': 'inviter_id',
    'invitedContact': 'invited_contact',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
    'referralValue': 'referral_value',
    'referralBenefit': 'referral_benefit',
    'invitedUserId': 'invited_user_id',
  },
);

Map<String, dynamic> _$ReferralToJson(Referral instance) => <String, dynamic>{
  'id': ?instance.id,
  'inviter_id': instance.inviterId,
  'invited_contact': instance.invitedContact,
  'referral_value': ?instance.referralValue,
  'referral_benefit': ?instance.referralBenefit,
  'status': ?_$ReferralStatusEnumMap[instance.status],
  'invited_user_id': ?instance.invitedUserId,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

const _$ReferralStatusEnumMap = {
  ReferralStatus.pending: 'pending',
  ReferralStatus.claimed: 'claimed',
  ReferralStatus.expired: 'expired',
};
