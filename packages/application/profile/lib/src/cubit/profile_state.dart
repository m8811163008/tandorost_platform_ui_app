part of 'profile_cubit.dart';

@immutable
class ProfileState extends Equatable {
  const ProfileState({
    this.isReminderNotificationPermissionGranted = false,
    this.updatingProfileStatus = AsyncProcessingStatus.inital,
    this.uploadingImageProfileStatus = AsyncProcessingStatus.inital,
    this.readProfileImageStatus = AsyncProcessingStatus.inital,
    this.readProfileStatus = AsyncProcessingStatus.inital,
    this.readSubscriptionStatus = AsyncProcessingStatus.inital,
    this.subscriptions = const [],
    this.userProfile,
    this.updatedUserProfile,
    this.profileImage,
  });

  // final ChangeWeightSpeed changeWeightSpeed;
  // final bool isTimeRestrictedEating;
  final bool isReminderNotificationPermissionGranted;
  // final bool isBodybuildingCoach;
  // final Language language;
  // final String name;
  // final String phoneNumber;
  // final String email;
  final AsyncProcessingStatus updatingProfileStatus;
  final AsyncProcessingStatus readProfileStatus;
  final AsyncProcessingStatus readProfileImageStatus;
  final AsyncProcessingStatus uploadingImageProfileStatus;
  final AsyncProcessingStatus readSubscriptionStatus;
  final UserProfile? userProfile;
  final UserProfile? updatedUserProfile;
  final FileDetail? profileImage;
  final List<SubscriptionPayment> subscriptions;

  ProfileState copyWith({
    bool? isReminderNotificationPermissionGranted,

    AsyncProcessingStatus? updatingProfileStatus,
    AsyncProcessingStatus? readProfileStatus,
    AsyncProcessingStatus? readProfileImageStatus,
    AsyncProcessingStatus? uploadingImageProfileStatus,
    AsyncProcessingStatus? readSubscriptionStatus,
    List<SubscriptionPayment>? subscriptions,
    UserProfile? userProfile,
    UserProfile? updatedUserProfile,
    FileDetail? profileImage,
  }) {
    return ProfileState(
      isReminderNotificationPermissionGranted:
          isReminderNotificationPermissionGranted ??
          this.isReminderNotificationPermissionGranted,

      updatingProfileStatus:
          updatingProfileStatus ?? this.updatingProfileStatus,
      readProfileStatus: readProfileStatus ?? this.readProfileStatus,
      uploadingImageProfileStatus:
          uploadingImageProfileStatus ?? this.uploadingImageProfileStatus,
      readProfileImageStatus:
          readProfileImageStatus ?? this.readProfileImageStatus,
      userProfile: userProfile ?? this.userProfile,
      updatedUserProfile: updatedUserProfile ?? this.updatedUserProfile,
      profileImage: profileImage ?? this.profileImage,
      subscriptions: subscriptions ?? this.subscriptions,
      readSubscriptionStatus:
          readSubscriptionStatus ?? this.readSubscriptionStatus,
    );
  }

  @override
  List<Object?> get props => [
    isReminderNotificationPermissionGranted,
    updatingProfileStatus,
    readProfileStatus,
    readProfileImageStatus,
    uploadingImageProfileStatus,
    userProfile,
    updatedUserProfile,
    profileImage,
    subscriptions,
    readSubscriptionStatus,
  ];
}
