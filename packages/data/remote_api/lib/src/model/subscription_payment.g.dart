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
            'program_id',
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
          programId: $checkedConvert('program_id', (v) => v as String?),
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
            (v) => dateTimeUtcFromJson(v as String),
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
            (v) => dateTimeUtcFromJsonNullaware(v as String?),
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
        'programId': 'program_id',
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
  'id': ?instance.id,
  'user_id': instance.userId,
  'program_id': ?instance.programId,
  'cafe_bazzar_order_id': ?instance.cafeBazzarOrderId,
  'paid_amount': instance.paidAmount,
  'discount_amount': instance.discountAmount,
  'currency': _$CurrencyEnumMap[instance.currency]!,
  'payment_method': _$PaymentMethodEnumMap[instance.paymentMethod]!,
  'purchase_date': dateTimeUtcToJson(instance.purchaseDate),
  'subscription_type': _$SubscriptionTypeEnumMap[instance.subscriptionType]!,
  'updated_at': ?dateTimeUtcToJsonNullaware(instance.updatedAt),
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
  SubscriptionType.sixMonth: 'six_month',
};
