import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:food_report_app/src/cubit/food_report_cubit.dart';
import 'package:food_report_app/src/widget/user_food_requrement_row_home_widget.dart';
import 'package:tandorost_components/tandorost_components.dart';

class FoodReportStaticsHomeWidget extends StatelessWidget {
  const FoodReportStaticsHomeWidget({
    super.key,
    this.nutritionRequirement,
    required this.context,
    required this.totalMacroNutrition,
    required this.selectedTab,
  });
  final NutritionRequirement? nutritionRequirement;
  final TotalMacroNutrition totalMacroNutrition;
  final SelectedTab selectedTab;
  final BuildContext context;

  @override
  Widget build(BuildContext _) {
    final gap = SizedBox(height: 4);
    return Card(
      child: Padding(
        padding: EdgeInsets.all(context.sizeExtenstion.small),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  selectedTab.isRestDay
                      ? context.l10n.foodReportTabLabelRestDay
                      : context.l10n.foodReportTabLabelTrainingDay,
                  style: context.textTheme.labelSmall,
                ),
                SizedBox(height: context.sizeExtenstion.extraSmall),
              ],
            ),
            // AppCardHeader(title: context.l10n.foodReportFoodsStatics),
            UserFoodRequirementRowHomeWidget(
              currentValue: totalMacroNutrition.calorie,
              total: nutritionRequirement?.effectiveTotalDailyEnergyExpenditure,
              macroNutritionLabel: context.l10n.foodEnergy,
              unitOfmeasurement: context.l10n.measurementUnitCalorie,
              color: context.colorExtenstion.energy,
              context: context,
            ),
            gap,
            UserFoodRequirementRowHomeWidget(
              currentValue: totalMacroNutrition.fat,
              total: nutritionRequirement?.fat,
              macroNutritionLabel: context.l10n.fat,
              unitOfmeasurement: context.l10n.measurementUnitGram,
              color: context.colorExtenstion.fat,
              context: context,
            ),
            gap,
            UserFoodRequirementRowHomeWidget(
              currentValue: totalMacroNutrition.protein,
              total: nutritionRequirement?.protein,
              macroNutritionLabel: context.l10n.protein,
              unitOfmeasurement: context.l10n.measurementUnitGram,
              color: context.colorExtenstion.protein,
              context: context,
            ),
            gap,
            UserFoodRequirementRowHomeWidget(
              currentValue: totalMacroNutrition.carbohydrateOthers,
              total: nutritionRequirement?.carbohydrateOther,
              macroNutritionLabel: context.l10n.carbohydrateOthers,
              unitOfmeasurement: context.l10n.measurementUnitGram,
              color: context.colorExtenstion.carbsOther,
              context: context,
            ),
            gap,
            UserFoodRequirementRowHomeWidget(
              currentValue:
                  totalMacroNutrition.carbohydrateFruitsOrNonStarchyVegetables,
              total:
                  nutritionRequirement
                      ?.carbohydrateFruitsOrNonStarchyVegetables,
              macroNutritionLabel:
                  context.l10n.carbohydrateFruitsOrNonStarchyVegetables,
              unitOfmeasurement: context.l10n.measurementUnitGram,
              color: context.colorExtenstion.carbsFruitsVeggies,
              context: context,
            ),
          ],
        ),
      ),
    );
  }
}
