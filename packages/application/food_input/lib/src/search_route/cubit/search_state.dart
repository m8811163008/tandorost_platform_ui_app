part of 'search_cubit.dart';

@immutable
class SearchState extends Equatable {
  final TextInput foodName;
  final FileData? voiceData;
  final AsyncProcessingStatus searchFoodsStatus;

  const SearchState({
    this.foodName = const TextInput.pure(''),
    this.searchFoodsStatus = AsyncProcessingStatus.inital,
    this.voiceData,
  });

  @override
  List<Object?> get props => [foodName, voiceData, searchFoodsStatus];
  SearchState copyWith({
    TextInput? foodName,
    ValueGetter<FileData?>? voiceData,
    AsyncProcessingStatus? searchFoodsStatus,
  }) {
    return SearchState(
      foodName: foodName ?? this.foodName,
      voiceData: voiceData != null ? voiceData() : this.voiceData,
      searchFoodsStatus: searchFoodsStatus ?? this.searchFoodsStatus,
    );
  }
}
