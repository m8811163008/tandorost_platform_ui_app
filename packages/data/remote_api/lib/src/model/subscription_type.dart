import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum SubscriptionType { freeTier, oneMonth, threeMonth, sixMonth }

extension SubscriptionTypeX on SubscriptionType {
  Duration get duration => switch (this) {
    SubscriptionType.freeTier => Duration.zero,
    SubscriptionType.oneMonth => Duration(days: 31),
    SubscriptionType.threeMonth => Duration(days: 31 * 3),
    SubscriptionType.sixMonth => Duration(days: 31 * 6),
  };
}
