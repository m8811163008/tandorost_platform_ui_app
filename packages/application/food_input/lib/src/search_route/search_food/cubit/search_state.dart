part of 'search_cubit.dart';

@immutable
class SearchState extends Equatable {
  final String foodName;
  final FileData? voiceData;
  final bool isRecorderPermissionAllowed;
  final Language? userSpokenLanguage;
  final bool canRequestForFoodNutrition;
  final AsyncProcessingStatus searchFoodsByTextInputStatus;
  final AsyncProcessingStatus searchFoodsByVoiceInputStatus;
  final AsyncProcessingStatus canRequestForFoodNutritionStatus;

  const SearchState({
    this.foodName = '',
    this.searchFoodsByTextInputStatus = AsyncProcessingStatus.inital,
    this.searchFoodsByVoiceInputStatus = AsyncProcessingStatus.inital,
    this.canRequestForFoodNutritionStatus = AsyncProcessingStatus.inital,
    this.voiceData,
    this.userSpokenLanguage,
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
  ];
  SearchState copyWith({
    String? foodName,
    ValueGetter<Language?>? userSpokenLanguage,
    ValueGetter<FileData?>? voiceData,
    AsyncProcessingStatus? searchFoodsByTextInputStatus,
    AsyncProcessingStatus? searchFoodsByVoiceInputStatus,
    AsyncProcessingStatus? canRequestForFoodNutritionStatus,
    AsyncProcessingStatus? readCoffeBazzarPaymentStatus,
    bool? canRequestForFoodNutrition,
    bool? isRecorderPermissionAllowed,
  }) {
    return SearchState(
      foodName: foodName ?? this.foodName,
      voiceData: voiceData != null ? voiceData() : this.voiceData,
      userSpokenLanguage:
          userSpokenLanguage != null
              ? userSpokenLanguage()
              : this.userSpokenLanguage,
      searchFoodsByTextInputStatus:
          searchFoodsByTextInputStatus ?? this.searchFoodsByTextInputStatus,
      searchFoodsByVoiceInputStatus:
          searchFoodsByVoiceInputStatus ?? this.searchFoodsByVoiceInputStatus,
      canRequestForFoodNutrition:
          canRequestForFoodNutrition ?? this.canRequestForFoodNutrition,
      isRecorderPermissionAllowed:
          isRecorderPermissionAllowed ?? this.isRecorderPermissionAllowed,
      canRequestForFoodNutritionStatus:
          canRequestForFoodNutritionStatus ??
          this.canRequestForFoodNutritionStatus,
    );
  }
}
