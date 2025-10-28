import 'package:json_annotation/json_annotation.dart';
import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'trainee_histoy.g.dart';

@JsonSerializable()
class TraineeHistory extends Equatable {
  const TraineeHistory({
    this.id,
    required this.userId,
    required this.illness,
    required this.inguries,
    required this.disabilities,
    required this.sportTrainingHistory,
    required this.currentPracticeFrequencyPerWeek,
    required this.excersiceGoal,
    required this.exerciseEquipment,
    this.dailyActivityDesc,
    this.supplements,
    this.coachAnalysis,
    this.coachFoodsInstructions,
    this.coachSupplementsInstruction,
  });
  TraineeHistory.empty({
    this.id,
    this.userId = '',
    this.illness = '',
    this.inguries = '',
    this.disabilities = '',
    this.sportTrainingHistory = '',
    this.currentPracticeFrequencyPerWeek = 0,
    LinkedHashSet<ExcersiceGoal>? excersiceGoal,
    LinkedHashSet<ExerciseEquipment>? exerciseEquipment,
    this.dailyActivityDesc,
    this.supplements,
    this.coachAnalysis,
    this.coachFoodsInstructions,
    this.coachSupplementsInstruction,
  }) : this.excersiceGoal = excersiceGoal ?? LinkedHashSet<ExcersiceGoal>(),
       this.exerciseEquipment =
           exerciseEquipment ?? LinkedHashSet<ExerciseEquipment>();

  final String? id;
  final String userId;
  final String illness;
  final String inguries;
  final String disabilities;
  final String sportTrainingHistory;
  final int currentPracticeFrequencyPerWeek;
  @ExcersiceGoalLinkedHashSetConverter()
  final LinkedHashSet<ExcersiceGoal> excersiceGoal;
  final String? coachAnalysis;

  final String? dailyActivityDesc;
  final String? coachFoodsInstructions;
  final String? coachSupplementsInstruction;

  @ExerciseEquipmentLinkedHashSetConverter()
  final LinkedHashSet<ExerciseEquipment> exerciseEquipment;
  final String? supplements;

  TraineeHistory copyWith({
    String? id,
    String? userId,
    String? illness,
    String? inguries,
    String? disabilities,
    String? sportTrainingHistory,
    String? coachAnalysis,
    String? coachFoodsInstructions,
    String? coachSupplementsInstruction,
    int? currentPracticeFrequencyPerWeek,
    LinkedHashSet<ExcersiceGoal>? excersiceGoal,
    ValueGetter<String?>? dailyActivityDesc,
    LinkedHashSet<ExerciseEquipment>? exerciseEquipment,
    ValueGetter<String?>? supplements,
  }) {
    return TraineeHistory(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      illness: illness ?? this.illness,
      inguries: inguries ?? this.inguries,
      disabilities: disabilities ?? this.disabilities,
      coachAnalysis: coachAnalysis ?? this.coachAnalysis,
      coachFoodsInstructions:
          coachFoodsInstructions ?? this.coachFoodsInstructions,
      coachSupplementsInstruction:
          coachSupplementsInstruction ?? this.coachSupplementsInstruction,
      sportTrainingHistory: sportTrainingHistory ?? this.sportTrainingHistory,
      currentPracticeFrequencyPerWeek:
          currentPracticeFrequencyPerWeek ??
          this.currentPracticeFrequencyPerWeek,
      excersiceGoal: excersiceGoal ?? this.excersiceGoal,
      dailyActivityDesc: dailyActivityDesc != null
          ? dailyActivityDesc()
          : this.dailyActivityDesc,
      exerciseEquipment: exerciseEquipment ?? this.exerciseEquipment,
      supplements: supplements != null ? supplements() : this.supplements,
    );
  }

  @override
  List<Object?> get props => [
    id,
    userId,
    illness,
    inguries,
    disabilities,
    sportTrainingHistory,
    currentPracticeFrequencyPerWeek,
    excersiceGoal,
    dailyActivityDesc,
    exerciseEquipment,
    supplements,
    coachAnalysis,
    coachSupplementsInstruction,
    coachFoodsInstructions,
  ];
  Map<String, dynamic> toJson() => _$TraineeHistoryToJson(this);

  factory TraineeHistory.fromJson(Map<String, dynamic> json) =>
      _$TraineeHistoryFromJson(json);
}

@JsonEnum(fieldRename: FieldRename.snake, alwaysCreate: true)
enum ExcersiceGoal {
  loseWeight,
  power,
  strength,
  endurance,
  hypertrophy,
  prepareASportingEvent,
}

@JsonEnum(fieldRename: FieldRename.snake, alwaysCreate: true)
enum ExerciseEquipment {
  bodyWeight,
  weightMachine,
  cableMachine,
  barbell,
  dumbbell,
  band,
  kettlebell,
  smith_machine,
}

class ExerciseEquipmentLinkedHashSetConverter
    implements JsonConverter<LinkedHashSet<ExerciseEquipment>, List<dynamic>> {
  const ExerciseEquipmentLinkedHashSetConverter();

  @override
  LinkedHashSet<ExerciseEquipment> fromJson(List<dynamic> json) {
    return LinkedHashSet<ExerciseEquipment>.from(
      json.map((e) => $enumDecode(_$ExerciseEquipmentEnumMap, e)),
    );
  }

  @override
  List<String> toJson(LinkedHashSet<ExerciseEquipment> object) {
    return object.map((e) => _$ExerciseEquipmentEnumMap[e]!).toList();
  }
}

class ExcersiceGoalLinkedHashSetConverter
    implements JsonConverter<LinkedHashSet<ExcersiceGoal>, List<dynamic>> {
  const ExcersiceGoalLinkedHashSetConverter();

  @override
  LinkedHashSet<ExcersiceGoal> fromJson(List<dynamic> json) {
    return LinkedHashSet<ExcersiceGoal>.from(
      json.map((e) => $enumDecode(_$ExcersiceGoalEnumMap, e)),
    );
  }

  @override
  List<String> toJson(LinkedHashSet<ExcersiceGoal> object) {
    return object.map((e) => _$ExcersiceGoalEnumMap[e]!).toList();
  }
}
