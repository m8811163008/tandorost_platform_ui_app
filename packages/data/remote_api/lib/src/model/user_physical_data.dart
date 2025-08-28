import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:remote_api/remote_api.dart';

part 'user_physical_data.g.dart';

@JsonSerializable()
class DoubleDataPoint extends Equatable {
  final String dataPointId;
  final double value;
  final DateTime createDate;

  DoubleDataPoint({
    required this.value,
    required this.createDate,
    required this.dataPointId,
  });

  @override
  List<Object?> get props => [dataPointId, value, createDate];
  Map<String, dynamic> toJson() => _$DoubleDataPointToJson(this);

  factory DoubleDataPoint.fromJson(Map<String, dynamic> json) =>
      _$DoubleDataPointFromJson(json);
}

@JsonSerializable()
class ActivityLevelDataPoint extends Equatable {
  final String dataPointId;
  final ActivityLevel value;
  final DateTime createDate;

  ActivityLevelDataPoint({
    required this.value,
    required this.createDate,
    required this.dataPointId,
  });

  @override
  List<Object?> get props => [dataPointId, value, createDate];
  Map<String, dynamic> toJson() => _$ActivityLevelDataPointToJson(this);

  factory ActivityLevelDataPoint.fromJson(Map<String, dynamic> json) =>
      _$ActivityLevelDataPointFromJson(json);
}

@JsonSerializable()
class UserPhysicalProfile extends Equatable {
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

  int get age {
    final now = DateTime.now();
    int years = now.year - birthday.year;
    if (now.month < birthday.month ||
        (now.month == birthday.month && now.day < birthday.day)) {
      years--;
    }
    return years;
  }

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
  Map<String, dynamic> toJson() => _$UserPhysicalProfileToJson(this);

  factory UserPhysicalProfile.fromJson(Map<String, dynamic> json) =>
      _$UserPhysicalProfileFromJson(json);
}
