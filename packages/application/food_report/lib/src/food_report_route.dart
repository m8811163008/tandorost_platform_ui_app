import 'package:domain_model/domain_model.dart';
import 'package:fitness_nutrition/fitness_nutrition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_report/food_report.dart';
import 'package:food_report_app/src/cubit/food_report_cubit.dart';
import 'package:food_report_app/src/delete_food_dialog.dart';
import 'package:food_report_app/src/edit_food_dialog.dart';
import 'package:food_report_app/src/macro_nutrition_pie_chart.dart';

import 'package:tandorost_components/tandorost_components.dart';

class FoodReportRoute extends StatelessWidget {
  const FoodReportRoute({
    super.key,
    this.goToFoodInputRoute,
    this.goToFitnessProfileRoute,
  });
  static const String name = 'food_report';
  final VoidCallback? goToFoodInputRoute;
  final VoidCallback? goToFitnessProfileRoute;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) => FoodReportCubit(
            foodReport: RepositoryProvider.of<FoodReport>(context),
            fitnessNutrition: RepositoryProvider.of<FitnessNutrition>(context),
          ),
      lazy: false,
      child: FoodReportScreen(goToFoodInputRoute: goToFoodInputRoute),
    );
  }
}

class FoodReportScreen extends StatefulWidget {
  const FoodReportScreen({super.key, this.goToFoodInputRoute, this.goToFitnessProfileRoute});
  final VoidCallback? goToFoodInputRoute;
  final VoidCallback? goToFitnessProfileRoute;

  @override
  State<FoodReportScreen> createState() => _FoodReportScreenState();
}

class _FoodReportScreenState extends State<FoodReportScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;
  @override
  void initState() {
    _controller = TabController(
      length: SelectedTab.values.length,
      vsync: this,
      animationDuration: Duration(milliseconds: 700),
    )..addListener(_onChangeTab);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onChangeTab() {
    context.read<FoodReportCubit>().onChangeTab(
      SelectedTab.values[_controller.index],
    );
  }

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(width: context.sizeExtenstion.small);

    return BlocBuilder<FoodReportCubit, FoodReportState>(
      buildWhen:
          (previous, current) =>
              previous.selectedFoods != current.selectedFoods,
      builder: (context, state) {
        final canEdit = state.selectedFoods.length == 1;
        final canDelete = state.selectedFoods.isNotEmpty;
        return AppScaffold(
          appBar: AppBar(
            actions: [
              IconButton.outlined(
                onPressed: widget.goToFoodInputRoute,
                icon: Icon(Icons.add),
              ),
              gap,
              IconButton.filledTonal(
                onPressed:
                    canEdit
                        ? () {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return BlocProvider.value(
                                value: context.read<FoodReportCubit>(),
                                child: EditFoodDialog(
                                  food: state.selectedFoods.single,
                                ),
                              );
                            },
                          );
                        }
                        : null,
                icon: Icon(Icons.edit),
              ),
              gap,
              IconButton.filledTonal(
                onPressed:
                    canDelete
                        ? () {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return BlocProvider.value(
                                value: context.read<FoodReportCubit>(),
                                child: DeleteFoodDialog(
                                  foodsId:
                                      state.selectedFoods
                                          .map((e) => e.id)
                                          .toList(),
                                ),
                              );
                            },
                          );
                        }
                        : null,
                icon: Icon(Icons.delete),
              ),
            ],
            bottom: TabBar(
              controller: _controller,
              tabs: <Widget>[
                Tab(icon: Icon(Icons.monitor_heart), text: 'Rest day'),
                Tab(icon: Icon(Icons.sports), text: 'Excersice day'),
              ],
            ),
          ),
          body: TabBarView(
            controller: _controller,
            children: <Widget>[FoodReportView(), FoodReportView()],
          ),
        );
      },
    );
  }
}

class FoodReportView extends StatelessWidget {
  const FoodReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [FoodReportStaticsConsumer(), FoodListBuilder()]),
    );
  }
}

class FoodReportStaticsConsumer extends StatelessWidget {
  const FoodReportStaticsConsumer({super.key, this.goToFitnessProfileRoute});
    final VoidCallback? goToFitnessProfileRoute;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodReportCubit, FoodReportState>(
      listenWhen:
          (previous, current) =>
              previous.readNutritionRequirementsStatus !=
              current.readNutritionRequirementsStatus,
      listener: (context, state) {
        if (state.readNutritionRequirementsStatus.isServerConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state
            .readNutritionRequirementsStatus
            .isServerConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.readFoodsNutritionStatus.isSuccess) {
          if (state.nutritionRequirements == null) {
            final messenger = ScaffoldMessenger.of(context);
            messenger.showMaterialBanner(
              MaterialBanner(
                content: Text('Add measurement sized'),
                leading: Icon(Icons.agriculture_outlined),
                actions: <Widget>[
                  TextButton(onPressed: goToFitnessProfileRoute, child: Text('Go to ')),
                  TextButton(
                    onPressed: () {
                      messenger.hideCurrentMaterialBanner();
                    },
                    child: Text('Dismiss'),
                  ),
                ],
              ),
            );
          }
        }
      },
      buildWhen:
          (previous, current) =>
              previous.readNutritionRequirementsStatus !=
                  current.readNutritionRequirementsStatus ||
              previous.selectedTab != current.selectedTab,
      builder: (context, state) {
        return switch (state.readNutritionRequirementsStatus) {
          AsyncProcessingStatus.inital => AppAsyncStatusCard.inital(),
          AsyncProcessingStatus.loading => AppAsyncStatusCard.loading(),
          AsyncProcessingStatus.serverConnectionError =>
            AppAsyncStatusCard.serverError(),
          AsyncProcessingStatus.internetConnectionError =>
            AppAsyncStatusCard.internetConnectionError(),
          AsyncProcessingStatus.success => FoodReportStatics(
            totalMacroNutrition: state.totalMacroNutrition,
            nutritionRequirement:
                state.selectedTab.isRestDay
                    ? state.nutritionRequirements?.restDay
                    : state.nutritionRequirements?.trainingDay,
          ),
        };
      },
    );
  }
}

class FoodReportStatics extends StatelessWidget {
  const FoodReportStatics({
    super.key,
    this.nutritionRequirement,
    required this.totalMacroNutrition,
  });
  final NutritionRequirement? nutritionRequirement;
  final TotalMacroNutrition totalMacroNutrition;

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(height: context.sizeExtenstion.small);
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppCardHeader(title: 'Foods statics'),
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
    this.macroNutritionLabel = '',
    this.unitOfmeasurement = '',
    this.total,
    this.color,
  });
  final int? total;
  final int currentValue;
  final String macroNutritionLabel;
  final String unitOfmeasurement;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final value = total == null ? 0.0 : currentValue / total!;
    final progressValue = value > 1.0 ? 1.0 : value;
    final isExceed = value > 1.0;
    return Column(
      children: [
        Row(
          children: [
            Material(
              shape: CircleBorder(),
              color: color,
              child: SizedBox.fromSize(size: context.sizeExtenstion.appButton),
            ),
            SizedBox(width: context.sizeExtenstion.small),
            Text(
              '$macroNutritionLabel $currentValue ${context.l10n.foodReportUserFoodRequirementFrom} ${total ?? context.l10n.foodReportUserFoodRequirementNA} $unitOfmeasurement',
            ),
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
    final gap = SizedBox(width: context.sizeExtenstion.small);
    return Row(
      children: [
        ActionChip.elevated(label: Text('carbs'), onPressed: () {}),
        gap,
        ActionChip.elevated(label: Text('fats'), onPressed: () {}),
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
