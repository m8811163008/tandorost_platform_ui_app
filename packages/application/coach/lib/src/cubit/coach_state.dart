part of 'coach_cubit.dart';

class CoachState extends Equatable {
  CoachState({
    this.coachesProfile = const [],
    this.readCoachesProfileStatus = AsyncProcessingStatus.inital,
    this.coachesUserProfile = const [],
    this.readCoachesUserProfileStatus = AsyncProcessingStatus.inital,
    this.coachesImagesData = const [],
    this.coachesImagesFilesDetail = const [],
    this.readCoachImagesDataStatus = AsyncProcessingStatus.inital,
    this.readSelectedCoachPrograms,
    this.readSelectedCoachProgramsStatus = AsyncProcessingStatus.inital,
    this.selectedCoachProfile,
    this.selectedCoacheUserProfile,
    TraineeHistory? traineeHistory,
    this.filesData = const [],
    this.filesDetail = const [],
    this.readUserImageGallaryStatus = AsyncProcessingStatus.inital,
    this.addUserImageStatus = AsyncProcessingStatus.inital,
    this.archivingImagesStatus = AsyncProcessingStatus.inital,
    this.upsertingTraineeHistoryStatus = AsyncProcessingStatus.inital,
    this.archiveImagesId = const [],
  }) : traineeHistory = traineeHistory ?? TraineeHistory.empty();

  final List<CoachProfile> coachesProfile;
  final AsyncProcessingStatus readCoachesProfileStatus;
  final List<UserProfile> coachesUserProfile;
  final UserProfile? selectedCoacheUserProfile;
  final CoachProfile? selectedCoachProfile;
  final AsyncProcessingStatus readCoachesUserProfileStatus;
  final List<FileData> coachesImagesData;
  final List<FileDetail> coachesImagesFilesDetail;
  final AsyncProcessingStatus readCoachImagesDataStatus;
  final List<CoachProgram>? readSelectedCoachPrograms;
  final AsyncProcessingStatus readSelectedCoachProgramsStatus;
  final TraineeHistory? traineeHistory;
  final List<FileDetail> filesDetail;
  final List<FileData> filesData;
  final AsyncProcessingStatus readUserImageGallaryStatus;
  final AsyncProcessingStatus addUserImageStatus;
  final AsyncProcessingStatus archivingImagesStatus;
  final AsyncProcessingStatus upsertingTraineeHistoryStatus;
  final List<String> archiveImagesId;

  CoachState copyWith({
    List<CoachProfile>? coachesProfile,
    AsyncProcessingStatus? readCoachesProfileStatus,
    List<UserProfile>? coachesUserProfile,
    AsyncProcessingStatus? readCoachesUserProfileStatus,
    List<FileData>? readCoachImagesData,
    List<FileDetail>? coachesImagesFilesDetail,
    AsyncProcessingStatus? readCoachImagesDataStatus,
    ValueGetter<List<CoachProgram>?>? readSelectedCoachPrograms,
    AsyncProcessingStatus? readSelectedCoachProgramsStatus,
    UserProfile? selectedCoacheUserProfile,
    CoachProfile? selectedCoachProfile,
    TraineeHistory? traineeHistory,
    List<FileDetail>? filesDetail,
    List<FileData>? filesData,
    AsyncProcessingStatus? readUserImageGallaryStatus,
    AsyncProcessingStatus? addUserImageStatus,
    AsyncProcessingStatus? archivingImagesStatus,
    AsyncProcessingStatus? upsertingTraineeHistoryStatus,
    List<String>? archiveImagesId,
  }) {
    return CoachState(
      coachesProfile: coachesProfile ?? this.coachesProfile,
      traineeHistory: traineeHistory ?? this.traineeHistory,
      readCoachesProfileStatus:
          readCoachesProfileStatus ?? this.readCoachesProfileStatus,
      coachesUserProfile: coachesUserProfile ?? this.coachesUserProfile,
      readCoachesUserProfileStatus:
          readCoachesUserProfileStatus ?? this.readCoachesUserProfileStatus,
      coachesImagesData: readCoachImagesData ?? coachesImagesData,
      coachesImagesFilesDetail:
          coachesImagesFilesDetail ?? this.coachesImagesFilesDetail,
      readCoachImagesDataStatus:
          readCoachImagesDataStatus ?? this.readCoachImagesDataStatus,
      readSelectedCoachPrograms: readSelectedCoachPrograms != null
          ? readSelectedCoachPrograms()
          : this.readSelectedCoachPrograms,
      readSelectedCoachProgramsStatus:
          readSelectedCoachProgramsStatus ??
          this.readSelectedCoachProgramsStatus,
      selectedCoacheUserProfile:
          this.selectedCoacheUserProfile ?? selectedCoacheUserProfile,
      selectedCoachProfile: this.selectedCoachProfile ?? selectedCoachProfile,
      filesData: filesData ?? this.filesData,
      filesDetail: filesDetail ?? this.filesDetail,
      readUserImageGallaryStatus:
          readUserImageGallaryStatus ?? this.readUserImageGallaryStatus,
      addUserImageStatus: addUserImageStatus ?? this.addUserImageStatus,
      upsertingTraineeHistoryStatus:
          upsertingTraineeHistoryStatus ?? this.upsertingTraineeHistoryStatus,
      archivingImagesStatus:
          archivingImagesStatus ?? this.archivingImagesStatus,
      archiveImagesId: archiveImagesId ?? this.archiveImagesId,
    );
  }

  @override
  List<Object?> get props => [
    coachesProfile,
    readCoachesProfileStatus,
    coachesUserProfile,
    readCoachesUserProfileStatus,
    coachesImagesData,
    coachesImagesFilesDetail,
    readCoachImagesDataStatus,
    readSelectedCoachPrograms,
    readSelectedCoachProgramsStatus,
    selectedCoacheUserProfile,
    selectedCoachProfile,
    traineeHistory,
    filesData,
    filesDetail,
    readUserImageGallaryStatus,
    addUserImageStatus,
    archiveImagesId,
    archivingImagesStatus,
    upsertingTraineeHistoryStatus,
  ];
}
