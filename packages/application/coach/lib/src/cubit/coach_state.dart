part of 'coach_cubit.dart';

class CoachState extends Equatable {
  const CoachState({
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
  });

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
  }) {
    return CoachState(
      coachesProfile: coachesProfile ?? this.coachesProfile,
      readCoachesProfileStatus:
          readCoachesProfileStatus ?? this.readCoachesProfileStatus,
      coachesUserProfile: coachesUserProfile ?? this.coachesUserProfile,
      readCoachesUserProfileStatus:
          readCoachesUserProfileStatus ?? this.readCoachesUserProfileStatus,
      coachesImagesData: readCoachImagesData ?? this.coachesImagesData,
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
  ];
}
