import 'package:json_annotation/json_annotation.dart';

part 'user_food_count.g.dart';

@JsonSerializable(createToJson: false)
class UserFoodCount {
  final int count;

  UserFoodCount({required this.count});

  factory UserFoodCount.fromJson(Map<String, dynamic> json) =>
      _$UserFoodCountFromJson(json);
}
