part of 'athelte_directory_cubit.dart';

class AthelteDirectoryState extends Equatable {
  const AthelteDirectoryState({
    this.onReadCoachEnrollmentsStatus = AsyncProcessingStatus.inital,
    this.onReadAthleteEnrollmentsStatus = AsyncProcessingStatus.inital,
    this.onReadAthletesUserProfileStatus = AsyncProcessingStatus.inital,
    this.onReadCoachProfileStatus = AsyncProcessingStatus.inital,
    this.onReadAthletesImagesStatus = AsyncProcessingStatus.inital,
    this.onReadAtheleteTrainingHistoryStatus = AsyncProcessingStatus.inital,
    this.readFitnessDataStatus = AsyncProcessingStatus.inital,
    this.readUserPhysicalProfileStatus = AsyncProcessingStatus.inital,
    this.coachEnrollments = const [],
    this.athleteEnrollments = const [],
    this.athletesUserProfile = const [],
    this.athletesImages = const [],
    this.athletesImagesDetail = const [],
    this.selectedAtheleteTrainsHistory = const [],
    this.coachPrograms = const [],
    this.coachProfile,
    this.selectedAthlete,
    this.fitnessData,
    this.selectedChartType = ChartType.weight,
    this.userPhysicalProfile,
    this.workoutProgram,
    this.exercisesDefinition = const [],
    this.readExercisesDefinitionStatus = AsyncProcessingStatus.inital,
  });

  final List<ProgramEnrollment> coachEnrollments;
  final List<ProgramEnrollment> athleteEnrollments;
  final AsyncProcessingStatus onReadCoachEnrollmentsStatus;
  final AsyncProcessingStatus onReadAthleteEnrollmentsStatus;
  final AsyncProcessingStatus onReadAthletesUserProfileStatus;
  final List<UserProfile> athletesUserProfile;
  final AsyncProcessingStatus onReadCoachProfileStatus;
  final UserProfile? coachProfile;
  final List<FileData> athletesImages;
  final List<FileDetail> athletesImagesDetail;
  final AsyncProcessingStatus onReadAthletesImagesStatus;
  final UserProfile? selectedAthlete;
  final List<TraineeHistory> selectedAtheleteTrainsHistory;
  final AsyncProcessingStatus onReadAtheleteTrainingHistoryStatus;
  final FitnessData? fitnessData;
  final AsyncProcessingStatus readFitnessDataStatus;
  final UserPhysicalProfile? userPhysicalProfile;
  final AsyncProcessingStatus readUserPhysicalProfileStatus;
  final ChartType selectedChartType;
  final List<CoachProgram> coachPrograms;
  final WorkoutProgram? workoutProgram;
  final List<ExerciseDefinition> exercisesDefinition;
  final AsyncProcessingStatus readExercisesDefinitionStatus;
  AthelteDirectoryState copyWith({
    List<ProgramEnrollment>? coachEnrollments,
    List<ProgramEnrollment>? athleteEnrollments,
    AsyncProcessingStatus? onReadCoachEnrollmentsStatus,
    AsyncProcessingStatus? onReadAthleteEnrollmentsStatus,
    AsyncProcessingStatus? onReadAthletesUserProfileStatus,
    List<UserProfile>? athletesUserProfile,
    List<FileData>? athletesImages,
    List<FileDetail>? athletesImagesDetail,
    List<TraineeHistory>? selectedAtheleteTrainsHistory,
    AsyncProcessingStatus? onReadCoachProfileStatus,
    AsyncProcessingStatus? onReadAthletesImagesStatus,
    AsyncProcessingStatus? onReadAtheleteTrainingHistoryStatus,
    ValueGetter<UserProfile?>? coachProfile,
    List<CoachProgram>? coachPrograms,
    UserProfile? selectedAthlete,
    FitnessData? fitnessData,
    AsyncProcessingStatus? readFitnessDataStatus,
    AsyncProcessingStatus? readUserPhysicalProfileStatus,
    AsyncProcessingStatus? readExercisesDefinitionStatus,
    UserPhysicalProfile? userPhysicalProfile,
    ChartType? selectedChartType,
    WorkoutProgram? workoutProgram,
    List<ExerciseDefinition>? exercisesDefinition,
  }) {
    return AthelteDirectoryState(
      coachEnrollments: coachEnrollments ?? this.coachEnrollments,
      athleteEnrollments: athleteEnrollments ?? this.athleteEnrollments,
      onReadCoachEnrollmentsStatus:
          onReadCoachEnrollmentsStatus ?? this.onReadCoachEnrollmentsStatus,
      onReadAthleteEnrollmentsStatus:
          onReadAthleteEnrollmentsStatus ?? this.onReadAthleteEnrollmentsStatus,
      onReadAtheleteTrainingHistoryStatus:
          onReadAtheleteTrainingHistoryStatus ??
          this.onReadAtheleteTrainingHistoryStatus,
      onReadAthletesUserProfileStatus:
          onReadAthletesUserProfileStatus ??
          this.onReadAthletesUserProfileStatus,
      athletesUserProfile: athletesUserProfile ?? this.athletesUserProfile,
      onReadCoachProfileStatus:
          onReadCoachProfileStatus ?? this.onReadCoachProfileStatus,
      athletesImages: athletesImages ?? this.athletesImages,
      athletesImagesDetail: athletesImagesDetail ?? this.athletesImagesDetail,
      onReadAthletesImagesStatus:
          onReadAthletesImagesStatus ?? this.onReadAthletesImagesStatus,
      selectedAtheleteTrainsHistory:
          selectedAtheleteTrainsHistory ?? this.selectedAtheleteTrainsHistory,
      selectedAthlete: selectedAthlete ?? this.selectedAthlete,
      coachProfile: coachProfile != null ? coachProfile() : this.coachProfile,
      fitnessData: fitnessData ?? this.fitnessData,
      readFitnessDataStatus:
          readFitnessDataStatus ?? this.readFitnessDataStatus,
      userPhysicalProfile: userPhysicalProfile ?? this.userPhysicalProfile,
      readUserPhysicalProfileStatus:
          readUserPhysicalProfileStatus ?? this.readUserPhysicalProfileStatus,
      selectedChartType: selectedChartType ?? this.selectedChartType,
      coachPrograms: coachPrograms ?? this.coachPrograms,
      workoutProgram: workoutProgram ?? this.workoutProgram,
      exercisesDefinition: exercisesDefinition ?? this.exercisesDefinition,
    );
  }

  Set<ChartType> get supportedChartTypes {
    final profile = userPhysicalProfile;
    if (profile == null) return {};
    final types = <ChartType, bool>{
      ChartType.height: profile.height.isNotEmpty,
      ChartType.weight: profile.weight.isNotEmpty,
      ChartType.waistCircumference: profile.waistCircumference.isNotEmpty,
      ChartType.armCircumference: profile.armCircumference.isNotEmpty,
      ChartType.chestCircumference: profile.chestCircumference.isNotEmpty,
      ChartType.thighCircumference: profile.thighCircumference.isNotEmpty,
      ChartType.calfMuscleCircumference:
          profile.calfMuscleCircumference.isNotEmpty,
      ChartType.hipCircumference: profile.hipCircumference.isNotEmpty,
    };
    return types.entries.where((e) => e.value).map((e) => e.key).toSet();
  }

  List<DoubleDataPoint> get chartDataPoints {
    final profile = userPhysicalProfile;
    final type = selectedChartType;

    if (profile == null) return [];

    switch (type) {
      case ChartType.weight:
        return profile.weight;
      case ChartType.height:
        return profile.height;
      case ChartType.waistCircumference:
        return profile.waistCircumference;
      case ChartType.armCircumference:
        return profile.armCircumference;
      case ChartType.chestCircumference:
        return profile.chestCircumference;
      case ChartType.thighCircumference:
        return profile.thighCircumference;
      case ChartType.calfMuscleCircumference:
        return profile.calfMuscleCircumference;
      case ChartType.hipCircumference:
        return profile.hipCircumference;
    }
  }

  @override
  List<Object?> get props => [
    coachEnrollments,
    athleteEnrollments,
    onReadCoachEnrollmentsStatus,
    onReadAthleteEnrollmentsStatus,
    onReadAthletesUserProfileStatus,
    athletesUserProfile,
    onReadCoachProfileStatus,
    coachProfile,
    athletesImages,
    exercisesDefinition,
    athletesImagesDetail,
    onReadAthletesImagesStatus,
    selectedAthlete,
    selectedAtheleteTrainsHistory,
    onReadAtheleteTrainingHistoryStatus,
    fitnessData,
    readFitnessDataStatus,
    userPhysicalProfile,
    readUserPhysicalProfileStatus,
    selectedChartType,
    coachPrograms,
    workoutProgram,
  ];
}
