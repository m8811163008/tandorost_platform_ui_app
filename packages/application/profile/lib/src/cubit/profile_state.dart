part of 'profile_cubit.dart';

@immutable
class ProfileState extends Equatable {
  const ProfileState({
    this.changeWeightSpeed = ChangeWeightSpeed.constant,
    this.isTimeRestrictedEating = false,
    this.language = Language.english,
    this.name = '',
    this.phoneNumber = '',
    this.updatingProfileStatus = AsyncProcessingStatus.inital,
    this.uploadingImageProfileStatus = AsyncProcessingStatus.inital,
    this.readProfileImageStatus = AsyncProcessingStatus.inital,
    this.readProfileStatus = AsyncProcessingStatus.inital,
    this.userProfile,
    this.profileImage,
  });

  final ChangeWeightSpeed changeWeightSpeed;
  final bool isTimeRestrictedEating;
  final Language language;
  final String name;
  final String phoneNumber;
  final AsyncProcessingStatus updatingProfileStatus;
  final AsyncProcessingStatus readProfileStatus;
  final AsyncProcessingStatus readProfileImageStatus;
  final AsyncProcessingStatus uploadingImageProfileStatus;
  final UserProfile? userProfile;
  final FileDetail? profileImage;

  ProfileState copyWith({
    ChangeWeightSpeed? changeWeightSpeed,
    bool? isTimeRestrictedEating,
    Language? language,
    String? name,
    String? phoneNumber,
    AsyncProcessingStatus? updatingProfileStatus,
    AsyncProcessingStatus? readProfileStatus,
    AsyncProcessingStatus? readProfileImageStatus,
    AsyncProcessingStatus? uploadingImageProfileStatus,
    UserProfile? userProfile,
    FileDetail? profileImage,
  }) {
    return ProfileState(
      changeWeightSpeed: changeWeightSpeed ?? this.changeWeightSpeed,
      isTimeRestrictedEating:
          isTimeRestrictedEating ?? this.isTimeRestrictedEating,
      language: language ?? this.language,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      updatingProfileStatus:
          updatingProfileStatus ?? this.updatingProfileStatus,
      readProfileStatus: readProfileStatus ?? this.readProfileStatus,
      uploadingImageProfileStatus:
          uploadingImageProfileStatus ?? this.uploadingImageProfileStatus,
      readProfileImageStatus:
          readProfileImageStatus ?? this.readProfileImageStatus,
      userProfile: userProfile ?? this.userProfile,
      profileImage: profileImage ?? this.profileImage,
    );
  }

  @override
  List<Object?> get props => [
    changeWeightSpeed,
    isTimeRestrictedEating,
    language,
    name,
    phoneNumber,
    updatingProfileStatus,
    readProfileStatus,
    readProfileImageStatus,
    uploadingImageProfileStatus,
    userProfile,
    profileImage,
  ];
}
