import 'package:domain_model/domain_model.dart';
import 'package:fitness_nutrition/fitness_nutrition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_report/food_report.dart';
import 'package:food_report_app/src/cubit/food_report_cubit.dart';
import 'package:food_report_app/src/macro_nutrition_pie_chart.dart';

import 'package:tandorost_components/tandorost_components.dart';

class FoodReportRoute extends StatelessWidget {
  const FoodReportRoute({super.key});
  static const String name = 'food_report';
  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(width: context.sizeExtenstion.small);
    return BlocProvider(
      create:
          (_) => FoodReportCubit(
            foodReport: RepositoryProvider.of<FoodReport>(context),
            fitnessNutrition: RepositoryProvider.of<FitnessNutrition>(context),
          ),
      lazy: false,
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: AppScaffold(
          appBar: AppBar(
            actions: [
              IconButton.outlined(onPressed: () {}, icon: Icon(Icons.add)),
              gap,
              IconButton.filledTonal(onPressed: () {}, icon: Icon(Icons.edit)),
              gap,
              IconButton.filledTonal(
                onPressed: () {},
                icon: Icon(Icons.delete),
              ),
            ],
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.monitor_heart), text: 'Rest day'),
                Tab(icon: Icon(Icons.sports), text: 'Excersice day'),
              ],
            ),
          ),
          body: const TabBarView(
            children: <Widget>[
              FoodReportRestDayView(),
              FoodReportExcerciseDayView(),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodReportRestDayView extends StatelessWidget {
  const FoodReportRestDayView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [FoodReportStatics(), FoodListBuilder()]),
    );
  }
}

class FoodReportExcerciseDayView extends StatelessWidget {
  const FoodReportExcerciseDayView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: FoodReportStatics());
  }
}

class FoodReportStatics extends StatelessWidget {
  const FoodReportStatics({super.key});

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(height: context.sizeExtenstion.small);
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppCardHeader(title: 'Foods statics'),
          UserFoodRequirementRow(currentValue: 10, total: 100),
          gap,
          UserFoodRequirementRow(currentValue: 120, total: 100),
          gap,
          FoodSuggestionChips(),
        ],
      ),
    );
  }
}

class UserFoodRequirementRow extends StatelessWidget {
  const UserFoodRequirementRow({
    super.key,
    required this.currentValue,
    required this.total,
  });
  final int total;
  final double currentValue;

  @override
  Widget build(BuildContext context) {
    final value = currentValue / total;
    final progressValue = value > 1.0 ? 1.0 : value;
    final isExceed = value > 1.0;
    return Column(
      children: [
        Row(
          children: [
            Material(
              shape: CircleBorder(),
              color: Colors.red,
              child: SizedBox.fromSize(size: context.sizeExtenstion.appButton),
            ),
            SizedBox(width: context.sizeExtenstion.small),
            Text('carbo hydarate 0 from 210 grams'),
            if (isExceed)
              Icon(Icons.warning, color: context.themeData.colorScheme.error),
          ],
        ),
        SizedBox(height: context.sizeExtenstion.small),
        LinearProgressIndicator(value: progressValue),
      ],
    );
  }
}

class FoodSuggestionChips extends StatelessWidget {
  const FoodSuggestionChips({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ActionChip(label: Text('carbs'), onPressed: () {}),
        ActionChip.elevated(label: Text('carbs'), onPressed: () {}),
      ],
    );
  }
}

class FoodListBuilder extends StatelessWidget {
  const FoodListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (context, index) {
          return FoodTile(
            food: Food(
              id: 'id',
              userId: 'userId',
              upsertDate: DateTime.now(),
              userLanguage: Language.arabic,
              userNativeLanguageFoodName: 'foodName',
              translatedToEnglishFoodName: 'foodName',
              unitOfMeasurementNativeLanguage: 'piece',
              translatedToEnglishUnitOfMeasurement: 'piece',
              calculatedCalorie: 200,
              quantityOfUnitOfMeasurement: 2,
              carbohydrateSource:
                  CarbohydrateSourceLD.fruitsOrNonStarchyVegetables,
              macroNutrition: MacroNutrition(
                fat: 10,
                carbohydrate: 20,
                protein: 30,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: context.sizeExtenstion.small);
        },
      ),
    );
  }
}

class FoodTile extends StatelessWidget {
  const FoodTile({super.key, required this.food});
  final Food food;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      style: ListTileStyle.list,
      leading: MacroNutitionsPieChart(
        macroNutrition: food.macroNutrition,
        carbohydrateSourceLD: food.carbohydrateSource,
      ),
      title: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: context.l10n.foodName),
            TextSpan(text: food.quantityOfUnitOfMeasurement.toStringAsFixed(0)),
            TextSpan(text: food.unitOfMeasurementNativeLanguage),
            TextSpan(text: food.userNativeLanguageFoodName),
          ],
        ),
      ),
      subtitle: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: context.l10n.calculatedCalorie),
                    TextSpan(text: food.calculatedCalorie.toStringAsFixed(1)),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: context.l10n.fat),
                    TextSpan(text: food.macroNutrition.fat.toStringAsFixed(0)),
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
                    TextSpan(
                      text: food.macroNutrition.protein.toStringAsFixed(0),
                    ),
                    TextSpan(text: context.l10n.measurementUnitGram),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: context.l10n.carbohydrate),
                    TextSpan(
                      text: food.macroNutrition.carbohydrate.toStringAsFixed(0),
                    ),
                    TextSpan(text: context.l10n.measurementUnitGram),
                    WidgetSpan(
                      child: Icon(
                        Icons.center_focus_weak,
                        color:
                            food
                                    .carbohydrateSource
                                    .isFruitsOrNonStarchyVegetables
                                ? context.colorExtenstion.carbsFruitsVeggies
                                : context.colorExtenstion.carbsOther,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: context.l10n.upsertDate),
                TextSpan(text: food.upsertDate.toIso8601String()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
