import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            TextSpan(text: food.quantityOfUnitOfMeasurement.toStringAsFixed(0)),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: context.l10n.calculatedCalorie),
                    textGap,
                    TextSpan(text: food.calculatedCalorie.toStringAsFixed(1)),
                    textGap,
                    TextSpan(text: context.l10n.measurementUnitCalorie),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: context.l10n.fat),
                    textGap,
                    TextSpan(text: food.macroNutrition.fat.toStringAsFixed(0)),
                    textGap,
                    TextSpan(text: context.l10n.measurementUnitGram),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: context.l10n.protein),
                    textGap,
                    TextSpan(
                      text: food.macroNutrition.protein.toStringAsFixed(0),
                    ),
                    textGap,
                    TextSpan(text: context.l10n.measurementUnitGram),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: context.l10n.carbohydrate),
                    textGap,
                    TextSpan(
                      text: food.macroNutrition.carbohydrate.toStringAsFixed(0),
                    ),
                    textGap,
                    TextSpan(text: context.l10n.measurementUnitGram),
                  ],
                ),
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
}
