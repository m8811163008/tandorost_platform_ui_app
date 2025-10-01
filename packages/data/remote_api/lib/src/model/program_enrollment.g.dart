// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_enrollment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgramEnrollment _$ProgramEnrollmentFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ProgramEnrollment',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'id',
            'trainee_id',
            'coach_id',
            'workout_program_id',
            'coach_program_id',
            'enrollment_date',
          ],
        );
        final val = ProgramEnrollment(
          traineeId: $checkedConvert('trainee_id', (v) => v as String),
          coachId: $checkedConvert('coach_id', (v) => v as String),
          workoutProgramId: $checkedConvert(
            'workout_program_id',
            (v) => v as String,
          ),
          coachProgramId: $checkedConvert(
            'coach_program_id',
            (v) => v as String,
          ),
          enrollmentDate: $checkedConvert(
            'enrollment_date',
            (v) => DateTime.parse(v as String),
          ),
          id: $checkedConvert('id', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'traineeId': 'trainee_id',
        'coachId': 'coach_id',
        'workoutProgramId': 'workout_program_id',
        'coachProgramId': 'coach_program_id',
        'enrollmentDate': 'enrollment_date',
      },
    );

Map<String, dynamic> _$ProgramEnrollmentToJson(ProgramEnrollment instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'trainee_id': instance.traineeId,
      'coach_id': instance.coachId,
      'workout_program_id': instance.workoutProgramId,
      'coach_program_id': instance.coachProgramId,
      'enrollment_date': instance.enrollmentDate.toIso8601String(),
    };
