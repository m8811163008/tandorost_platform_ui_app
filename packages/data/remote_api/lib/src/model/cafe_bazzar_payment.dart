import 'package:json_annotation/json_annotation.dart';

part 'cafe_bazzar_payment.g.dart';

@JsonSerializable(createToJson: false)
class CafeBazzarPaymentInfo {
  final String caffeBazzarRsa;

  final String caffeBazzarSubscriptionPlanOneMonthSdk;

  final String caffeBazzarSubscriptionPlanThreeMonthSdk;
  final String caffeBazzarSubscriptionPlanSixMonthSdk;

  @JsonKey(name: 'caffe_bazzar_purchase_plan_1')
  final String caffeBazzarPurchasePlan1;
  @JsonKey(name: 'caffe_bazzar_purchase_plan_2')
  final String caffeBazzarPurchasePlan2;
  @JsonKey(name: 'caffe_bazzar_purchase_plan_3')
  final String caffeBazzarPurchasePlan3;
  @JsonKey(name: 'caffe_bazzar_purchase_plan_4')
  final String caffeBazzarPurchasePlan4;
  @JsonKey(name: 'caffe_bazzar_purchase_plan_5')
  final String caffeBazzarPurchasePlan5;
  @JsonKey(name: 'caffe_bazzar_purchase_plan_6')
  final String caffeBazzarPurchasePlan6;
  @JsonKey(name: 'caffe_bazzar_purchase_plan_7')
  final String caffeBazzarPurchasePlan7;
  @JsonKey(name: 'caffe_bazzar_purchase_plan_8')
  final String caffeBazzarPurchasePlan8;
  @JsonKey(name: 'caffe_bazzar_purchase_plan_9')
  final String caffeBazzarPurchasePlan9;
  @JsonKey(name: 'caffe_bazzar_purchase_plan_10')
  final String caffeBazzarPurchasePlan10;
  @JsonKey(name: 'caffe_bazzar_purchase_plan_11')
  final String caffeBazzarPurchasePlan11;
  @JsonKey(name: 'caffe_bazzar_purchase_plan_12')
  final String caffeBazzarPurchasePlan12;
  @JsonKey(name: 'caffe_bazzar_purchase_plan_13')
  final String caffeBazzarPurchasePlan13;
  @JsonKey(name: 'caffe_bazzar_purchase_plan_14')
  final String caffeBazzarPurchasePlan14;
  @JsonKey(name: 'caffe_bazzar_purchase_plan_15')
  final String caffeBazzarPurchasePlan15;
  @JsonKey(name: 'caffe_bazzar_purchase_plan_16')
  final String caffeBazzarPurchasePlan16;
  @JsonKey(name: 'caffe_bazzar_purchase_plan_17')
  final String caffeBazzarPurchasePlan17;
  @JsonKey(name: 'caffe_bazzar_purchase_plan_18')
  final String caffeBazzarPurchasePlan18;
  @JsonKey(name: 'caffe_bazzar_purchase_plan_19')
  final String caffeBazzarPurchasePlan19;

  factory CafeBazzarPaymentInfo.fromJson(Map<String, dynamic> json) =>
      _$CafeBazzarPaymentInfoFromJson(json);

  CafeBazzarPaymentInfo({
    required this.caffeBazzarRsa,
    required this.caffeBazzarSubscriptionPlanOneMonthSdk,
    required this.caffeBazzarSubscriptionPlanThreeMonthSdk,
    required this.caffeBazzarSubscriptionPlanSixMonthSdk,
    required this.caffeBazzarPurchasePlan1,
    required this.caffeBazzarPurchasePlan2,
    required this.caffeBazzarPurchasePlan3,
    required this.caffeBazzarPurchasePlan4,
    required this.caffeBazzarPurchasePlan5,
    required this.caffeBazzarPurchasePlan6,
    required this.caffeBazzarPurchasePlan7,
    required this.caffeBazzarPurchasePlan8,
    required this.caffeBazzarPurchasePlan9,
    required this.caffeBazzarPurchasePlan10,
    required this.caffeBazzarPurchasePlan11,
    required this.caffeBazzarPurchasePlan12,
    required this.caffeBazzarPurchasePlan13,
    required this.caffeBazzarPurchasePlan14,
    required this.caffeBazzarPurchasePlan15,
    required this.caffeBazzarPurchasePlan16,
    required this.caffeBazzarPurchasePlan17,
    required this.caffeBazzarPurchasePlan18,
    required this.caffeBazzarPurchasePlan19,
  });
}
