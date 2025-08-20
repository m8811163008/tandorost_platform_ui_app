part of 'payment_cubit.dart';

class PaymentState extends Equatable {
  final CafeBazzarPaymentInfo? cafeBazzarPaymentInfo;
  final AsyncProcessingStatus readCoffeBazzarPaymentStatus;
  final AsyncProcessingStatus coffeBazzarConnectionStatus;
  final AsyncProcessingStatus onCreateSubscriptionPaymentsStatus;
  final AsyncProcessingStatus onCafeBazzarSubscribeStatus;
  final AsyncProcessingStatus onReadCafeBazzarSkusStatus;
  final AsyncProcessingStatus onReadUserProfileStatus;
  final List<SkuDetails> skuDetails;
  final SubscriptionPayment? subscriptionPayment;
  final PurchaseInfo? purchaseInfo;
  final UserProfile? userProfile;
  final String? exceptionDetail;
  final SubscriptionType? selectedSubscriptionType;

  const PaymentState({
    this.readCoffeBazzarPaymentStatus = AsyncProcessingStatus.inital,
    this.coffeBazzarConnectionStatus = AsyncProcessingStatus.inital,
    this.onCreateSubscriptionPaymentsStatus = AsyncProcessingStatus.inital,
    this.onCafeBazzarSubscribeStatus = AsyncProcessingStatus.inital,
    this.onReadCafeBazzarSkusStatus = AsyncProcessingStatus.inital,
    this.onReadUserProfileStatus = AsyncProcessingStatus.inital,
    this.skuDetails = const [],
    this.cafeBazzarPaymentInfo,
    this.userProfile,
    this.selectedSubscriptionType,
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
    selectedSubscriptionType,
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
    List<SkuDetails>? skuDetails,
    SubscriptionPayment? subscriptionPayment,
    ValueGetter<String?>? exceptionDetail,
    SubscriptionType? selectedSubscriptionType,
  }) {
    return PaymentState(
      selectedSubscriptionType:
          selectedSubscriptionType ?? this.selectedSubscriptionType,

      purchaseInfo: purchaseInfo != null ? purchaseInfo() : this.purchaseInfo,
      userProfile: userProfile != null ? userProfile() : this.userProfile,
      exceptionDetail:
          exceptionDetail != null ? exceptionDetail() : this.exceptionDetail,
      cafeBazzarPaymentInfo:
          cafeBazzarPaymentInfo != null
              ? cafeBazzarPaymentInfo()
              : this.cafeBazzarPaymentInfo,
      onCafeBazzarSubscribeStatus:
          onCafeBazzarSubscribeStatus ?? this.onCafeBazzarSubscribeStatus,
      onReadCafeBazzarSkusStatus:
          onReadCafeBazzarSkusStatus ?? this.onReadCafeBazzarSkusStatus,
      onReadUserProfileStatus:
          onReadUserProfileStatus ?? this.onReadUserProfileStatus,
      skuDetails: skuDetails ?? this.skuDetails,
      onCreateSubscriptionPaymentsStatus:
          onCreateSubscriptionPaymentsStatus ??
          this.onCreateSubscriptionPaymentsStatus,
      coffeBazzarConnectionStatus:
          coffeBazzarConnectionStatus ?? this.coffeBazzarConnectionStatus,
      subscriptionPayment: subscriptionPayment ?? this.subscriptionPayment,
    );
  }
}
