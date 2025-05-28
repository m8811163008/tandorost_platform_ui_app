import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:remote_api/src/model/activity_level.dart';
import 'package:remote_api/src/model/gender.dart';

part 'user_physical_data_upsert.g.dart';

// @JsonSerializable(createFactory: false) bug mentioned in https://github.com/google/json_serializable.dart/issues/1348
@JsonSerializable()
class UserPhysicalDataUpsert extends Equatable {
  const UserPhysicalDataUpsert({
    this.activityLevel,
    this.gender,
    this.birthday,
    this.height,
    this.weight,
    this.waistCircumference,
    this.armCircumference,
    this.chestCircumference,
    this.thighCircumference,
    this.calfMuscleCircumference,
    this.hipCircumference,
  });

  final ActivityLevel? activityLevel;
  final double? height;
  final DateTime? birthday;
  final Gender? gender;
  final double? weight;
  final double? waistCircumference;
  final double? armCircumference;
  final double? chestCircumference;
  final double? thighCircumference;
  final double? calfMuscleCircumference;
  final double? hipCircumference;

  Map<String, dynamic> toJson() => _$UserPhysicalDataUpsertToJson(this);

  UserPhysicalDataUpsert copyWith({
    ValueGetter<Gender?>? gender,
    ValueGetter<DateTime?>? birthday,
    ValueGetter<double?>? height,
    ValueGetter<double?>? weight,
    ValueGetter<double?>? waistCircumference,
    ValueGetter<double?>? armCircumference,
    ValueGetter<double?>? chestCircumference,
    ValueGetter<double?>? thighCircumference,
    ValueGetter<double?>? calfMuscleCircumference,
    ValueGetter<double?>? hipCircumference,
    ValueGetter<ActivityLevel?>? activityLevel,
  }) {
    return UserPhysicalDataUpsert(
      gender: gender != null ? gender() : this.gender,
      birthday: birthday != null ? birthday() : this.birthday,
      height: height != null ? height() : this.height,
      weight: weight != null ? weight() : this.weight,
      waistCircumference:
          waistCircumference != null
              ? waistCircumference()
              : this.waistCircumference,
      armCircumference:
          armCircumference != null ? armCircumference() : this.armCircumference,
      chestCircumference:
          chestCircumference != null
              ? chestCircumference()
              : this.chestCircumference,
      thighCircumference:
          thighCircumference != null
              ? thighCircumference()
              : this.thighCircumference,
      calfMuscleCircumference:
          calfMuscleCircumference != null
              ? calfMuscleCircumference()
              : this.calfMuscleCircumference,
      hipCircumference:
          hipCircumference != null ? hipCircumference() : this.hipCircumference,
      activityLevel:
          activityLevel != null ? activityLevel() : this.activityLevel,
    );
  }

  @override
  List<Object?> get props => [
    activityLevel,
    height,
    birthday,
    gender,
    weight,
    waistCircumference,
    armCircumference,
    chestCircumference,
    thighCircumference,
    calfMuscleCircumference,
    hipCircumference,
  ];
}
