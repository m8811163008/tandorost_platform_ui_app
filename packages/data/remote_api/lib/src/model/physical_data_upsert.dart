import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:remote_api/src/model/activity_level.dart';
import 'package:remote_api/src/model/gender.dart';

part 'physical_data_upsert.g.dart';

@JsonSerializable(createFactory: false)
class UserPhysicalDataUpsert extends Equatable {
  const UserPhysicalDataUpsert({
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
    this.activityLevel,
  });
  final Gender? gender;
  final DateTime? birthday;
  final double? height;
  final double? weight;
  final double? waistCircumference;
  final double? armCircumference;
  final double? chestCircumference;
  final double? thighCircumference;
  final double? calfMuscleCircumference;
  final double? hipCircumference;
  final ActivityLevel? activityLevel;

  Map<String, dynamic> toJson() => _$UserPhysicalDataUpsertToJson(this);

  @override
  List<Object?> get props => [
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
}
