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
    this.readUserImageGallaryStatus = AsyncProcessingStatus.inital,
    this.addUserImageStatus = AsyncProcessingStatus.inital,
    this.archivingImagesStatus = AsyncProcessingStatus.inital,
    this.readingCoachProgram = AsyncProcessingStatus.inital,
    this.deletingCoachProgram = AsyncProcessingStatus.inital,
    this.updatingCoachProgram = AsyncProcessingStatus.inital,
    this.subscriptions = const [],
    this.filesData = const [],
    this.filesDetail = const [],
    this.archiveImagesId = const [],
    this.userProfile,
    this.updatedUserProfile,
    this.coachProfile,
    this.updatedCoachProfile,
    this.profileImage,
    this.coachPrograms = const [],
    this.cacheCoachProgram,
  });

  final bool isReminderNotificationPermissionGranted;
  final AsyncProcessingStatus updatingProfileStatus;
  final AsyncProcessingStatus readProfileStatus;
  final AsyncProcessingStatus readProfileImageStatus;
  final AsyncProcessingStatus uploadingImageProfileStatus;
  final AsyncProcessingStatus readSubscriptionStatus;
  final AsyncProcessingStatus readCoachProfileStatus;
  final AsyncProcessingStatus updateCoachProfileStatus;
  final AsyncProcessingStatus readUserImageGallaryStatus;
  final AsyncProcessingStatus addUserImageStatus;
  final AsyncProcessingStatus archivingImagesStatus;

  final List<FileData> filesData;
  final List<FileDetail> filesDetail;
  final List<String> archiveImagesId;
  final UserProfile? userProfile;
  final UserProfile? updatedUserProfile;
  final CoachProfile? coachProfile;
  final CoachProfile? updatedCoachProfile;
  final FileDetail? profileImage;
  final List<SubscriptionPayment> subscriptions;
  final List<CoachProgram> coachPrograms;
  final CoachProgram? cacheCoachProgram;
  final AsyncProcessingStatus readingCoachProgram;
  final AsyncProcessingStatus deletingCoachProgram;
  final AsyncProcessingStatus updatingCoachProgram;

  ProfileState copyWith({
    bool? isReminderNotificationPermissionGranted,

    AsyncProcessingStatus? updatingProfileStatus,
    AsyncProcessingStatus? readProfileStatus,
    AsyncProcessingStatus? readProfileImageStatus,
    AsyncProcessingStatus? uploadingImageProfileStatus,
    AsyncProcessingStatus? readSubscriptionStatus,
    AsyncProcessingStatus? readCoachProfileStatus,
    AsyncProcessingStatus? updateCoachProfileStatus,
    AsyncProcessingStatus? readingCoachProgram,
    AsyncProcessingStatus? deletingCoachProgram,
    AsyncProcessingStatus? upsertingCoachProgram,
    List<SubscriptionPayment>? subscriptions,
    UserProfile? userProfile,
    UserProfile? updatedUserProfile,
    CoachProfile? coachProfile,
    CoachProfile? updatedCoachProfile,
    FileDetail? profileImage,
    List<CoachProgram>? coachPrograms,
    CoachProgram? cacheCoachProgram,

    AsyncProcessingStatus? readUserImageGallaryStatus,
    AsyncProcessingStatus? addUserImageStatus,
    AsyncProcessingStatus? archivingImagesStatus,

    List<FileData>? filesData,
    List<FileDetail>? filesDetail,
    List<String>? archiveImagesId,
  }) {
    return ProfileState(
      isReminderNotificationPermissionGranted:
          isReminderNotificationPermissionGranted ??
          this.isReminderNotificationPermissionGranted,
      coachPrograms: coachPrograms ?? this.coachPrograms,
      cacheCoachProgram: cacheCoachProgram ?? this.cacheCoachProgram,
      updatingProfileStatus:
          updatingProfileStatus ?? this.updatingProfileStatus,
      readingCoachProgram: readingCoachProgram ?? this.readingCoachProgram,
      deletingCoachProgram: deletingCoachProgram ?? this.deletingCoachProgram,
      updatingCoachProgram: upsertingCoachProgram ?? this.updatingCoachProgram,
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
      readUserImageGallaryStatus:
          readUserImageGallaryStatus ?? this.readUserImageGallaryStatus,
      addUserImageStatus: addUserImageStatus ?? this.addUserImageStatus,
      archivingImagesStatus:
          archivingImagesStatus ?? this.archivingImagesStatus,
      filesData: filesData ?? this.filesData,
      filesDetail: filesDetail ?? this.filesDetail,
      archiveImagesId: archiveImagesId ?? this.archiveImagesId,
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
    readUserImageGallaryStatus,
    addUserImageStatus,
    archivingImagesStatus,
    filesData,
    filesDetail,
    archiveImagesId,
    coachPrograms,
    cacheCoachProgram,
    readingCoachProgram,
    deletingCoachProgram,
    updatingCoachProgram,
  ];
}
