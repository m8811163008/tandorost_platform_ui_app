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
  final Language? userSpokenLanguage;
  final bool canRequestForFoodNutrition;


  const SearchState({
    this.foodName = '',
    
    this.searchFoodsByTextInputStatus = AsyncProcessingStatus.inital,
    this.searchFoodsByVoiceInputStatus = AsyncProcessingStatus.inital,
    this.canRequestForFoodNutritionStatus= AsyncProcessingStatus.inital,
    this.readCoffeBazzarPaymentStatus= AsyncProcessingStatus.inital,
    this.cafeBazzarPaymentInfo,
    this.voiceData,
    this.userSpokenLanguage,
    this.canRequestForFoodNutrition = false,
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
    readCoffeBazzarPaymentStatus
  ];
  SearchState copyWith({
    String? foodName,
    ValueGetter<Language?>? userSpokenLanguage,
    ValueGetter<CafeBazzarPaymentInfo?>? cafeBazzarPaymentInfo,
    ValueGetter<FileData?>? voiceData,
    AsyncProcessingStatus? searchFoodsByTextInputStatus,
    AsyncProcessingStatus? searchFoodsByVoiceInputStatus,
    AsyncProcessingStatus? canRequestForFoodNutritionStatus,
    AsyncProcessingStatus? readCoffeBazzarPaymentStatus,
    bool? canRequestForFoodNutrition,
  }) {
    return SearchState(
      foodName: foodName ?? this.foodName,
      voiceData: voiceData != null ? voiceData() : this.voiceData,
      userSpokenLanguage: userSpokenLanguage != null ? userSpokenLanguage() : this.userSpokenLanguage,
      cafeBazzarPaymentInfo: cafeBazzarPaymentInfo != null ? cafeBazzarPaymentInfo() : this.cafeBazzarPaymentInfo,
      searchFoodsByTextInputStatus:
          searchFoodsByTextInputStatus ?? this.searchFoodsByTextInputStatus,
      searchFoodsByVoiceInputStatus:
          searchFoodsByVoiceInputStatus ?? this.searchFoodsByVoiceInputStatus,
      canRequestForFoodNutrition:
          canRequestForFoodNutrition ?? this.canRequestForFoodNutrition,
      canRequestForFoodNutritionStatus:
          canRequestForFoodNutritionStatus ?? this.canRequestForFoodNutritionStatus,
    );
  }
}
