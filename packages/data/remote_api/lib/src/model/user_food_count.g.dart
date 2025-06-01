// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_food_count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserFoodCount _$UserFoodCountFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UserFoodCount', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['count']);
      final val = UserFoodCount(
        count: $checkedConvert('count', (v) => (v as num).toInt()),
      );
      return val;
    });
