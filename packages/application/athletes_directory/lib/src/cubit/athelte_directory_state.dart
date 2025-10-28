part of 'athelte_directory_cubit.dart';

class AthelteDirectoryState extends Equatable {
  const AthelteDirectoryState({
    this.onReadCoachEnrollmentsStatus = AsyncProcessingStatus.inital,
    this.onReadAthleteEnrollmentsStatus = AsyncProcessingStatus.inital,
    this.onReadAthletesUserProfileStatus = AsyncProcessingStatus.inital,
    this.onInviteTraineeStatus = AsyncProcessingStatus.inital,
    this.onReadUserProfileStatus = AsyncProcessingStatus.inital,
    this.onReadAthletesImagesStatus = AsyncProcessingStatus.inital,
    this.onReadAtheleteTrainingHistoryStatus = AsyncProcessingStatus.inital,
    this.readFitnessDataStatus = AsyncProcessingStatus.inital,
    this.onReadSubscriptionStatus = AsyncProcessingStatus.inital,
    this.readUserPhysicalProfileStatus = AsyncProcessingStatus.inital,
    this.updatingProfileStatus = AsyncProcessingStatus.inital,
    this.readingCoachProgram = AsyncProcessingStatus.inital,
    this.deletingCoachProgram = AsyncProcessingStatus.inital,
    this.updatingCoachProgram = AsyncProcessingStatus.inital,
    this.coachEnrollments = const [],
    this.athleteEnrollments = const [],
    this.athletesUserProfile = const [],
    this.athletesImages = const [],
    this.athletesImagesDetail = const [],
    this.selectedAtheleteTrainsHistory = const [],
    this.filesDetail = const [],
    this.coachPrograms = const [],
    this.athleteCoachPrograms = const [],
    this.userProfile,
    this.selectedAthlete,
    this.coachProfile,
    this.fitnessData,
    this.selectedChartType = ChartType.weight,
    this.userPhysicalProfile,
    this.workoutPrograms = const [],
    this.exercisesDefinition = const [],
    this.archiveImagesId = const [],
    this.filesData = const [],
    this.referralByInviterId = const [],
    this.readExercisesDefinitionStatus = AsyncProcessingStatus.inital,
    this.onReadWorkoutProgramStatus = AsyncProcessingStatus.inital,
    this.onReadReferralByInviterIdStatus = AsyncProcessingStatus.inital,
    this.readCoachProfileStatus = AsyncProcessingStatus.inital,
    this.updateCoachProfileStatus = AsyncProcessingStatus.inital,
    this.readUserImageGallaryStatus = AsyncProcessingStatus.inital,
    this.archivingImagesStatus = AsyncProcessingStatus.inital,
    this.addUserImageStatus = AsyncProcessingStatus.inital,
    this.subscription = const [],
    this.selectedWorkout,
    this.updatedCoachProfile,
    this.cacheCoachProgram,
    this.updatedUserProfile,
  });

  final AsyncProcessingStatus readUserImageGallaryStatus;
  final AsyncProcessingStatus archivingImagesStatus;
  final AsyncProcessingStatus onReadReferralByInviterIdStatus;
  final List<String> archiveImagesId;
  final List<FileData> filesData;

  final List<ProgramEnrollment> coachEnrollments;
  final List<ProgramEnrollment> athleteEnrollments;
  final AsyncProcessingStatus onReadCoachEnrollmentsStatus;
  final AsyncProcessingStatus onReadAthleteEnrollmentsStatus;
  final AsyncProcessingStatus onReadAthletesUserProfileStatus;
  final AsyncProcessingStatus onReadSubscriptionStatus;
  final List<SubscriptionPayment> subscription;
  final List<UserProfile> athletesUserProfile;
  final AsyncProcessingStatus onReadUserProfileStatus;
  final AsyncProcessingStatus updatingProfileStatus;
  final AsyncProcessingStatus readCoachProfileStatus;
  final AsyncProcessingStatus onInviteTraineeStatus;
  final UserProfile? userProfile;
  final UserProfile? updatedUserProfile;
  final CoachProfile? coachProfile;
  final AsyncProcessingStatus addUserImageStatus;
  final List<FileData> athletesImages;
  final List<Referral> referralByInviterId;
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
  final List<CoachProgram> athleteCoachPrograms;
  final List<WorkoutProgram> workoutPrograms;
  final List<ExerciseDefinition> exercisesDefinition;
  final AsyncProcessingStatus readExercisesDefinitionStatus;
  final AsyncProcessingStatus onReadWorkoutProgramStatus;
  final AsyncProcessingStatus updateCoachProfileStatus;
  final WorkoutProgram? selectedWorkout;
  final CoachProfile? updatedCoachProfile;
  final List<FileDetail> filesDetail;
  final AsyncProcessingStatus readingCoachProgram;
  final AsyncProcessingStatus deletingCoachProgram;
  final AsyncProcessingStatus updatingCoachProgram;
  final CoachProgram? cacheCoachProgram;

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

  AthelteDirectoryState copyWith({
    AsyncProcessingStatus? readUserImageGallaryStatus,
    AsyncProcessingStatus? archivingImagesStatus,
    List<String>? archiveImagesId,
    List<FileData>? filesData,
    List<Referral>? referralByInviterId,
    List<ProgramEnrollment>? coachEnrollments,
    List<ProgramEnrollment>? athleteEnrollments,
    AsyncProcessingStatus? onReadCoachEnrollmentsStatus,
    AsyncProcessingStatus? onReadReferralByInviterIdStatus,
    AsyncProcessingStatus? onInviteTraineeStatus,
    AsyncProcessingStatus? onReadAthleteEnrollmentsStatus,
    AsyncProcessingStatus? onReadAthletesUserProfileStatus,
    List<UserProfile>? athletesUserProfile,
    AsyncProcessingStatus? onReadUserProfileStatus,
    AsyncProcessingStatus? onReadSubscriptionStatus,
    List<SubscriptionPayment>? subscription,
    AsyncProcessingStatus? updatingProfileStatus,
    AsyncProcessingStatus? addUserImageStatus,
    AsyncProcessingStatus? readCoachProfileStatus,
    ValueGetter<UserProfile?>? userProfile,
    ValueGetter<CoachProfile?>? coachProfile,
    List<FileData>? athletesImages,
    List<FileDetail>? athletesImagesDetail,
    AsyncProcessingStatus? onReadAthletesImagesStatus,
    ValueGetter<UserProfile?>? selectedAthlete,
    List<TraineeHistory>? selectedAtheleteTrainsHistory,
    AsyncProcessingStatus? onReadAtheleteTrainingHistoryStatus,
    ValueGetter<FitnessData?>? fitnessData,
    AsyncProcessingStatus? readFitnessDataStatus,
    ValueGetter<UserPhysicalProfile?>? userPhysicalProfile,
    AsyncProcessingStatus? readUserPhysicalProfileStatus,
    ChartType? selectedChartType,
    List<CoachProgram>? coachPrograms,
    List<CoachProgram>? athleteCoachPrograms,
    List<WorkoutProgram>? workoutPrograms,
    List<ExerciseDefinition>? exercisesDefinition,
    AsyncProcessingStatus? readExercisesDefinitionStatus,
    AsyncProcessingStatus? onReadWorkoutProgramStatus,
    AsyncProcessingStatus? updateCoachProfileStatus,
    ValueGetter<WorkoutProgram?>? selectedWorkout,
    ValueGetter<CoachProfile?>? updatedCoachProfile,
    List<FileDetail>? filesDetail,
    AsyncProcessingStatus? readingCoachProgram,
    AsyncProcessingStatus? deletingCoachProgram,
    AsyncProcessingStatus? updatingCoachProgram,
    ValueGetter<CoachProgram?>? cacheCoachProgram,
    ValueGetter<UserProfile?>? updatedUserProfile,
  }) {
    return AthelteDirectoryState(
      readUserImageGallaryStatus:
          readUserImageGallaryStatus ?? this.readUserImageGallaryStatus,
      onReadSubscriptionStatus:
          onReadSubscriptionStatus ?? this.onReadSubscriptionStatus,
      subscription: subscription ?? this.subscription,
      onReadReferralByInviterIdStatus:
          onReadReferralByInviterIdStatus ??
          this.onReadReferralByInviterIdStatus,
      referralByInviterId: referralByInviterId ?? this.referralByInviterId,
      archivingImagesStatus:
          archivingImagesStatus ?? this.archivingImagesStatus,
      archiveImagesId: archiveImagesId ?? this.archiveImagesId,
      filesData: filesData ?? this.filesData,
      coachEnrollments: coachEnrollments ?? this.coachEnrollments,
      athleteEnrollments: athleteEnrollments ?? this.athleteEnrollments,
      onReadCoachEnrollmentsStatus:
          onReadCoachEnrollmentsStatus ?? this.onReadCoachEnrollmentsStatus,
      onReadAthleteEnrollmentsStatus:
          onReadAthleteEnrollmentsStatus ?? this.onReadAthleteEnrollmentsStatus,
      onInviteTraineeStatus:
          onInviteTraineeStatus ?? this.onInviteTraineeStatus,
      addUserImageStatus: addUserImageStatus ?? this.addUserImageStatus,
      onReadAthletesUserProfileStatus:
          onReadAthletesUserProfileStatus ??
          this.onReadAthletesUserProfileStatus,
      athletesUserProfile: athletesUserProfile ?? this.athletesUserProfile,
      onReadUserProfileStatus:
          onReadUserProfileStatus ?? this.onReadUserProfileStatus,
      updatingProfileStatus:
          updatingProfileStatus ?? this.updatingProfileStatus,
      readCoachProfileStatus:
          readCoachProfileStatus ?? this.readCoachProfileStatus,
      userProfile: userProfile != null ? userProfile() : this.userProfile,
      coachProfile: coachProfile != null ? coachProfile() : this.coachProfile,
      athletesImages: athletesImages ?? this.athletesImages,
      athletesImagesDetail: athletesImagesDetail ?? this.athletesImagesDetail,

      onReadAthletesImagesStatus:
          onReadAthletesImagesStatus ?? this.onReadAthletesImagesStatus,
      selectedAthlete: selectedAthlete != null
          ? selectedAthlete()
          : this.selectedAthlete,
      selectedAtheleteTrainsHistory:
          selectedAtheleteTrainsHistory ?? this.selectedAtheleteTrainsHistory,
      onReadAtheleteTrainingHistoryStatus:
          onReadAtheleteTrainingHistoryStatus ??
          this.onReadAtheleteTrainingHistoryStatus,
      fitnessData: fitnessData != null ? fitnessData() : this.fitnessData,
      readFitnessDataStatus:
          readFitnessDataStatus ?? this.readFitnessDataStatus,
      userPhysicalProfile: userPhysicalProfile != null
          ? userPhysicalProfile()
          : this.userPhysicalProfile,
      readUserPhysicalProfileStatus:
          readUserPhysicalProfileStatus ?? this.readUserPhysicalProfileStatus,
      selectedChartType: selectedChartType ?? this.selectedChartType,
      coachPrograms: coachPrograms ?? this.coachPrograms,
      athleteCoachPrograms: athleteCoachPrograms ?? this.athleteCoachPrograms,
      workoutPrograms: workoutPrograms ?? this.workoutPrograms,
      exercisesDefinition: exercisesDefinition ?? this.exercisesDefinition,
      readExercisesDefinitionStatus:
          readExercisesDefinitionStatus ?? this.readExercisesDefinitionStatus,
      onReadWorkoutProgramStatus:
          onReadWorkoutProgramStatus ?? this.onReadWorkoutProgramStatus,
      filesDetail: filesDetail ?? this.filesDetail,
      updateCoachProfileStatus:
          updateCoachProfileStatus ?? this.updateCoachProfileStatus,
      selectedWorkout: selectedWorkout != null
          ? selectedWorkout()
          : this.selectedWorkout,
      cacheCoachProgram: cacheCoachProgram != null
          ? cacheCoachProgram()
          : this.cacheCoachProgram,
      updatedCoachProfile: updatedCoachProfile != null
          ? updatedCoachProfile()
          : this.updatedCoachProfile,
      updatedUserProfile: updatedUserProfile != null
          ? updatedUserProfile()
          : this.updatedUserProfile,
      readingCoachProgram: readingCoachProgram ?? this.readingCoachProgram,
      deletingCoachProgram: deletingCoachProgram ?? this.deletingCoachProgram,
      updatingCoachProgram: updatingCoachProgram ?? this.updatingCoachProgram,
    );
  }

  @override
  List<Object?> get props => [
    readUserImageGallaryStatus,
    archivingImagesStatus,
    onReadReferralByInviterIdStatus,
    archiveImagesId,
    filesData,
    coachEnrollments,
    athleteEnrollments,
    onReadCoachEnrollmentsStatus,
    onReadAthleteEnrollmentsStatus,
    onReadAthletesUserProfileStatus,
    onReadSubscriptionStatus,
    subscription,
    athletesUserProfile,
    onReadUserProfileStatus,
    updatingProfileStatus,
    readCoachProfileStatus,
    onInviteTraineeStatus,
    userProfile,
    updatedUserProfile,
    coachProfile,
    addUserImageStatus,
    athletesImages,
    referralByInviterId,
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
    athleteCoachPrograms,
    workoutPrograms,
    exercisesDefinition,
    readExercisesDefinitionStatus,
    onReadWorkoutProgramStatus,
    updateCoachProfileStatus,
    selectedWorkout,
    updatedCoachProfile,
    filesDetail,
    readingCoachProgram,
    deletingCoachProgram,
    updatingCoachProgram,
    cacheCoachProgram,
  ];
}
