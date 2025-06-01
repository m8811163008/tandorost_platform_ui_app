import 'package:json_annotation/json_annotation.dart';
import 'package:remote_api/remote_api.dart';

part 'subscription_payment.g.dart';

@JsonSerializable()
class SubscriptionPayment {
  final String? id;
  final String userId;
  final double paidAmount;
  final double discountAmount;
  final Currency currency;
  final PaymentMethod paymentMethod;
  final DateTime purchaseDate;
  final SubscriptionType subscriptionType;
  final DateTime? updatedAt;
  @JsonKey(includeToJson: false)
  final int userAiRequestLimitFoods;

  SubscriptionPayment({
    this.id,
    required this.userId,
    required this.paidAmount,
    required this.discountAmount,
    required this.currency,
    required this.paymentMethod,
    required this.purchaseDate,
    required this.subscriptionType,
    required this.userAiRequestLimitFoods,
    this.updatedAt,
  });

  factory SubscriptionPayment.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionPaymentFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionPaymentToJson(this);
}
