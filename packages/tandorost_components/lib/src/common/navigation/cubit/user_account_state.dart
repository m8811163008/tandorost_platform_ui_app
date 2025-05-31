part of 'user_account_cubit.dart';

class UserAccountState extends Equatable {
  final FileDetail? profileImage;
  final UserProfile? userProfile;

  final AsyncProcessingStatus readUserProfileImageStatus;
  final AsyncProcessingStatus readUserProfileStatus;

  const UserAccountState({
    this.profileImage,
    this.userProfile,
    this.readUserProfileImageStatus = AsyncProcessingStatus.inital,
    this.readUserProfileStatus = AsyncProcessingStatus.inital,
  });

  @override
  List<Object?> get props => [
    profileImage,
    userProfile,
    readUserProfileImageStatus,
    readUserProfileStatus,
  ];
  UserAccountState copyWith({
    ValueGetter<FileDetail?>? profileImage,
    ValueGetter<UserProfile?>? userProfile,
    AsyncProcessingStatus? readUserProfileImageStatus,
    AsyncProcessingStatus? readUserProfileStatus,
  }) {
    return UserAccountState(
      profileImage: profileImage != null ? profileImage() : this.profileImage,
      userProfile: userProfile != null ? userProfile() : this.userProfile,
      readUserProfileImageStatus:
          readUserProfileImageStatus ?? this.readUserProfileImageStatus,
      readUserProfileStatus:
          readUserProfileStatus ?? this.readUserProfileStatus,
    );
  }
}
