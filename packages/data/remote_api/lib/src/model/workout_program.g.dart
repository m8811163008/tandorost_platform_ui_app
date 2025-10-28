// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_program.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseDefinition _$ExerciseDefinitionFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ExerciseDefinition',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'id',
            'title',
            'video_urls',
            'cover_image_url',
            'preparation_steps',
            'execution_steps',
            'key_tips',
            'focus_areas',
            'equipment',
            'metric_type',
          ],
        );
        final val = ExerciseDefinition(
          id: $checkedConvert('id', (v) => v as String?),
          title: $checkedConvert('title', (v) => v as String),
          videoUrls: $checkedConvert(
            'video_urls',
            (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
          ),
          coverImageUrl: $checkedConvert(
            'cover_image_url',
            (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
          ),
          preparationSteps: $checkedConvert(
            'preparation_steps',
            (v) => (v as List<dynamic>).map((e) => e as String).toList(),
          ),
          executionSteps: $checkedConvert(
            'execution_steps',
            (v) => (v as List<dynamic>).map((e) => e as String).toList(),
          ),
          keyTips: $checkedConvert(
            'key_tips',
            (v) => (v as List<dynamic>).map((e) => e as String).toList(),
          ),
          focusAreas: $checkedConvert(
            'focus_areas',
            (v) => (v as List<dynamic>)
                .map((e) => $enumDecode(_$FocusAreaEnumMap, e))
                .toList(),
          ),
          equipment: $checkedConvert(
            'equipment',
            (v) => $enumDecode(_$ExerciseEquipmentEnumMap, v),
          ),
          metricType: $checkedConvert(
            'metric_type',
            (v) => $enumDecode(_$ExerciseMetricTypeEnumMap, v),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'videoUrls': 'video_urls',
        'coverImageUrl': 'cover_image_url',
        'preparationSteps': 'preparation_steps',
        'executionSteps': 'execution_steps',
        'keyTips': 'key_tips',
        'focusAreas': 'focus_areas',
        'metricType': 'metric_type',
      },
    );

Map<String, dynamic> _$ExerciseDefinitionToJson(ExerciseDefinition instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'title': instance.title,
      'video_urls': ?instance.videoUrls,
      'cover_image_url': ?instance.coverImageUrl,
      'preparation_steps': instance.preparationSteps,
      'execution_steps': instance.executionSteps,
      'key_tips': instance.keyTips,
      'focus_areas': instance.focusAreas
          .map((e) => _$FocusAreaEnumMap[e]!)
          .toList(),
      'equipment': _$ExerciseEquipmentEnumMap[instance.equipment]!,
      'metric_type': _$ExerciseMetricTypeEnumMap[instance.metricType]!,
    };

const _$FocusAreaEnumMap = {
  FocusArea.arm: 'arm',
  FocusArea.shoulder: 'shoulder',
  FocusArea.chest: 'chest',
  FocusArea.back: 'back',
  FocusArea.leg: 'leg',
  FocusArea.buttocks: 'buttocks',
  FocusArea.abdomen: 'abdomen',
  FocusArea.fullBody: 'full_body',
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

const _$ExerciseMetricTypeEnumMap = {
  ExerciseMetricType.repsOnly: 'reps_only',
  ExerciseMetricType.percent1rmAndReps: 'percent_1rm_and_reps',
  ExerciseMetricType.timeBased: 'time_based',
};

SetPrescription _$SetPrescriptionFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'SetPrescription',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const [
        'repetitions',
        'duration_seconds',
        'percent_1rm',
        'note',
        'rest_after_set_seconds',
      ],
    );
    final val = SetPrescription(
      restAfterSetSeconds: $checkedConvert(
        'rest_after_set_seconds',
        (v) => (v as num).toInt(),
      ),
      repetitions: $checkedConvert('repetitions', (v) => (v as num?)?.toInt()),
      durationSeconds: $checkedConvert(
        'duration_seconds',
        (v) => (v as num?)?.toInt(),
      ),
      percent1rm: $checkedConvert('percent_1rm', (v) => (v as num?)?.toInt()),
      note: $checkedConvert('note', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'restAfterSetSeconds': 'rest_after_set_seconds',
    'durationSeconds': 'duration_seconds',
    'percent1rm': 'percent_1rm',
  },
);

Map<String, dynamic> _$SetPrescriptionToJson(SetPrescription instance) =>
    <String, dynamic>{
      'repetitions': ?instance.repetitions,
      'duration_seconds': ?instance.durationSeconds,
      'percent_1rm': ?instance.percent1rm,
      'note': ?instance.note,
      'rest_after_set_seconds': instance.restAfterSetSeconds,
    };

PrescribedExercise _$PrescribedExerciseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PrescribedExercise',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['exercise_definition_id', 'note', 'sets'],
        );
        final val = PrescribedExercise(
          exerciseDefinitionId: $checkedConvert(
            'exercise_definition_id',
            (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
          ),
          note: $checkedConvert('note', (v) => v as String?),
          sets: $checkedConvert(
            'sets',
            (v) => (v as List<dynamic>?)
                ?.map(
                  (e) => e == null
                      ? null
                      : SetPrescription.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {'exerciseDefinitionId': 'exercise_definition_id'},
    );

Map<String, dynamic> _$PrescribedExerciseToJson(PrescribedExercise instance) =>
    <String, dynamic>{
      'exercise_definition_id': ?instance.exerciseDefinitionId,
      'note': ?instance.note,
      'sets': ?instance.sets?.map((e) => e?.toJson()).toList(),
    };

AthleteDay _$AthleteDayFromJson(Map<String, dynamic> json) => $checkedCreate(
  'AthleteDay',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const ['is_rest_day', 'is_done', 'activities'],
    );
    final val = AthleteDay(
      isRestDay: $checkedConvert('is_rest_day', (v) => v as bool),
      activities: $checkedConvert(
        'activities',
        (v) => (v as List<dynamic>?)
            ?.map((e) => PrescribedExercise.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      isDone: $checkedConvert('is_done', (v) => v as bool? ?? false),
    );
    return val;
  },
  fieldKeyMap: const {'isRestDay': 'is_rest_day', 'isDone': 'is_done'},
);

Map<String, dynamic> _$AthleteDayToJson(AthleteDay instance) =>
    <String, dynamic>{
      'is_rest_day': instance.isRestDay,
      'is_done': instance.isDone,
      'activities': ?instance.activities?.map((e) => e.toJson()).toList(),
    };

WorkoutProgram _$WorkoutProgramFromJson(Map<String, dynamic> json) =>
    $checkedCreate('WorkoutProgram', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['id', 'name', 'description', 'days'],
      );
      final val = WorkoutProgram(
        id: $checkedConvert('id', (v) => v as String?),
        name: $checkedConvert('name', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String?),
        days: $checkedConvert(
          'days',
          (v) => (v as List<dynamic>)
              .map(
                (e) => e == null
                    ? null
                    : AthleteDay.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$WorkoutProgramToJson(WorkoutProgram instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'name': instance.name,
      'description': ?instance.description,
      'days': instance.days.map((e) => e?.toJson()).toList(),
    };

ExerciseLog _$ExerciseLogFromJson(Map<String, dynamic> json) => $checkedCreate(
  'ExerciseLog',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const [
        'id',
        'trainee_id',
        'exercise_definition_id',
        'completed_at',
        'duration_seconds',
        'repetitions',
        'weight_grams',
      ],
    );
    final val = ExerciseLog(
      id: $checkedConvert('id', (v) => v as String?),
      traineeId: $checkedConvert('trainee_id', (v) => v as String),
      exerciseDefinitionId: $checkedConvert(
        'exercise_definition_id',
        (v) => v as String,
      ),
      completedAt: $checkedConvert(
        'completed_at',
        (v) => DateTime.parse(v as String),
      ),
      durationSeconds: $checkedConvert(
        'duration_seconds',
        (v) => (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList(),
      ),
      repetitions: $checkedConvert(
        'repetitions',
        (v) => (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList(),
      ),
      weightGrams: $checkedConvert(
        'weight_grams',
        (v) => (v as List<dynamic>?)?.map((e) => (e as num?)?.toInt()).toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'traineeId': 'trainee_id',
    'exerciseDefinitionId': 'exercise_definition_id',
    'completedAt': 'completed_at',
    'durationSeconds': 'duration_seconds',
    'weightGrams': 'weight_grams',
  },
);

Map<String, dynamic> _$ExerciseLogToJson(ExerciseLog instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'trainee_id': instance.traineeId,
      'exercise_definition_id': instance.exerciseDefinitionId,
      'completed_at': instance.completedAt.toIso8601String(),
      'duration_seconds': ?instance.durationSeconds,
      'repetitions': ?instance.repetitions,
      'weight_grams': ?instance.weightGrams,
    };
