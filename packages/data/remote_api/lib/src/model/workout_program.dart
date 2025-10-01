import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:remote_api/remote_api.dart';

part 'workout_program.g.dart';

// =======================================================================
// Section 1: Enumerations
// =======================================================================
@JsonEnum(fieldRename: FieldRename.snake)
enum FocusArea { arm, shoulder, chest, back, leg, buttocks, abdomen, fullBody }

@JsonEnum(fieldRename: FieldRename.snake)
enum ExerciseMetricType { repsOnly, percent1rmAndReps, timeBased }

// =======================================================================
// Section 2: Core "Library" Models (Referenced Documents)
// =======================================================================

@JsonSerializable(explicitToJson: true)
class ExerciseDefinition extends Equatable {
  final String? id;
  final String title;
  final String? videoUrl;
  final String? thumbImageUrl;
  final String? coverImageUrl;
  final List<String> preparationSteps;
  final List<String> executionSteps;
  final List<String> keyTips;
  final List<FocusArea> focusAreas;
  final ExerciseEquipment equipment;
  final ExerciseMetricType metricType;

  const ExerciseDefinition({
    this.id,
    required this.title,
    this.videoUrl,
    this.thumbImageUrl,
    this.coverImageUrl,
    required this.preparationSteps,
    required this.executionSteps,
    required this.keyTips,
    required this.focusAreas,
    required this.equipment,
    required this.metricType,
  });

  ExerciseDefinition copyWith({
    String? id,
    String? title,
    String? videoUrl,
    String? thumbImageUrl,
    String? coverImageUrl,
    List<String>? preparationSteps,
    List<String>? executionSteps,
    List<String>? keyTips,
    List<FocusArea>? focusAreas,
    ExerciseEquipment? equipment,
    ExerciseMetricType? metricType,
  }) {
    return ExerciseDefinition(
      id: id ?? this.id,
      title: title ?? this.title,
      videoUrl: videoUrl ?? this.videoUrl,
      thumbImageUrl: thumbImageUrl ?? this.thumbImageUrl,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      preparationSteps: preparationSteps ?? this.preparationSteps,
      executionSteps: executionSteps ?? this.executionSteps,
      keyTips: keyTips ?? this.keyTips,
      focusAreas: focusAreas ?? this.focusAreas,
      equipment: equipment ?? this.equipment,
      metricType: metricType ?? this.metricType,
    );
  }

  factory ExerciseDefinition.fromJson(Map<String, dynamic> json) =>
      _$ExerciseDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseDefinitionToJson(this);

  @override
  List<Object?> get props => [
    id,
    title,
    videoUrl,
    thumbImageUrl,
    coverImageUrl,
    preparationSteps,
    executionSteps,
    keyTips,
    focusAreas,
    equipment,
    metricType,
  ];
}

// =======================================================================
// Section 3: Program Structure (Embedded Documents)
// =======================================================================

@JsonSerializable()
class SetPrescription extends Equatable {
  SetPrescription({
    required this.restAfterSetSeconds,
    this.repetitions,
    this.durationSeconds,
    this.percent1rm,
    this.note,
  });
  final int? repetitions;
  final int? durationSeconds;
  @JsonKey(name: 'percent_1rm')
  final int? percent1rm;
  final String? note;

  final int restAfterSetSeconds;

  factory SetPrescription.fromJson(Map<String, dynamic> json) =>
      _$SetPrescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$SetPrescriptionToJson(this);

  @override
  List<Object?> get props => [
    repetitions,
    durationSeconds,
    percent1rm,
    note,
    restAfterSetSeconds,
  ];
  SetPrescription copyWith({
    ValueGetter<int?>? repetitions,
    ValueGetter<int?>? durationSeconds,
    ValueGetter<int?>? percent1rm,
    ValueGetter<String?>? note,
    int? restAfterSetSeconds,
  }) {
    return SetPrescription(
      repetitions: repetitions != null ? repetitions() : this.repetitions,
      durationSeconds: durationSeconds != null
          ? durationSeconds()
          : this.durationSeconds,
      percent1rm: percent1rm != null ? percent1rm() : this.percent1rm,
      note: note != null ? note() : this.note,
      restAfterSetSeconds: restAfterSetSeconds ?? this.restAfterSetSeconds,
    );
  }
}

@JsonSerializable(explicitToJson: true)
class PrescribedExercise extends Equatable {
  final String? exerciseDefinitionId;
  final String? note;
  final List<SetPrescription>? sets;
  final bool isRest;
  final int? restPeriod;

  const PrescribedExercise({
    this.exerciseDefinitionId,
    this.note,
    this.sets,
    this.isRest = false,
    this.restPeriod,
  });

  const PrescribedExercise.empty({
    this.exerciseDefinitionId = '',
    this.note = '',
    this.sets = const [],
    this.isRest = false,
    this.restPeriod,
  });

  factory PrescribedExercise.fromJson(Map<String, dynamic> json) =>
      _$PrescribedExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$PrescribedExerciseToJson(this);

  @override
  List<Object?> get props => [
    exerciseDefinitionId,
    note,
    sets,
    isRest,
    restPeriod,
  ];
  PrescribedExercise copyWith({
    ValueGetter<String?>? exerciseDefinitionId,
    ValueGetter<String?>? note,
    List<SetPrescription>? sets,
    bool? isRest,
    ValueGetter<int?>? restPeriod,
  }) {
    return PrescribedExercise(
      exerciseDefinitionId: exerciseDefinitionId != null
          ? exerciseDefinitionId()
          : this.exerciseDefinitionId,
      note: note != null ? note() : this.note,
      sets: sets ?? this.sets,
      isRest: isRest ?? this.isRest,
      restPeriod: restPeriod != null ? restPeriod() : this.restPeriod,
    );
  }
}

@JsonSerializable(explicitToJson: true)
class AthleteDay extends Equatable {
  final bool isRestDay;

  final List<PrescribedExercise>?
  activities; // PrescribedExercise or DurationPeriod

  const AthleteDay({this.isRestDay = true, this.activities});

  const AthleteDay.empty() : isRestDay = true, activities = const [];
  factory AthleteDay.from(AthleteDay other) {
    return AthleteDay(
      isRestDay: other.isRestDay,
      activities: other.activities != null
          ? List<PrescribedExercise>.from(other.activities!)
          : [],
    );
  }
  AthleteDay copyWith({bool? isRestDay, List<PrescribedExercise>? activities}) {
    return AthleteDay(
      isRestDay: isRestDay ?? this.isRestDay,
      activities: activities ?? this.activities,
    );
  }

  factory AthleteDay.fromJson(Map<String, dynamic> json) =>
      _$AthleteDayFromJson(json);

  Map<String, dynamic> toJson() => _$AthleteDayToJson(this);

  @override
  List<Object?> get props => [isRestDay, activities];
}

@JsonSerializable(explicitToJson: true)
class WorkoutProgram extends Equatable {
  final String? id;
  final String name;
  final String? description;
  final List<AthleteDay?> days;

  const WorkoutProgram({
    this.id,
    required this.name,
    this.description,
    required this.days,
  });

  WorkoutProgram.empty(
    int daysDuration, {
    this.id,
    this.name = '',
    this.description,
  }) : this.days = List.filled(daysDuration, null, growable: true);

  WorkoutProgram copyWith({
    String? id,
    String? name,
    String? description,
    List<AthleteDay?>? days,
  }) {
    return WorkoutProgram(
      id: id ?? this.id,
      name: name ?? this.name,

      description: description ?? this.description,
      days: days ?? this.days,
    );
  }

  factory WorkoutProgram.fromJson(Map<String, dynamic> json) =>
      _$WorkoutProgramFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutProgramToJson(this);

  @override
  List<Object?> get props => [id, name, description, days];
}

// =======================================================================
// Section 4: Linking and Logging Models (Referenced Documents)
// =======================================================================

@JsonSerializable()
class ExerciseLog extends Equatable {
  final String? id;
  final String traineeId;
  final String exerciseDefinitionId;
  final DateTime completedAt;
  final List<int>? durationSeconds;
  final List<int>? repetitions;
  final List<int?>? weightGrams;

  const ExerciseLog({
    this.id,
    required this.traineeId,
    required this.exerciseDefinitionId,
    required this.completedAt,
    this.durationSeconds,
    this.repetitions,
    this.weightGrams,
  });

  ExerciseLog copyWith({
    String? id,
    String? traineeId,
    String? exerciseDefinitionId,
    DateTime? completedAt,
    List<int>? durationSeconds,
    List<int>? repetitions,
    List<int?>? weightGrams,
  }) {
    return ExerciseLog(
      id: id ?? this.id,
      traineeId: traineeId ?? this.traineeId,
      exerciseDefinitionId: exerciseDefinitionId ?? this.exerciseDefinitionId,
      completedAt: completedAt ?? this.completedAt,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      repetitions: repetitions ?? this.repetitions,
      weightGrams: weightGrams ?? this.weightGrams,
    );
  }

  factory ExerciseLog.fromJson(Map<String, dynamic> json) =>
      _$ExerciseLogFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseLogToJson(this);

  @override
  List<Object?> get props => [
    id,
    traineeId,
    exerciseDefinitionId,
    completedAt,
    durationSeconds,
    repetitions,
    weightGrams,
  ];
}
