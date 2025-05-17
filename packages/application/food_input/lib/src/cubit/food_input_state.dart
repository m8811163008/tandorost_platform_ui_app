part of 'food_input_cubit.dart';

@immutable
class FoodInputState extends Equatable{
  final TextInput? foodName;
  final FileData? voiceData;
  final AsyncProcessingStatus searchFoodsStatus;
  final List<Food> result;

  const FoodInputState({
    this.searchFoodsStatus = AsyncProcessingStatus.inital,
    this.result = const [],
    this.foodName,
    this.voiceData,
  });

  FoodInputState copyWith({
    ValueGetter<TextInput?>? foodName,
    ValueGetter<FileData?>? voiceData,
    AsyncProcessingStatus? searchFoodsStatus,
    List<Food>? result,
  }) {
    return FoodInputState(
      foodName: foodName != null ? foodName() : this.foodName,
      voiceData: voiceData != null ? voiceData() : this.voiceData,
      searchFoodsStatus: searchFoodsStatus ?? this.searchFoodsStatus,
      result: result ?? this.result,
    );
  }

@override
List<Object?> get props => [foodName, voiceData, searchFoodsStatus, result];
}
