import 'package:json_annotation/json_annotation.dart';
import 'package:remote_api/remote_api.dart';
import 'package:remote_api/src/model/payment_status.dart';
import 'package:remote_api/src/utility/time_zone_converter.dart';
// import 'package:remote_api/src/model/enums.dart'; // Assume enums are here
// import 'package:remote_api/src/model/currency.dart'; // Assume Currency is here

part 'subscription_payment.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SubscriptionPayment {
  final String? id;

  // Renamed from userId to match Python 'subscriber_user_id'
  final String subscriberUserId;
  // Matches Python 'coach_user_id : str | None = None'
  final String? coachUserId;
  final String? programId;
  final String? cafeBazzarOrderId;

  // Matches Python 'payment_status : PaymentStatus = PaymentStatus.PENDING_SETTLE'
  @JsonKey(defaultValue: PaymentStatus.pendingSettle)
  final PaymentStatus paymentStatus;

  // Matches Python 'platform_settlement_month: datetime | None = None'
  @JsonKey(
    fromJson: dateTimeUtcFromJsonNullaware,
    toJson: dateTimeUtcToJsonNullaware,
  )
  final DateTime? platformSettlementMonth;

  final double paidAmount;
  final double discountAmount;
  final Currency currency;
  final PaymentMethod paymentMethod;

  // Matches Python 'purchase_date: datetime'
  @JsonKey(fromJson: dateTimeUtcFromJson, toJson: dateTimeUtcToJson)
  final DateTime purchaseDate;

  final SubscriptionType subscriptionType;

  // Matches Python 'updated_at: datetime | None = None'
  @JsonKey(
    fromJson: dateTimeUtcFromJsonNullaware,
    toJson: dateTimeUtcToJsonNullaware,
  )
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
    required this.subscriberUserId,
    this.coachUserId,
    this.programId,
    this.cafeBazzarOrderId,
    this.paymentStatus = PaymentStatus
        .pendingSettle, // Default kept for Dart model if field is missing
    this.platformSettlementMonth,
    required this.paidAmount,
    required this.discountAmount,
    required this.currency,
    required this.paymentMethod,
    required this.purchaseDate,
    required this.subscriptionType,
    this.updatedAt,
    this.userAiRequestLimitFoods, // Expected from server
    this.isActive = false, // Expected from server, with default for safety
    this.userAiRequestedFoods = 0,
  });

  factory SubscriptionPayment.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionPaymentFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionPaymentToJson(this);
}
