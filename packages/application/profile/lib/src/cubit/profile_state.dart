part of 'profile_cubit.dart';

@immutable
class ProfileState extends Equatable {
  const ProfileState({
    this.isReminderNotificationPermissionGranted = false,
    this.updatingProfileStatus = AsyncProcessingStatus.inital,
    this.uploadingImageProfileStatus = AsyncProcessingStatus.inital,
    this.readProfileImageStatus = AsyncProcessingStatus.inital,
    this.readProfileStatus = AsyncProcessingStatus.inital,
    this.readCoachProfileStatus = AsyncProcessingStatus.inital,
    this.updateCoachProfileStatus = AsyncProcessingStatus.inital,
    this.readSubscriptionStatus = AsyncProcessingStatus.inital,
    this.subscriptions = const [],
    this.userProfile,
    this.updatedUserProfile,
    this.coachProfile,
    this.updatedCoachProfile,
    this.profileImage,
  });

  final bool isReminderNotificationPermissionGranted;
  final AsyncProcessingStatus updatingProfileStatus;
  final AsyncProcessingStatus readProfileStatus;
  final AsyncProcessingStatus readProfileImageStatus;
  final AsyncProcessingStatus uploadingImageProfileStatus;
  final AsyncProcessingStatus readSubscriptionStatus;
  final AsyncProcessingStatus readCoachProfileStatus;
  final AsyncProcessingStatus updateCoachProfileStatus;
  final UserProfile? userProfile;
  final UserProfile? updatedUserProfile;
  final CoachProfile? coachProfile;
  final CoachProfile? updatedCoachProfile;
  final FileDetail? profileImage;
  final List<SubscriptionPayment> subscriptions;

  ProfileState copyWith({
    bool? isReminderNotificationPermissionGranted,

    AsyncProcessingStatus? updatingProfileStatus,
    AsyncProcessingStatus? readProfileStatus,
    AsyncProcessingStatus? readProfileImageStatus,
    AsyncProcessingStatus? uploadingImageProfileStatus,
    AsyncProcessingStatus? readSubscriptionStatus,
    AsyncProcessingStatus? readCoachProfileStatus,
    AsyncProcessingStatus? updateCoachProfileStatus,
    List<SubscriptionPayment>? subscriptions,
    UserProfile? userProfile,
    UserProfile? updatedUserProfile,
    CoachProfile? coachProfile,
    CoachProfile? updatedCoachProfile,
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
      readCoachProfileStatus:
          readCoachProfileStatus ?? this.readCoachProfileStatus,
      updateCoachProfileStatus:
          updateCoachProfileStatus ?? this.updateCoachProfileStatus,
      userProfile: userProfile ?? this.userProfile,
      updatedUserProfile: updatedUserProfile ?? this.updatedUserProfile,
      coachProfile: coachProfile ?? this.coachProfile,
      updatedCoachProfile: updatedCoachProfile ?? this.updatedCoachProfile,
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
    readCoachProfileStatus,
    updateCoachProfileStatus,
    userProfile,
    updatedUserProfile,
    coachProfile,
    updatedCoachProfile,
    profileImage,
    subscriptions,
    readSubscriptionStatus,
  ];
}
