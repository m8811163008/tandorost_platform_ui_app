import 'package:domain_model/domain_model.dart' hide ChartType;
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:tandorost_components/tandorost_components.dart';

class MacroNutitionsPieChart extends StatelessWidget {
  const MacroNutitionsPieChart({
    super.key,
    required this.macroNutrition,
    required this.carbohydrateSourceLD,
  });
  final MacroNutrition macroNutrition;
  final CarbohydrateSourceLD carbohydrateSourceLD;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension:
          context.themeData.visualDensity == VisualDensity.compact
              ? context.sizeExtenstion.large
              : context.sizeExtenstion.xExtraLarge,
      child: PieChart(
        chartType: ChartType.ring,
        dataMap: {
          context.l10n.protein: macroNutrition.protein.toDouble(),
          context.l10n.fat: macroNutrition.fat.toDouble(),
          context.l10n.carbohydrate: macroNutrition.carbohydrate.toDouble(),
        },
        ringStrokeWidth: context.sizeExtenstion.large,
        chartValuesOptions: const ChartValuesOptions(showChartValues: false),
        animationDuration: Duration.zero,
        legendOptions: const LegendOptions(showLegends: false),
        totalValue: macroNutrition.total.toDouble(),
        colorList: [
          context.colorExtenstion.protein,
          context.colorExtenstion.fat,
          carbohydrateSourceLD.isFruitsOrNonStarchyVegetables
              ? context.colorExtenstion.carbsFruitsVeggies
              : context.colorExtenstion.carbsOther,
        ],
      ),
    );
  }
}
