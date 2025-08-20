import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:food_report_app/src/cubit/food_report_cubit.dart';
import 'package:food_report_app/src/widget/macro_nutrition_pie_chart.dart';
import 'package:tandorost_components/tandorost_components.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({super.key, required this.food});
  final Food food;

  @override
  Widget build(BuildContext context) {
    final textGap = TextSpan(text: ' ');
    return ListTile(
      isThreeLine: true,
      style: ListTileStyle.list,
      leading: MacroNutitionsPieChart(
        macroNutrition: food.macroNutrition,
        carbohydrateSourceLD: food.carbohydrateSource,
      ),

      selected: context.select(
        (FoodReportCubit cubit) => cubit.state.selectedFoods.contains(food),
      ),
      onTap: () {
        context.read<FoodReportCubit>().onSelectedFoodsChange(food);
      },
      title: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: food.quantityOfUnitOfMeasurement.toString()),
            textGap,
            TextSpan(text: food.unitOfMeasurementNativeLanguage),
            textGap,
            TextSpan(text: food.userNativeLanguageFoodName),
          ],
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: [
              _buildMacroText(
                context,
                context.l10n.calculatedCalorie,
                food.calculatedCalorie.toString(),
                context.l10n.measurementUnitCalorie,
              ),
              _buildMacroText(
                context,
                context.l10n.fat,
                food.macroNutrition.fat.toString(),
                context.l10n.measurementUnitGram,
              ),
            ],
          ),
          Wrap(
            children: [
              _buildMacroText(
                context,
                context.l10n.protein,
                food.macroNutrition.protein.toString(),
                context.l10n.measurementUnitGram,
              ),
              _buildMacroText(
                context,
                context.l10n.carbohydrate,
                food.macroNutrition.carbohydrate.toString(),
                context.l10n.measurementUnitGram,
              ),
            ],
          ),
          SizedBox(height: context.sizeExtenstion.small),
          Text.rich(
            TextSpan(
              style: context.textTheme.labelSmall,
              children: [
                TextSpan(text: context.l10n.upsertDate),
                textGap,
                TextSpan(text: food.upsertDate.formattedDateTime(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text _buildMacroText(context, String label, String value, String unit) {
    final textGap = TextSpan(text: ' ');
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: label),
          textGap,
          TextSpan(text: value),
          textGap,
          TextSpan(text: unit),
        ],
      ),
    );
  }
}
