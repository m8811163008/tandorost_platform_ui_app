part of 'search_cubit.dart';

@immutable
class SearchState extends Equatable {
  final TextInput foodName;
  final FileData? voiceData;
  final AsyncProcessingStatus searchFoodsStatus;
  final Language? userSpokenLanguage;

  const SearchState({
    this.foodName = const TextInput.pure(''),
    this.searchFoodsStatus = AsyncProcessingStatus.inital,
    this.voiceData,
    this.userSpokenLanguage,
  });

  @override
  List<Object?> get props => [foodName, voiceData, searchFoodsStatus,userSpokenLanguage];
  SearchState copyWith({
    TextInput? foodName,
    Language? userSpokenLanguage,
    ValueGetter<FileData?>? voiceData,
    AsyncProcessingStatus? searchFoodsStatus,
  }) {
    return SearchState(
      userSpokenLanguage: userSpokenLanguage,
      foodName: foodName ?? this.foodName,
      voiceData: voiceData != null ? voiceData() : this.voiceData,
      searchFoodsStatus: searchFoodsStatus ?? this.searchFoodsStatus,
    );
  }
}
