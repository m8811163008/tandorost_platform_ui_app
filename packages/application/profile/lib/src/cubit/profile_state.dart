part of 'profile_cubit.dart';

@immutable
class ProfileState extends Equatable {
  const ProfileState({
    this.isReminderNotificationPermissionGranted = false,
    this.isVerifyPhoneNumber,
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
    this.sendVerificationCodeStatus = AsyncProcessingStatus.inital,
    this.verifyVerificationCodeStatus = AsyncProcessingStatus.inital,
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
    this.verificationCode = '',
  });

  final bool isReminderNotificationPermissionGranted;
  final bool? isVerifyPhoneNumber;
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
  final AsyncProcessingStatus sendVerificationCodeStatus;
  final AsyncProcessingStatus verifyVerificationCodeStatus;

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
  final String verificationCode;

  ProfileState copyWith({
    bool? isReminderNotificationPermissionGranted,
    bool? isVerifyPhoneNumber,
    AsyncProcessingStatus? updatingProfileStatus,
    AsyncProcessingStatus? readProfileStatus,
    AsyncProcessingStatus? readProfileImageStatus,
    AsyncProcessingStatus? uploadingImageProfileStatus,
    AsyncProcessingStatus? readSubscriptionStatus,
    AsyncProcessingStatus? readCoachProfileStatus,
    AsyncProcessingStatus? updateCoachProfileStatus,
    AsyncProcessingStatus? readUserImageGallaryStatus,
    AsyncProcessingStatus? addUserImageStatus,
    AsyncProcessingStatus? archivingImagesStatus,
    AsyncProcessingStatus? sendVerificationCodeStatus,
    AsyncProcessingStatus? verifyVerificationCodeStatus,
    List<FileData>? filesData,
    List<FileDetail>? filesDetail,
    List<String>? archiveImagesId,
    ValueGetter<UserProfile?>? userProfile,
    ValueGetter<UserProfile?>? updatedUserProfile,
    ValueGetter<CoachProfile?>? coachProfile,
    ValueGetter<CoachProfile?>? updatedCoachProfile,
    ValueGetter<FileDetail?>? profileImage,
    List<SubscriptionPayment>? subscriptions,
    List<CoachProgram>? coachPrograms,
    ValueGetter<CoachProgram?>? cacheCoachProgram,
    AsyncProcessingStatus? readingCoachProgram,
    AsyncProcessingStatus? deletingCoachProgram,
    AsyncProcessingStatus? updatingCoachProgram,
    String? verificationCode,
  }) {
    return ProfileState(
      isReminderNotificationPermissionGranted:
          isReminderNotificationPermissionGranted ??
          this.isReminderNotificationPermissionGranted,
      isVerifyPhoneNumber: isVerifyPhoneNumber ?? this.isVerifyPhoneNumber,
      updatingProfileStatus:
          updatingProfileStatus ?? this.updatingProfileStatus,
      readProfileStatus: readProfileStatus ?? this.readProfileStatus,
      readProfileImageStatus:
          readProfileImageStatus ?? this.readProfileImageStatus,
      uploadingImageProfileStatus:
          uploadingImageProfileStatus ?? this.uploadingImageProfileStatus,
      readSubscriptionStatus:
          readSubscriptionStatus ?? this.readSubscriptionStatus,
      readCoachProfileStatus:
          readCoachProfileStatus ?? this.readCoachProfileStatus,
      updateCoachProfileStatus:
          updateCoachProfileStatus ?? this.updateCoachProfileStatus,
      readUserImageGallaryStatus:
          readUserImageGallaryStatus ?? this.readUserImageGallaryStatus,
      addUserImageStatus: addUserImageStatus ?? this.addUserImageStatus,
      archivingImagesStatus:
          archivingImagesStatus ?? this.archivingImagesStatus,
      sendVerificationCodeStatus:
          sendVerificationCodeStatus ?? this.sendVerificationCodeStatus,
      verifyVerificationCodeStatus:
          verifyVerificationCodeStatus ?? this.verifyVerificationCodeStatus,
      filesData: filesData ?? this.filesData,
      filesDetail: filesDetail ?? this.filesDetail,
      archiveImagesId: archiveImagesId ?? this.archiveImagesId,
      userProfile: userProfile != null ? userProfile() : this.userProfile,
      updatedUserProfile: updatedUserProfile != null
          ? updatedUserProfile()
          : this.updatedUserProfile,
      coachProfile: coachProfile != null ? coachProfile() : this.coachProfile,
      updatedCoachProfile: updatedCoachProfile != null
          ? updatedCoachProfile()
          : this.updatedCoachProfile,
      profileImage: profileImage != null ? profileImage() : this.profileImage,
      subscriptions: subscriptions ?? this.subscriptions,
      coachPrograms: coachPrograms ?? this.coachPrograms,
      cacheCoachProgram: cacheCoachProgram != null
          ? cacheCoachProgram()
          : this.cacheCoachProgram,
      readingCoachProgram: readingCoachProgram ?? this.readingCoachProgram,
      deletingCoachProgram: deletingCoachProgram ?? this.deletingCoachProgram,
      updatingCoachProgram: updatingCoachProgram ?? this.updatingCoachProgram,
      verificationCode: verificationCode ?? this.verificationCode,
    );
  }

  @override
  List<Object?> get props => [
    isReminderNotificationPermissionGranted,
    updatingProfileStatus,
    readProfileStatus,
    readProfileImageStatus,
    uploadingImageProfileStatus,
    readSubscriptionStatus,
    readCoachProfileStatus,
    updateCoachProfileStatus,
    readUserImageGallaryStatus,
    addUserImageStatus,
    archivingImagesStatus,
    sendVerificationCodeStatus,
    verifyVerificationCodeStatus,
    filesData,
    filesDetail,
    archiveImagesId,
    userProfile,
    updatedUserProfile,
    coachProfile,
    updatedCoachProfile,
    isVerifyPhoneNumber,
    profileImage,
    subscriptions,
    coachPrograms,
    cacheCoachProgram,
    readingCoachProgram,
    deletingCoachProgram,
    updatingCoachProgram,
    verificationCode,
  ];
}
