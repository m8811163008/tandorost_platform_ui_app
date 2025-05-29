part of 'fitness_profile_cubit.dart';

class FitnessProfileState extends Equatable {
  final List<FileData> filesData;
  final List<FileDetail> filesDetail;

  final ChartType selectedChartType;

  final FitnessData? fitnessData;
  final UserPhysicalProfile? userPhysicalProfile;
  final UserPhysicalDataUpsert userPhysicalDataUpsert;

  final AsyncProcessingStatus updateUserPhysicalDataStatus;
  final AsyncProcessingStatus deleteUserPhysicalDataPointStatus;

  final AsyncProcessingStatus addUserImageStatus;
  final AsyncProcessingStatus readUserImageGallaryStatus;

  final AsyncProcessingStatus readFitnessDataStatus;
  final AsyncProcessingStatus readUserPhysicalProfileStatus;

  const FitnessProfileState({
    this.filesData = const [],
    this.filesDetail = const [],
    this.selectedChartType = ChartType.weight,
    this.fitnessData,
    this.userPhysicalDataUpsert = const UserPhysicalDataUpsert(),

    this.userPhysicalProfile,
    this.updateUserPhysicalDataStatus = AsyncProcessingStatus.inital,
    this.deleteUserPhysicalDataPointStatus = AsyncProcessingStatus.inital,
    this.addUserImageStatus = AsyncProcessingStatus.inital,
    this.readUserImageGallaryStatus = AsyncProcessingStatus.inital,
    this.readFitnessDataStatus = AsyncProcessingStatus.inital,
    this.readUserPhysicalProfileStatus = AsyncProcessingStatus.inital,
  });

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
    filesData,
    filesDetail,
    addUserImageStatus,
    readUserImageGallaryStatus,
    readFitnessDataStatus,
    fitnessData,
    userPhysicalDataUpsert,
    updateUserPhysicalDataStatus,
    deleteUserPhysicalDataPointStatus,
    userPhysicalProfile,
    readUserPhysicalProfileStatus,
    supportedChartTypes,
    selectedChartType,
  ];
  FitnessProfileState copyWith({
    List<FileData>? filesData,
    List<FileDetail>? filesDetail,
    List<ChartType>? supportedChartTypes,
    ChartType? selectedChartType,

    FitnessData? fitnessData,
    UserPhysicalDataUpsert? userPhysicalDataUpsert,
    UserPhysicalProfile? userPhysicalProfile,

    AsyncProcessingStatus? addUserImageStatus,
    AsyncProcessingStatus? readUserImageGallaryStatus,
    AsyncProcessingStatus? deleteUserPhysicalDataPointStatus,
    AsyncProcessingStatus? readFitnessDataStatus,
    AsyncProcessingStatus? updateUserPhysicalDataStatus,
    AsyncProcessingStatus? readUserPhysicalProfileStatus,
  }) {
    return FitnessProfileState(
      filesData: filesData ?? this.filesData,
      filesDetail: filesDetail ?? this.filesDetail,
      selectedChartType: selectedChartType ?? this.selectedChartType,
      fitnessData: fitnessData ?? this.fitnessData,
      userPhysicalProfile: userPhysicalProfile ?? this.userPhysicalProfile,
      userPhysicalDataUpsert:
          userPhysicalDataUpsert ?? this.userPhysicalDataUpsert,
      addUserImageStatus: addUserImageStatus ?? this.addUserImageStatus,
      readFitnessDataStatus:
          readFitnessDataStatus ?? this.readFitnessDataStatus,
      readUserImageGallaryStatus:
          readUserImageGallaryStatus ?? this.readUserImageGallaryStatus,
      deleteUserPhysicalDataPointStatus:
          deleteUserPhysicalDataPointStatus ??
          this.deleteUserPhysicalDataPointStatus,
      updateUserPhysicalDataStatus:
          updateUserPhysicalDataStatus ?? this.updateUserPhysicalDataStatus,
      readUserPhysicalProfileStatus:
          readUserPhysicalProfileStatus ?? this.readUserPhysicalProfileStatus,
    );
  }
}
