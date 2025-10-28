part of 'payment_cubit.dart';

class PaymentState extends Equatable {
  final CafeBazzarPaymentInfo? cafeBazzarPaymentInfo;
  final AsyncProcessingStatus readCoffeBazzarPaymentStatus;
  final AsyncProcessingStatus coffeBazzarConnectionStatus;
  final AsyncProcessingStatus onCreateSubscriptionPaymentsStatus;
  final AsyncProcessingStatus onCafeBazzarSubscribeStatus;
  final AsyncProcessingStatus onReadCafeBazzarSkusStatus;
  final AsyncProcessingStatus onReadUserProfileStatus;
  final AsyncProcessingStatus onUpsertingProgramEnrollmentStatus;
  final List<SkuDetails> skuDetails;
  final SubscriptionPayment? subscriptionPayment;
  final PurchaseInfo? purchaseInfo;
  final UserProfile? userProfile;
  final String? exceptionDetail;
  final CoachProgram? selectedCoachProgram;
  final List<Referral> referrals;

  const PaymentState({
    this.readCoffeBazzarPaymentStatus = AsyncProcessingStatus.inital,
    this.coffeBazzarConnectionStatus = AsyncProcessingStatus.inital,
    this.onCreateSubscriptionPaymentsStatus = AsyncProcessingStatus.inital,
    this.onCafeBazzarSubscribeStatus = AsyncProcessingStatus.inital,
    this.onReadCafeBazzarSkusStatus = AsyncProcessingStatus.inital,
    this.onReadUserProfileStatus = AsyncProcessingStatus.inital,
    this.onUpsertingProgramEnrollmentStatus = AsyncProcessingStatus.inital,
    this.skuDetails = const [],
    this.referrals = const [],
    this.cafeBazzarPaymentInfo,
    this.userProfile,
    this.selectedCoachProgram,
    this.purchaseInfo,
    this.exceptionDetail,
    this.subscriptionPayment,
  });

  @override
  List<Object?> get props => [
    cafeBazzarPaymentInfo,
    readCoffeBazzarPaymentStatus,
    coffeBazzarConnectionStatus,
    onCreateSubscriptionPaymentsStatus,
    onReadUserProfileStatus,
    onCafeBazzarSubscribeStatus,
    purchaseInfo,
    userProfile,
    exceptionDetail,
    onReadCafeBazzarSkusStatus,
    skuDetails,
    subscriptionPayment,
    selectedCoachProgram,
    onUpsertingProgramEnrollmentStatus,
    referrals,
  ];
  PaymentState copyWith({
    ValueGetter<CafeBazzarPaymentInfo?>? cafeBazzarPaymentInfo,
    ValueGetter<PurchaseInfo?>? purchaseInfo,
    ValueGetter<UserProfile?>? userProfile,
    AsyncProcessingStatus? readCoffeBazzarPaymentStatus,
    AsyncProcessingStatus? coffeBazzarConnectionStatus,
    AsyncProcessingStatus? onCreateSubscriptionPaymentsStatus,
    AsyncProcessingStatus? onCafeBazzarSubscribeStatus,
    AsyncProcessingStatus? onReadCafeBazzarSkusStatus,
    AsyncProcessingStatus? onReadUserProfileStatus,
    AsyncProcessingStatus? onUpsertingProgramEnrollmentStatus,
    List<SkuDetails>? skuDetails,
    List<Referral>? referrals,
    SubscriptionPayment? subscriptionPayment,
    ValueGetter<String?>? exceptionDetail,
    CoachProgram? selectedCoachProgram,
  }) {
    return PaymentState(
      purchaseInfo: purchaseInfo != null ? purchaseInfo() : this.purchaseInfo,
      userProfile: userProfile != null ? userProfile() : this.userProfile,
      exceptionDetail: exceptionDetail != null
          ? exceptionDetail()
          : this.exceptionDetail,
      cafeBazzarPaymentInfo: cafeBazzarPaymentInfo != null
          ? cafeBazzarPaymentInfo()
          : this.cafeBazzarPaymentInfo,
      onCafeBazzarSubscribeStatus:
          onCafeBazzarSubscribeStatus ?? this.onCafeBazzarSubscribeStatus,
      onReadCafeBazzarSkusStatus:
          onReadCafeBazzarSkusStatus ?? this.onReadCafeBazzarSkusStatus,
      onReadUserProfileStatus:
          onReadUserProfileStatus ?? this.onReadUserProfileStatus,
      readCoffeBazzarPaymentStatus:
          readCoffeBazzarPaymentStatus ?? this.readCoffeBazzarPaymentStatus,
      onUpsertingProgramEnrollmentStatus:
          onUpsertingProgramEnrollmentStatus ??
          this.onUpsertingProgramEnrollmentStatus,
      skuDetails: skuDetails ?? this.skuDetails,
      onCreateSubscriptionPaymentsStatus:
          onCreateSubscriptionPaymentsStatus ??
          this.onCreateSubscriptionPaymentsStatus,
      coffeBazzarConnectionStatus:
          coffeBazzarConnectionStatus ?? this.coffeBazzarConnectionStatus,
      subscriptionPayment: subscriptionPayment ?? this.subscriptionPayment,
      selectedCoachProgram: selectedCoachProgram ?? this.selectedCoachProgram,
      referrals: referrals ?? this.referrals,
    );
  }
}
