import 'package:json_annotation/json_annotation.dart';
import 'package:remote_api/remote_api.dart';

part 'subscription_payment.g.dart';

@JsonSerializable()
class SubscriptionPayment {
  final String? id;
  final String userId;
  final String? cafeBazzarOrderId;
  final double paidAmount;
  final double discountAmount;
  final Currency currency;
  final PaymentMethod paymentMethod;
  final DateTime purchaseDate;
  final SubscriptionType subscriptionType;
  final DateTime? updatedAt;
  @JsonKey(includeToJson: false)
  final int? userAiRequestLimitFoods;
  @JsonKey(includeToJson: false)
  final int userAiRequestedFoods;
  @JsonKey(includeToJson: false)
  final bool isActive;

  DateTime get expireDate => purchaseDate.add(subscriptionType.duration);

  SubscriptionPayment({
    this.id,
    required this.userId,
    required this.paidAmount,
    required this.discountAmount,
    required this.currency,
    required this.paymentMethod,
    required this.purchaseDate,
    required this.subscriptionType,
    this.userAiRequestLimitFoods,
    this.cafeBazzarOrderId,
    this.updatedAt,
    this.isActive = false,
    this.userAiRequestedFoods = 0,
  });

  factory SubscriptionPayment.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionPaymentFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionPaymentToJson(this);
}
