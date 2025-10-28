part of 'workout_view_cubit.dart';

@immutable
class WorkoutViewState extends Equatable {
  const WorkoutViewState({
    this.onReadWorkoutProgramStatus = AsyncProcessingStatus.inital,
    this.exercisesDefinition = const [],
    this.onReadExercisesDefinitionStatus = AsyncProcessingStatus.inital,
    this.workoutProgram = const [],
    this.onReadAthleteEnrollmentsStatus = AsyncProcessingStatus.inital,
    this.athleteEnrollments = const [],
    this.onReadAthelteProfileStatus = AsyncProcessingStatus.inital,
    this.athleteProfile,
    this.traineeHistories = const [],
    this.onReadTraineeHistoriesStatus = AsyncProcessingStatus.inital,
    this.onToggleIdDoneWorkoutStatus = AsyncProcessingStatus.inital,
    this.coachesUserProile = const [],
    this.onReadCoachesUserProfileStatus = AsyncProcessingStatus.inital,
  });
  final List<WorkoutProgram> workoutProgram;
  final AsyncProcessingStatus onReadWorkoutProgramStatus;
  final List<ExerciseDefinition> exercisesDefinition;
  final AsyncProcessingStatus onReadExercisesDefinitionStatus;
  final List<ProgramEnrollment> athleteEnrollments;
  final AsyncProcessingStatus onReadAthleteEnrollmentsStatus;
  final UserProfile? athleteProfile;
  final AsyncProcessingStatus onReadAthelteProfileStatus;
  final List<TraineeHistory> traineeHistories;
  final List<UserProfile> coachesUserProile;
  final AsyncProcessingStatus onReadTraineeHistoriesStatus;
  final AsyncProcessingStatus onToggleIdDoneWorkoutStatus;
  final AsyncProcessingStatus onReadCoachesUserProfileStatus;

  WorkoutViewState copyWith({
    List<WorkoutProgram>? workoutProgram,
    AsyncProcessingStatus? onReadWorkoutProgramStatus,
    List<ExerciseDefinition>? exercisesDefinition,
    AsyncProcessingStatus? onReadExercisesDefinitionStatus,
    List<ProgramEnrollment>? athleteEnrollments,
    AsyncProcessingStatus? onReadAthleteEnrollmentsStatus,
    ValueGetter<UserProfile?>? athleteProfile,
    AsyncProcessingStatus? onReadAthelteProfileStatus,
    List<TraineeHistory>? traineeHistories,
    AsyncProcessingStatus? onReadTraineeHistoriesStatus,
    AsyncProcessingStatus? onToggleIdDoneWorkoutStatus,
    List<UserProfile>? coachesUserProile,
    AsyncProcessingStatus? onReadCoachesUserProfileStatus,
  }) {
    return WorkoutViewState(
      workoutProgram: workoutProgram ?? this.workoutProgram,
      onReadWorkoutProgramStatus:
          onReadWorkoutProgramStatus ?? this.onReadWorkoutProgramStatus,
      exercisesDefinition: exercisesDefinition ?? this.exercisesDefinition,
      onReadExercisesDefinitionStatus:
          onReadExercisesDefinitionStatus ??
          this.onReadExercisesDefinitionStatus,
      athleteEnrollments: athleteEnrollments ?? this.athleteEnrollments,
      onReadAthleteEnrollmentsStatus:
          onReadAthleteEnrollmentsStatus ?? this.onReadAthleteEnrollmentsStatus,
      athleteProfile: athleteProfile != null
          ? athleteProfile()
          : this.athleteProfile,
      onReadAthelteProfileStatus:
          onReadAthelteProfileStatus ?? this.onReadAthelteProfileStatus,
      traineeHistories: traineeHistories ?? this.traineeHistories,
      onReadTraineeHistoriesStatus:
          onReadTraineeHistoriesStatus ?? this.onReadTraineeHistoriesStatus,
      onToggleIdDoneWorkoutStatus:
          onToggleIdDoneWorkoutStatus ?? this.onToggleIdDoneWorkoutStatus,
      onReadCoachesUserProfileStatus:
          onReadCoachesUserProfileStatus ?? this.onReadCoachesUserProfileStatus,
      coachesUserProile: coachesUserProile ?? this.coachesUserProile,
    );
  }

  @override
  List<Object?> get props => [
    workoutProgram,
    onReadWorkoutProgramStatus,
    coachesUserProile,
    onReadCoachesUserProfileStatus,
    exercisesDefinition,
    onReadExercisesDefinitionStatus,
    athleteEnrollments,
    onReadAthleteEnrollmentsStatus,
    athleteProfile,
    onReadAthelteProfileStatus,
    traineeHistories,
    onReadTraineeHistoriesStatus,
    onToggleIdDoneWorkoutStatus,
  ];
}
