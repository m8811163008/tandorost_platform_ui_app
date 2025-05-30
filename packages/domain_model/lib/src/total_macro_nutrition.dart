import 'package:equatable/equatable.dart';

class TotalMacroNutrition extends Equatable {
  final int fat;
  final int carbohydrateFruitsOrNonStarchyVegetables;
  final int carbohydrateOthers;
  final int protein;
  final int calorie;

  const TotalMacroNutrition({
    required this.fat,
    required this.carbohydrateFruitsOrNonStarchyVegetables,
    required this.carbohydrateOthers,
    required this.protein,
    required this.calorie,
  });

  @override
  List<Object?> get props => [
    fat,
    carbohydrateFruitsOrNonStarchyVegetables,
    carbohydrateOthers,
    protein,
    calorie,
  ];
}
