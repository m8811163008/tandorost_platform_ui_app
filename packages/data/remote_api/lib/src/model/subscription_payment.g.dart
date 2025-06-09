// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionPayment _$SubscriptionPaymentFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SubscriptionPayment',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'id',
            'user_id',
            'cafe_bazzar_order_id',
            'paid_amount',
            'discount_amount',
            'currency',
            'payment_method',
            'purchase_date',
            'subscription_type',
            'updated_at',
            'user_ai_request_limit_foods',
            'user_ai_requested_foods',
            'is_active',
          ],
        );
        final val = SubscriptionPayment(
          id: $checkedConvert('id', (v) => v as String?),
          userId: $checkedConvert('user_id', (v) => v as String),
          paidAmount: $checkedConvert(
            'paid_amount',
            (v) => (v as num).toDouble(),
          ),
          discountAmount: $checkedConvert(
            'discount_amount',
            (v) => (v as num).toDouble(),
          ),
          currency: $checkedConvert(
            'currency',
            (v) => $enumDecode(_$CurrencyEnumMap, v),
          ),
          paymentMethod: $checkedConvert(
            'payment_method',
            (v) => $enumDecode(_$PaymentMethodEnumMap, v),
          ),
          purchaseDate: $checkedConvert(
            'purchase_date',
            (v) => DateTime.parse(v as String),
          ),
          subscriptionType: $checkedConvert(
            'subscription_type',
            (v) => $enumDecode(_$SubscriptionTypeEnumMap, v),
          ),
          userAiRequestLimitFoods: $checkedConvert(
            'user_ai_request_limit_foods',
            (v) => (v as num?)?.toInt(),
          ),
          cafeBazzarOrderId: $checkedConvert(
            'cafe_bazzar_order_id',
            (v) => v as String?,
          ),
          updatedAt: $checkedConvert(
            'updated_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          isActive: $checkedConvert('is_active', (v) => v as bool? ?? false),
          userAiRequestedFoods: $checkedConvert(
            'user_ai_requested_foods',
            (v) => (v as num?)?.toInt() ?? 0,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'userId': 'user_id',
        'paidAmount': 'paid_amount',
        'discountAmount': 'discount_amount',
        'paymentMethod': 'payment_method',
        'purchaseDate': 'purchase_date',
        'subscriptionType': 'subscription_type',
        'userAiRequestLimitFoods': 'user_ai_request_limit_foods',
        'cafeBazzarOrderId': 'cafe_bazzar_order_id',
        'updatedAt': 'updated_at',
        'isActive': 'is_active',
        'userAiRequestedFoods': 'user_ai_requested_foods',
      },
    );

Map<String, dynamic> _$SubscriptionPaymentToJson(
  SubscriptionPayment instance,
) => <String, dynamic>{
  if (instance.id case final value?) 'id': value,
  'user_id': instance.userId,
  if (instance.cafeBazzarOrderId case final value?)
    'cafe_bazzar_order_id': value,
  'paid_amount': instance.paidAmount,
  'discount_amount': instance.discountAmount,
  'currency': _$CurrencyEnumMap[instance.currency]!,
  'payment_method': _$PaymentMethodEnumMap[instance.paymentMethod]!,
  'purchase_date': instance.purchaseDate.toIso8601String(),
  'subscription_type': _$SubscriptionTypeEnumMap[instance.subscriptionType]!,
  if (instance.updatedAt?.toIso8601String() case final value?)
    'updated_at': value,
};

const _$CurrencyEnumMap = {Currency.irRial: 'ir_rial'};

const _$PaymentMethodEnumMap = {
  PaymentMethod.inAppPaymentCafeBazzar: 'in_app_payment_cafe_bazzar',
  PaymentMethod.tandorostWebsite: 'tandorost_website',
};

const _$SubscriptionTypeEnumMap = {
  SubscriptionType.freeTier: 'free_tier',
  SubscriptionType.oneMonth: 'one_month',
  SubscriptionType.threeMonth: 'three_month',
};
