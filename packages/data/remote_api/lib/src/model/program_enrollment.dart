import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';

part 'program_enrollment.g.dart';

@JsonSerializable()
class ProgramEnrollment extends Equatable {
  ProgramEnrollment({
    required this.traineeId,
    required this.coachId,
    required this.workoutProgramId,
    required this.coachProgramId,
    required this.traineeHistoryId,
    required this.enrollmentDate,
    this.id,
  });
  final String? id;
  final String traineeId;
  final String coachId;
  final String workoutProgramId;
  final String coachProgramId;
  final String traineeHistoryId;
  final DateTime enrollmentDate;

  ProgramEnrollment copyWith({
    ValueGetter<String?>? id,
    String? traineeId,
    String? coachId,
    String? coachProgramId,
    String? workoutProgramId,
    String? traineeHistoryId,
    DateTime? enrollmentDate,
  }) {
    return ProgramEnrollment(
      id: id != null ? id() : this.id,
      traineeId: traineeId ?? this.traineeId,
      coachId: coachId ?? this.coachId,
      coachProgramId: coachProgramId ?? this.coachProgramId,
      workoutProgramId: workoutProgramId ?? this.workoutProgramId,
      traineeHistoryId: traineeHistoryId ?? this.traineeHistoryId,
      enrollmentDate: enrollmentDate ?? this.enrollmentDate,
    );
  }

  Map<String, dynamic> toJson() => _$ProgramEnrollmentToJson(this);

  factory ProgramEnrollment.fromJson(Map<String, dynamic> json) =>
      _$ProgramEnrollmentFromJson(json);

  @override
  List<Object?> get props => [
    id,
    traineeId,
    coachId,
    workoutProgramId,
    coachProgramId,
    enrollmentDate,
    traineeHistoryId,
  ];
}
