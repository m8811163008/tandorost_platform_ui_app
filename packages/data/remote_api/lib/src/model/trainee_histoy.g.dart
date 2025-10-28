// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainee_histoy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TraineeHistory _$TraineeHistoryFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'TraineeHistory',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const [
        'id',
        'user_id',
        'illness',
        'inguries',
        'disabilities',
        'sport_training_history',
        'current_practice_frequency_per_week',
        'excersice_goal',
        'coach_analysis',
        'daily_activity_desc',
        'coach_foods_instructions',
        'coach_supplements_instruction',
        'exercise_equipment',
        'supplements',
      ],
    );
    final val = TraineeHistory(
      id: $checkedConvert('id', (v) => v as String?),
      userId: $checkedConvert('user_id', (v) => v as String),
      illness: $checkedConvert('illness', (v) => v as String),
      inguries: $checkedConvert('inguries', (v) => v as String),
      disabilities: $checkedConvert('disabilities', (v) => v as String),
      sportTrainingHistory: $checkedConvert(
        'sport_training_history',
        (v) => v as String,
      ),
      currentPracticeFrequencyPerWeek: $checkedConvert(
        'current_practice_frequency_per_week',
        (v) => (v as num).toInt(),
      ),
      excersiceGoal: $checkedConvert(
        'excersice_goal',
        (v) => const ExcersiceGoalLinkedHashSetConverter().fromJson(v as List),
      ),
      exerciseEquipment: $checkedConvert(
        'exercise_equipment',
        (v) =>
            const ExerciseEquipmentLinkedHashSetConverter().fromJson(v as List),
      ),
      dailyActivityDesc: $checkedConvert(
        'daily_activity_desc',
        (v) => v as String?,
      ),
      supplements: $checkedConvert('supplements', (v) => v as String?),
      coachAnalysis: $checkedConvert('coach_analysis', (v) => v as String?),
      coachFoodsInstructions: $checkedConvert(
        'coach_foods_instructions',
        (v) => v as String?,
      ),
      coachSupplementsInstruction: $checkedConvert(
        'coach_supplements_instruction',
        (v) => v as String?,
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'userId': 'user_id',
    'sportTrainingHistory': 'sport_training_history',
    'currentPracticeFrequencyPerWeek': 'current_practice_frequency_per_week',
    'excersiceGoal': 'excersice_goal',
    'exerciseEquipment': 'exercise_equipment',
    'dailyActivityDesc': 'daily_activity_desc',
    'coachAnalysis': 'coach_analysis',
    'coachFoodsInstructions': 'coach_foods_instructions',
    'coachSupplementsInstruction': 'coach_supplements_instruction',
  },
);

Map<String, dynamic> _$TraineeHistoryToJson(TraineeHistory instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'user_id': instance.userId,
      'illness': instance.illness,
      'inguries': instance.inguries,
      'disabilities': instance.disabilities,
      'sport_training_history': instance.sportTrainingHistory,
      'current_practice_frequency_per_week':
          instance.currentPracticeFrequencyPerWeek,
      'excersice_goal': const ExcersiceGoalLinkedHashSetConverter().toJson(
        instance.excersiceGoal,
      ),
      'coach_analysis': ?instance.coachAnalysis,
      'daily_activity_desc': ?instance.dailyActivityDesc,
      'coach_foods_instructions': ?instance.coachFoodsInstructions,
      'coach_supplements_instruction': ?instance.coachSupplementsInstruction,
      'exercise_equipment': const ExerciseEquipmentLinkedHashSetConverter()
          .toJson(instance.exerciseEquipment),
      'supplements': ?instance.supplements,
    };

const _$ExcersiceGoalEnumMap = {
  ExcersiceGoal.loseWeight: 'lose_weight',
  ExcersiceGoal.power: 'power',
  ExcersiceGoal.strength: 'strength',
  ExcersiceGoal.endurance: 'endurance',
  ExcersiceGoal.hypertrophy: 'hypertrophy',
  ExcersiceGoal.prepareASportingEvent: 'prepare_a_sporting_event',
};

const _$ExerciseEquipmentEnumMap = {
  ExerciseEquipment.bodyWeight: 'body_weight',
  ExerciseEquipment.weightMachine: 'weight_machine',
  ExerciseEquipment.cableMachine: 'cable_machine',
  ExerciseEquipment.barbell: 'barbell',
  ExerciseEquipment.dumbbell: 'dumbbell',
  ExerciseEquipment.band: 'band',
  ExerciseEquipment.kettlebell: 'kettlebell',
  ExerciseEquipment.smith_machine: 'smith_machine',
};
