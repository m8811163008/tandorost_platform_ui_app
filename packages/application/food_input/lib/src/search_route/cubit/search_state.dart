part of 'search_cubit.dart';

@immutable
class SearchState extends Equatable {
  final String foodName;
  final FileData? voiceData;
  final AsyncProcessingStatus searchFoodsByTextInputStatus;
  final AsyncProcessingStatus searchFoodsByVoiceInputStatus;
  final AsyncProcessingStatus canRequestForFoodNutritionStatus;
  final Language? userSpokenLanguage;
  final bool canRequestForFoodNutrition;

  const SearchState({
    this.foodName = '',
    this.searchFoodsByTextInputStatus = AsyncProcessingStatus.inital,
    this.searchFoodsByVoiceInputStatus = AsyncProcessingStatus.inital,
    this.canRequestForFoodNutritionStatus= AsyncProcessingStatus.inital,
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
  ];
  SearchState copyWith({
    String? foodName,
    Language? userSpokenLanguage,
    ValueGetter<FileData?>? voiceData,
    AsyncProcessingStatus? searchFoodsByTextInputStatus,
    AsyncProcessingStatus? searchFoodsByVoiceInputStatus,
    AsyncProcessingStatus? canRequestForFoodNutritionStatus,
    bool? canRequestForFoodNutrition,
  }) {
    return SearchState(
      userSpokenLanguage: userSpokenLanguage ?? this.userSpokenLanguage,
      foodName: foodName ?? this.foodName,
      voiceData: voiceData != null ? voiceData() : this.voiceData,
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
