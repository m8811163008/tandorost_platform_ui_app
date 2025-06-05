part of 'search_cubit.dart';

@immutable
class SearchState extends Equatable {
  final String foodName;
  final FileData? voiceData;
  final CafeBazzarPaymentInfo? cafeBazzarPaymentInfo;
  final AsyncProcessingStatus searchFoodsByTextInputStatus;
  final AsyncProcessingStatus searchFoodsByVoiceInputStatus;
  final AsyncProcessingStatus canRequestForFoodNutritionStatus;
  final AsyncProcessingStatus readCoffeBazzarPaymentStatus;
  final AsyncProcessingStatus coffeBazzarConnectionStatus;
  final AsyncProcessingStatus onCreateSubscriptionPaymentsStatus;
  final AsyncProcessingStatus onCafeBazzarSubscribeStatus;
  final AsyncProcessingStatus onReadCafeBazzarSkusStatus;
  final AsyncProcessingStatus onReadUserProfileStatus;
  final List<SkuDetails> skuDetails;
  final SubscriptionPayment? subscriptionPayment;
  final bool isRecorderPermissionAllowed;

  final Language? userSpokenLanguage;
  final bool canRequestForFoodNutrition;
  final PurchaseInfo? purchaseInfo;
  final UserProfile? userProfile;
  final String? exceptionDetail;
  final SubscriptionType? selectedSubscriptionType;

  const SearchState({
    this.foodName = '',

    this.searchFoodsByTextInputStatus = AsyncProcessingStatus.inital,
    this.searchFoodsByVoiceInputStatus = AsyncProcessingStatus.inital,
    this.canRequestForFoodNutritionStatus = AsyncProcessingStatus.inital,
    this.readCoffeBazzarPaymentStatus = AsyncProcessingStatus.inital,
    this.coffeBazzarConnectionStatus = AsyncProcessingStatus.inital,
    this.onCreateSubscriptionPaymentsStatus = AsyncProcessingStatus.inital,
    this.onCafeBazzarSubscribeStatus = AsyncProcessingStatus.inital,
    this.onReadCafeBazzarSkusStatus = AsyncProcessingStatus.inital,
    this.onReadUserProfileStatus = AsyncProcessingStatus.inital,
    this.skuDetails = const [],
    this.cafeBazzarPaymentInfo,
    this.voiceData,
    this.userSpokenLanguage,
    this.userProfile,
    this.selectedSubscriptionType,
    this.purchaseInfo,
    this.exceptionDetail,
    this.subscriptionPayment,
    this.isRecorderPermissionAllowed = false,
    this.canRequestForFoodNutrition = true,
  });

  @override
  List<Object?> get props => [
    foodName,
    voiceData,
    searchFoodsByTextInputStatus,
    userSpokenLanguage,
    searchFoodsByVoiceInputStatus,
    canRequestForFoodNutrition,
    canRequestForFoodNutritionStatus,
    cafeBazzarPaymentInfo,
    readCoffeBazzarPaymentStatus,
    coffeBazzarConnectionStatus,
    onCreateSubscriptionPaymentsStatus,
    onReadUserProfileStatus,
    onCafeBazzarSubscribeStatus,
    purchaseInfo,
    userProfile,
    exceptionDetail,
    isRecorderPermissionAllowed,
    onReadCafeBazzarSkusStatus,
    skuDetails,
    subscriptionPayment,
    selectedSubscriptionType,
  ];
  SearchState copyWith({
    String? foodName,
    ValueGetter<Language?>? userSpokenLanguage,
    ValueGetter<CafeBazzarPaymentInfo?>? cafeBazzarPaymentInfo,
    ValueGetter<FileData?>? voiceData,
    ValueGetter<PurchaseInfo?>? purchaseInfo,
    ValueGetter<UserProfile?>? userProfile,
    AsyncProcessingStatus? searchFoodsByTextInputStatus,
    AsyncProcessingStatus? searchFoodsByVoiceInputStatus,
    AsyncProcessingStatus? canRequestForFoodNutritionStatus,
    AsyncProcessingStatus? readCoffeBazzarPaymentStatus,
    AsyncProcessingStatus? coffeBazzarConnectionStatus,
    AsyncProcessingStatus? onCreateSubscriptionPaymentsStatus,
    AsyncProcessingStatus? onCafeBazzarSubscribeStatus,
    AsyncProcessingStatus? onReadCafeBazzarSkusStatus,
    AsyncProcessingStatus? onReadUserProfileStatus,
    List<SkuDetails>? skuDetails,
    bool? canRequestForFoodNutrition,
    bool? isRecorderPermissionAllowed,
    SubscriptionPayment? subscriptionPayment,
    ValueGetter<String?>? exceptionDetail,
    SubscriptionType? selectedSubscriptionType,
  }) {
    return SearchState(
      foodName: foodName ?? this.foodName,
      selectedSubscriptionType:
          selectedSubscriptionType ?? this.selectedSubscriptionType,
      voiceData: voiceData != null ? voiceData() : this.voiceData,
      purchaseInfo: purchaseInfo != null ? purchaseInfo() : this.purchaseInfo,
      userProfile: userProfile != null ? userProfile() : this.userProfile,
      userSpokenLanguage:
          userSpokenLanguage != null
              ? userSpokenLanguage()
              : this.userSpokenLanguage,
      exceptionDetail:
          exceptionDetail != null ? exceptionDetail() : this.exceptionDetail,
      cafeBazzarPaymentInfo:
          cafeBazzarPaymentInfo != null
              ? cafeBazzarPaymentInfo()
              : this.cafeBazzarPaymentInfo,
      searchFoodsByTextInputStatus:
          searchFoodsByTextInputStatus ?? this.searchFoodsByTextInputStatus,
      onCafeBazzarSubscribeStatus:
          onCafeBazzarSubscribeStatus ?? this.onCafeBazzarSubscribeStatus,
      searchFoodsByVoiceInputStatus:
          searchFoodsByVoiceInputStatus ?? this.searchFoodsByVoiceInputStatus,
      canRequestForFoodNutrition:
          canRequestForFoodNutrition ?? this.canRequestForFoodNutrition,
      onReadCafeBazzarSkusStatus:
          onReadCafeBazzarSkusStatus ?? this.onReadCafeBazzarSkusStatus,
      onReadUserProfileStatus:
          onReadUserProfileStatus ?? this.onReadUserProfileStatus,
      skuDetails: skuDetails ?? this.skuDetails,
      isRecorderPermissionAllowed:
          isRecorderPermissionAllowed ?? this.isRecorderPermissionAllowed,
      canRequestForFoodNutritionStatus:
          canRequestForFoodNutritionStatus ??
          this.canRequestForFoodNutritionStatus,
      onCreateSubscriptionPaymentsStatus:
          onCreateSubscriptionPaymentsStatus ??
          this.onCreateSubscriptionPaymentsStatus,
      coffeBazzarConnectionStatus:
          coffeBazzarConnectionStatus ?? this.coffeBazzarConnectionStatus,
      subscriptionPayment: subscriptionPayment ?? this.subscriptionPayment,
    );
  }
}
