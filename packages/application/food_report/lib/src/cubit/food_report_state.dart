part of 'food_report_cubit.dart';

class FoodReportState extends Equatable {
  const FoodReportState({
    this.foods = const [],
    this.readFoodsNutritionStatus = AsyncProcessingStatus.inital,
    this.updateFoodsNutritionsStatus = AsyncProcessingStatus.inital,
    this.deleteFoodsNutritionsStatus = AsyncProcessingStatus.inital,
    this.readNutritionRequirementsStatus = AsyncProcessingStatus.inital,
    this.nutritionRequirements,
  });

  final List<Food> foods;
  final NutritionRequirements? nutritionRequirements;

  final AsyncProcessingStatus readFoodsNutritionStatus;
  final AsyncProcessingStatus updateFoodsNutritionsStatus;
  final AsyncProcessingStatus deleteFoodsNutritionsStatus;

  final AsyncProcessingStatus readNutritionRequirementsStatus;

  FoodReportState copyWith({
    List<Food>? foods,
    ValueGetter<NutritionRequirements?>? nutritionRequirements,
    AsyncProcessingStatus? readFoodsNutritionStatus,
    AsyncProcessingStatus? updateFoodsNutritionsStatus,
    AsyncProcessingStatus? deleteFoodsNutritionsStatus,
    AsyncProcessingStatus? readNutritionRequirementsStatus,
  }) {
    return FoodReportState(
      foods: foods ?? this.foods,
      nutritionRequirements:
          nutritionRequirements != null
              ? nutritionRequirements()
              : this.nutritionRequirements,
      readFoodsNutritionStatus:
          readFoodsNutritionStatus ?? this.readFoodsNutritionStatus,
      updateFoodsNutritionsStatus:
          updateFoodsNutritionsStatus ?? this.updateFoodsNutritionsStatus,
      deleteFoodsNutritionsStatus:
          deleteFoodsNutritionsStatus ?? this.deleteFoodsNutritionsStatus,
      readNutritionRequirementsStatus:
          readNutritionRequirementsStatus ??
          this.readNutritionRequirementsStatus,
    );
  }

  @override
  List<Object?> get props => [
    foods,
    nutritionRequirements,
    readFoodsNutritionStatus,
    updateFoodsNutritionsStatus,
    deleteFoodsNutritionsStatus,
    readNutritionRequirementsStatus,
  ];
}
