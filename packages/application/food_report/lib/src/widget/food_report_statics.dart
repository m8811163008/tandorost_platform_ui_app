import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:food_report_app/src/cubit/food_report_cubit.dart';
import 'package:food_report_app/src/widget/food_suggestion_chips.dart';
import 'package:food_report_app/src/widget/user_food_requrement_row.dart';
import 'package:tandorost_components/tandorost_components.dart';

class FoodReportStatics extends StatelessWidget {
  const FoodReportStatics({
    super.key,
    this.nutritionRequirement,
    required this.totalMacroNutrition,
    required this.selectedTab,
  });
  final NutritionRequirement? nutritionRequirement;
  final TotalMacroNutrition totalMacroNutrition;
  final SelectedTab selectedTab;

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(height: context.sizeExtenstion.extraLarge);
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppCardHeader(title: context.l10n.foodReportFoodsStatics),
          UserFoodRequirementRow(
            currentValue: totalMacroNutrition.calorie,
            total: nutritionRequirement?.effectiveTotalDailyEnergyExpenditure,
            macroNutritionLabel: context.l10n.foodEnergy,
            unitOfmeasurement: context.l10n.measurementUnitCalorie,
            color: context.colorExtenstion.energy,
          ),
          gap,
          UserFoodRequirementRow(
            currentValue: totalMacroNutrition.fat,
            total: nutritionRequirement?.fat,
            macroNutritionLabel: context.l10n.fat,
            unitOfmeasurement: context.l10n.measurementUnitGram,
            color: context.colorExtenstion.fat,
          ),
          gap,
          UserFoodRequirementRow(
            currentValue: totalMacroNutrition.protein,
            total: nutritionRequirement?.protein,
            macroNutritionLabel: context.l10n.protein,
            unitOfmeasurement: context.l10n.measurementUnitGram,
            color: context.colorExtenstion.protein,
          ),
          gap,
          UserFoodRequirementRow(
            currentValue: totalMacroNutrition.carbohydrateOthers,
            total: nutritionRequirement?.carbohydrateOther,
            macroNutritionLabel: context.l10n.carbohydrateOthers,
            unitOfmeasurement: context.l10n.measurementUnitGram,
            color: context.colorExtenstion.carbsOther,
          ),
          gap,
          UserFoodRequirementRow(
            currentValue:
                totalMacroNutrition.carbohydrateFruitsOrNonStarchyVegetables,
            total:
                nutritionRequirement?.carbohydrateFruitsOrNonStarchyVegetables,
            macroNutritionLabel:
                context.l10n.carbohydrateFruitsOrNonStarchyVegetables,
            unitOfmeasurement: context.l10n.measurementUnitGram,
            color: context.colorExtenstion.carbsFruitsVeggies,
          ),
          gap,
          if (nutritionRequirement != null)
            FoodSuggestionChips(selectedTab: selectedTab),
          gap,
        ],
      ),
    );
  }
}
