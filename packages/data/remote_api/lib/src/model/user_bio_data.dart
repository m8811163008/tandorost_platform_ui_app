import 'package:json_annotation/json_annotation.dart';
import 'package:remote_api/remote_api.dart';

part 'user_bio_data.g.dart';

@JsonSerializable(createToJson: false)
class DoubleDataPoint {
  final String dataPointId;
  final double value;
  final DateTime createDate;

  DoubleDataPoint({
    required this.value,
    required this.createDate,
    required this.dataPointId,
  });

  factory DoubleDataPoint.fromJson(Map<String, dynamic> json) =>
      _$DoubleDataPointFromJson(json);
}

@JsonSerializable(createToJson: false)
class ActivityLevelDataPoint {
  final String dataPointId;
  final ActivityLevel value;
  final DateTime createDate;

  ActivityLevelDataPoint({
    required this.value,
    required this.createDate,
    required this.dataPointId,
  });

  factory ActivityLevelDataPoint.fromJson(Map<String, dynamic> json) =>
      _$ActivityLevelDataPointFromJson(json);
}

@JsonSerializable(createToJson: false)
class UserBioData {
  @JsonKey(name: '_id')
  final String id;
  final String userId;
  final Gender gender;
  final int age;
  final List<DoubleDataPoint> height;
  final List<DoubleDataPoint> weight;
  final List<DoubleDataPoint> waistCircumference;
  final List<DoubleDataPoint> armCircumference;
  final List<DoubleDataPoint> chestCircumference;
  final List<DoubleDataPoint> thighCircumference;
  final List<DoubleDataPoint> calfMuscleCircumference;
  final List<DoubleDataPoint> hipCircumference;
  final List<ActivityLevelDataPoint> activityLevel;

  UserBioData({
    required this.id,
    required this.userId,
    required this.gender,
    required this.age,
    required this.height,
    required this.weight,
    required this.waistCircumference,
    required this.armCircumference,
    required this.chestCircumference,
    required this.thighCircumference,
    required this.calfMuscleCircumference,
    required this.hipCircumference,
    required this.activityLevel,
  });

  factory UserBioData.fromJson(Map<String, dynamic> json) =>
      _$UserBioDataFromJson(json);
}
