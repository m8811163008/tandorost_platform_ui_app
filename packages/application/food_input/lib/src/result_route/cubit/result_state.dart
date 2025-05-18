part of 'result_cubit.dart';

@immutable
class ResultState {
  final List<Food> foods;
  final AsyncProcessingStatus updatingStatus;
  final AsyncProcessingStatus deletingStatus;

  const ResultState({
    this.foods = const [],
    this.updatingStatus = AsyncProcessingStatus.inital,
    this.deletingStatus = AsyncProcessingStatus.inital,
  });

  @override
  List<Object?> get props => [foods, updatingStatus, deletingStatus];
  ResultState copyWith({
    List<Food>? foods,
    AsyncProcessingStatus? updatingStatus,
    AsyncProcessingStatus? deletingStatus,
  }) {
    return ResultState(
      foods: foods ?? this.foods,
      updatingStatus: updatingStatus ?? this.updatingStatus,
      deletingStatus: deletingStatus ?? this.deletingStatus,
    );
  }
}
