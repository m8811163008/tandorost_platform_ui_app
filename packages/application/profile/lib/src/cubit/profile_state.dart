part of 'profile_cubit.dart';

@immutable
class ProfileState extends Equatable {
  const ProfileState({
    this.changeWeightSpeed = ChangeWeightSpeed.constant,
    this.isTimeRestrictedEating = false,
    this.isReminderNotificationPermissionGranted = false,
    this.language = Language.english,
    this.name = '',
    this.phoneNumber = '',
    this.updatingProfileStatus = AsyncProcessingStatus.inital,
    this.uploadingImageProfileStatus = AsyncProcessingStatus.inital,
    this.readProfileImageStatus = AsyncProcessingStatus.inital,
    this.readProfileStatus = AsyncProcessingStatus.inital,
    this.readSubscriptionStatus = AsyncProcessingStatus.inital,
    this.subscriptions = const [],
    this.userProfile,
    this.profileImage,
  });

  final ChangeWeightSpeed changeWeightSpeed;
  final bool isTimeRestrictedEating;
  final bool isReminderNotificationPermissionGranted;
  final Language language;
  final String name;
  final String phoneNumber;
  final AsyncProcessingStatus updatingProfileStatus;
  final AsyncProcessingStatus readProfileStatus;
  final AsyncProcessingStatus readProfileImageStatus;
  final AsyncProcessingStatus uploadingImageProfileStatus;
  final AsyncProcessingStatus readSubscriptionStatus;
  final UserProfile? userProfile;
  final FileDetail? profileImage;
  final List<SubscriptionPayment> subscriptions;

  ProfileState copyWith({
    ChangeWeightSpeed? changeWeightSpeed,
    bool? isTimeRestrictedEating,
    bool? isReminderNotificationPermissionGranted,
    Language? language,
    String? name,
    String? phoneNumber,
    AsyncProcessingStatus? updatingProfileStatus,
    AsyncProcessingStatus? readProfileStatus,
    AsyncProcessingStatus? readProfileImageStatus,
    AsyncProcessingStatus? uploadingImageProfileStatus,
    AsyncProcessingStatus? readSubscriptionStatus,
    List<SubscriptionPayment>? subscriptions,
    UserProfile? userProfile,
    FileDetail? profileImage,
  }) {
    return ProfileState(
      changeWeightSpeed: changeWeightSpeed ?? this.changeWeightSpeed,
      isTimeRestrictedEating:
          isTimeRestrictedEating ?? this.isTimeRestrictedEating,
      isReminderNotificationPermissionGranted:
          isReminderNotificationPermissionGranted ?? this.isReminderNotificationPermissionGranted,
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
      subscriptions: subscriptions ?? this.subscriptions,
      readSubscriptionStatus:
          readSubscriptionStatus ?? this.readSubscriptionStatus,
    );
  }

  @override
  List<Object?> get props => [
    changeWeightSpeed,
    isTimeRestrictedEating,
    isReminderNotificationPermissionGranted,
    language,
    name,
    phoneNumber,
    updatingProfileStatus,
    readProfileStatus,
    readProfileImageStatus,
    uploadingImageProfileStatus,
    userProfile,
    profileImage,
    subscriptions,
    readSubscriptionStatus,
  ];
}
