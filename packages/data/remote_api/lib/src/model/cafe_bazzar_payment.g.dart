// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cafe_bazzar_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CafeBazzarPaymentInfo _$CafeBazzarPaymentInfoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'CafeBazzarPaymentInfo',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const [
        'caffe_bazzar_rsa',
        'caffe_bazzar_subscription_plan_one_month_sdk',
        'caffe_bazzar_subscription_plan_three_month_sdk',
        'caffe_bazzar_subscription_plan_six_month_sdk',
      ],
    );
    final val = CafeBazzarPaymentInfo(
      caffeBazzarRsa: $checkedConvert('caffe_bazzar_rsa', (v) => v as String),
      caffeBazzarSubscriptionPlanOneMonthSdk: $checkedConvert(
        'caffe_bazzar_subscription_plan_one_month_sdk',
        (v) => v as String,
      ),
      caffeBazzarSubscriptionPlanThreeMonthSdk: $checkedConvert(
        'caffe_bazzar_subscription_plan_three_month_sdk',
        (v) => v as String,
      ),
      caffeBazzarSubscriptionPlanSixMonthSdk: $checkedConvert(
        'caffe_bazzar_subscription_plan_six_month_sdk',
        (v) => v as String,
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'caffeBazzarRsa': 'caffe_bazzar_rsa',
    'caffeBazzarSubscriptionPlanOneMonthSdk':
        'caffe_bazzar_subscription_plan_one_month_sdk',
    'caffeBazzarSubscriptionPlanThreeMonthSdk':
        'caffe_bazzar_subscription_plan_three_month_sdk',
    'caffeBazzarSubscriptionPlanSixMonthSdk':
        'caffe_bazzar_subscription_plan_six_month_sdk',
  },
);
