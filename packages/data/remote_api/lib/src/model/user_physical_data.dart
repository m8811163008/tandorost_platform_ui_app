import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:remote_api/remote_api.dart';

part 'user_physical_data.g.dart';

@JsonSerializable(createToJson: false)
class DoubleDataPoint extends Equatable {
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

  @override
  List<Object?> get props => [dataPointId, value, createDate];
}

@JsonSerializable(createToJson: false)
class ActivityLevelDataPoint extends Equatable {
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

  @override
  List<Object?> get props => [dataPointId, value, createDate];
}

@JsonSerializable(createToJson: false)
class UserPhysicalProfile extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  final String userId;
  final Gender gender;
  final DateTime birthday;
  final List<DoubleDataPoint> height;
  final List<DoubleDataPoint> weight;
  final List<DoubleDataPoint> waistCircumference;
  final List<DoubleDataPoint> armCircumference;
  final List<DoubleDataPoint> chestCircumference;
  final List<DoubleDataPoint> thighCircumference;
  final List<DoubleDataPoint> calfMuscleCircumference;
  final List<DoubleDataPoint> hipCircumference;
  final List<ActivityLevelDataPoint> activityLevel;

  UserPhysicalProfile({
    required this.id,
    required this.userId,
    required this.gender,
    required this.birthday,
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


  factory UserPhysicalProfile.fromJson(Map<String, dynamic> json) =>
      _$UserPhysicalProfileFromJson(json);

  @override
  List<Object?> get props => [
    id,
    userId,
    gender,
    birthday,
    height,
    weight,
    waistCircumference,
    armCircumference,
    chestCircumference,
    thighCircumference,
    calfMuscleCircumference,
    hipCircumference,
    activityLevel,
  ];
}
