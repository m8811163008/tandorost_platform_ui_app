part of 'fitness_profile_cubit.dart';

class FitnessProfileState extends Equatable {
  final List<FileData> filesData;
  final List<FileDetail> filesDetail;
  final FitnessData? fitnessData;
  final AsyncProcessingStatus addUserImageStatus;
  final AsyncProcessingStatus readUserImageGallaryStatus;
  final AsyncProcessingStatus readFitnessDataStatus;

  const FitnessProfileState({
    this.filesData = const [],
    this.filesDetail = const [],
    this.fitnessData, 
    this.addUserImageStatus = AsyncProcessingStatus.inital,
    this.readUserImageGallaryStatus = AsyncProcessingStatus.inital,
    this.readFitnessDataStatus = AsyncProcessingStatus.inital,
  });

  @override
  List<Object?> get props => [
    filesData,
    filesDetail,
    addUserImageStatus,
    readUserImageGallaryStatus,
    readFitnessDataStatus,
    fitnessData
  ];
  FitnessProfileState copyWith({
    List<FileData>? filesData,
    List<FileDetail>? filesDetail,
    FitnessData? fitnessData,
    AsyncProcessingStatus? addUserImageStatus,
    AsyncProcessingStatus? readUserImageGallaryStatus,
    AsyncProcessingStatus? readFitnessDataStatus,
  }) {
    return FitnessProfileState(
      filesData: filesData ?? this.filesData,
      filesDetail: filesDetail ?? this.filesDetail,
      fitnessData: fitnessData?? this.fitnessData,
      addUserImageStatus: addUserImageStatus ?? this.addUserImageStatus,
      readFitnessDataStatus: readFitnessDataStatus?? this.readFitnessDataStatus,
      readUserImageGallaryStatus:
          readUserImageGallaryStatus ?? this.readUserImageGallaryStatus,
    );
  }
}
