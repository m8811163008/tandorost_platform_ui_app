part of 'fitness_profile_cubit.dart';

class FitnessProfileState extends Equatable {
  final List<FileData> filesData;
  final List<FileDetail> filesDetail;

  final FitnessData? fitnessData;
  final UserPhysicalProfile? userPhysicalProfile;
  final UserPhysicalDataUpsert userPhysicalDataUpsert;

  final AsyncProcessingStatus updateUserPhysicalDataStatus;

  final AsyncProcessingStatus addUserImageStatus;
  final AsyncProcessingStatus readUserImageGallaryStatus;

  final AsyncProcessingStatus readFitnessDataStatus;
  final AsyncProcessingStatus readUserPhysicalProfileStatus;


  const FitnessProfileState({
    this.filesData = const [],
    this.filesDetail = const [],
    this.fitnessData,
    this.userPhysicalDataUpsert = const UserPhysicalDataUpsert(),
    this.userPhysicalProfile,
    this.updateUserPhysicalDataStatus = AsyncProcessingStatus.inital,
    this.addUserImageStatus = AsyncProcessingStatus.inital,
    this.readUserImageGallaryStatus = AsyncProcessingStatus.inital,
    this.readFitnessDataStatus = AsyncProcessingStatus.inital,
    this.readUserPhysicalProfileStatus = AsyncProcessingStatus.inital,
  });

  @override
  List<Object?> get props => [
    filesData,
    filesDetail,
    addUserImageStatus,
    readUserImageGallaryStatus,
    readFitnessDataStatus,
    fitnessData,
    userPhysicalDataUpsert,
    updateUserPhysicalDataStatus,
    userPhysicalProfile,
    readUserPhysicalProfileStatus
  ];
  FitnessProfileState copyWith({
    List<FileData>? filesData,
    List<FileDetail>? filesDetail,

    FitnessData? fitnessData,
    UserPhysicalDataUpsert? userPhysicalDataUpsert,
    UserPhysicalProfile? userPhysicalProfile,
    
    AsyncProcessingStatus? addUserImageStatus,
    AsyncProcessingStatus? readUserImageGallaryStatus,
    AsyncProcessingStatus? readFitnessDataStatus,
    AsyncProcessingStatus? updateUserPhysicalDataStatus,
    AsyncProcessingStatus? readUserPhysicalProfileStatus,
  }) {
    return FitnessProfileState(
      filesData: filesData ?? this.filesData,
      filesDetail: filesDetail ?? this.filesDetail,
      fitnessData: fitnessData ?? this.fitnessData,
      userPhysicalProfile: userPhysicalProfile ?? this.userPhysicalProfile,
      userPhysicalDataUpsert:
          userPhysicalDataUpsert ?? this.userPhysicalDataUpsert,
      addUserImageStatus: addUserImageStatus ?? this.addUserImageStatus,
      readFitnessDataStatus:
          readFitnessDataStatus ?? this.readFitnessDataStatus,
      readUserImageGallaryStatus:
          readUserImageGallaryStatus ?? this.readUserImageGallaryStatus,
      updateUserPhysicalDataStatus:
          updateUserPhysicalDataStatus ?? this.updateUserPhysicalDataStatus,
      readUserPhysicalProfileStatus:
          readUserPhysicalProfileStatus ?? this.readUserPhysicalProfileStatus,
    );
  }
}
