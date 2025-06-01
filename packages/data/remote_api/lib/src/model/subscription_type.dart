import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum SubscriptionType { freeTier, oneMonth, threeMonth }

extension SubscriptionTypeX on SubscriptionType {
  Duration get duration => switch (this) {
    SubscriptionType.freeTier => Duration.zero,
    SubscriptionType.oneMonth => Duration(days: 31),
    SubscriptionType.threeMonth => Duration(days: 31 * 3),
  };
}
