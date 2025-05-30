part of 'food_report_cubit.dart';

class FoodReportState extends Equatable {
  const FoodReportState({
    this.foods = const [],
    this.selectedFoods = const [],
    this.readFoodsNutritionStatus = AsyncProcessingStatus.inital,
    this.updateFoodsNutritionsStatus = AsyncProcessingStatus.inital,
    this.deleteFoodsNutritionsStatus = AsyncProcessingStatus.inital,
    this.readNutritionRequirementsStatus = AsyncProcessingStatus.inital,
    this.selectedTab = SelectedTab.restDay,
    this.nutritionRequirements,
  });

  final List<Food> foods;
  final List<Food> selectedFoods;
  final NutritionRequirements? nutritionRequirements;
  final SelectedTab selectedTab;

  final AsyncProcessingStatus readFoodsNutritionStatus;
  final AsyncProcessingStatus updateFoodsNutritionsStatus;
  final AsyncProcessingStatus deleteFoodsNutritionsStatus;

  final AsyncProcessingStatus readNutritionRequirementsStatus;

  TotalMacroNutrition get totalMacroNutrition {
    final fat = foods
        .map((e) => e.macroNutrition.fat)
        .fold(0, (previousValue, element) => previousValue + element);
    final carbohydrateFruitsOrNonStarchyVegetables = foods
        .where((e) => e.carbohydrateSource.isFruitsOrNonStarchyVegetables)
        .map((e) => e.macroNutrition.carbohydrate)
        .fold(0, (previousValue, element) => previousValue + element);
    final carbohydrateOthers = foods
        .where((e) => !e.carbohydrateSource.isFruitsOrNonStarchyVegetables)
        .map((e) => e.macroNutrition.carbohydrate)
        .fold(0, (previousValue, element) => previousValue + element);
    final protein = foods
        .map((e) => e.macroNutrition.protein)
        .fold(0, (previousValue, element) => previousValue + element);
    final calorie = foods
        .map((e) => e.calculatedCalorie)
        .fold(0, (previousValue, element) => previousValue + element);
    return TotalMacroNutrition(
      fat: fat,
      carbohydrateFruitsOrNonStarchyVegetables:
          carbohydrateFruitsOrNonStarchyVegetables,
      carbohydrateOthers: carbohydrateOthers,
      protein: protein,
      calorie: calorie,
    );
  }

  FoodReportState copyWith({
    List<Food>? foods,
    List<Food>? selectedFoods,
    ValueGetter<NutritionRequirements?>? nutritionRequirements,
    AsyncProcessingStatus? readFoodsNutritionStatus,
    AsyncProcessingStatus? updateFoodsNutritionsStatus,
    AsyncProcessingStatus? deleteFoodsNutritionsStatus,
    AsyncProcessingStatus? readNutritionRequirementsStatus,
    SelectedTab? selectedTab,
  }) {
    return FoodReportState(
      foods: foods ?? this.foods,
      selectedFoods: selectedFoods ?? this.selectedFoods,
      selectedTab: selectedTab ?? this.selectedTab,
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
    selectedTab,
  ];
}

enum SelectedTab {
  restDay,
  exerciseDay;

  bool get isRestDay => this == SelectedTab.restDay;
}
