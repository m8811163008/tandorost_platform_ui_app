import 'package:json_annotation/json_annotation.dart';

part 'cafe_bazzar_payment.g.dart';

@JsonSerializable(createToJson: false)
class CafeBazzarPaymentInfo {
  final String caffeBazzarRsa;

  final String caffeBazzarSubscriptionPlanOneMonthSdk;

  final String caffeBazzarSubscriptionPlanThreeMonthSdk;
  final String caffeBazzarSubscriptionPlanSixMonthSdk;

  CafeBazzarPaymentInfo({
    required this.caffeBazzarRsa,
    required this.caffeBazzarSubscriptionPlanOneMonthSdk,
    required this.caffeBazzarSubscriptionPlanThreeMonthSdk,
    required this.caffeBazzarSubscriptionPlanSixMonthSdk,
  });

  factory CafeBazzarPaymentInfo.fromJson(Map<String, dynamic> json) =>
      _$CafeBazzarPaymentInfoFromJson(json);
}
