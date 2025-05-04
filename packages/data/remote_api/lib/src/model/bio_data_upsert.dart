import 'package:json_annotation/json_annotation.dart';
import 'package:remote_api/src/model/activity_level.dart';
import 'package:remote_api/src/model/gender.dart';

part 'bio_data_upsert.g.dart';

@JsonSerializable(createFactory: false)
class UserBioDataUpsert {
  final Gender? gender;
  final int? age;
  final double? height;
  final double? weight;
  final double? waistCircumference;
  final double? armCircumference;
  final double? chestCircumference;
  final double? thighCircumference;
  final double? calfMuscleCircumference;
  final double? hipCircumference;
  final ActivityLevel? activityLevel;

  UserBioDataUpsert({
    this.gender,
    this.age,
    this.height,
    this.weight,
    this.waistCircumference,
    this.armCircumference,
    this.chestCircumference,
    this.thighCircumference,
    this.calfMuscleCircumference,
    this.hipCircumference,
    this.activityLevel,
  });

  Map<String, dynamic> toJson() => _$UserBioDataUpsertToJson(this);
}
