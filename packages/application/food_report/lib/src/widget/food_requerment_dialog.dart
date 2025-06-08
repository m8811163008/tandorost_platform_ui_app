import 'package:flutter/material.dart';
import 'package:food_report_app/src/cubit/food_report_cubit.dart';
import 'package:tandorost_components/tandorost_components.dart';

class GeneralRequrementDialog extends StatelessWidget {
  const GeneralRequrementDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: context.l10n.foodRequerementDialogGeneralRecommendationTitle,
      contents: [
        Text(
          context.l10n.foodRequerementDialogGeneralRecommendationVitaminTitle,
          style: context.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          context.l10n.foodRequerementDialogGeneralRecommendationVitaminText2,
        ),
        Text(
          context.l10n.foodRequerementDialogGeneralRecommendationVitaminText3,
        ),
        Text(
          context.l10n.foodRequerementDialogGeneralRecommendationVitaminText4,
        ),
        Text(
          context.l10n.foodRequerementDialogGeneralRecommendationVitaminText5,
        ),
        Text(
          context.l10n.foodRequerementDialogGeneralRecommendationVitaminText6,
        ),
        Text(
          context.l10n.foodRequerementDialogGeneralRecommendationVitaminText7,
        ),
        Divider(),
        Text(
          context
              .l10n
              .foodRequerementDialogGeneralRecommendationProperSleepTitle,
          style: context.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogGeneralRecommendationProperSleepText1,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogGeneralRecommendationProperSleepText2,
        ),
        Divider(),
        Text(
          context.l10n.foodRequerementDialogGeneralRecommendationStressTitle,
          style: context.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          context.l10n.foodRequerementDialogGeneralRecommendationStressText1,
        ),
        Text(
          context.l10n.foodRequerementDialogGeneralRecommendationStressText2,
        ),
      ],
    );
  }
}

class WaterRequrementDialogRestDay extends StatelessWidget {
  const WaterRequrementDialogRestDay({super.key});

  @override
  Widget build(BuildContext context) {
    final isMale = context.select(
      (FoodReportCubit cubit) => cubit.state.userPhysicalProfile?.gender.isMale,
    );

    return AppDialog(
      title: context.l10n.foodRequerementDialogHydrationTitle,
      contents: [
        Text(context.l10n.foodRequerementDialogHydrationRestDayText1),
        Text(context.l10n.foodRequerementDialogHydrationRestDayText2),
        Text(context.l10n.foodRequerementDialogHydrationRestDayText3),
        Text(context.l10n.foodRequerementDialogHydrationRestDayText4),
        Text(
          context.l10n.foodRequerementDialogHydrationRestDayText5(
            isMale == null
                ? -1
                : isMale
                ? 2.5
                : 2.0,
          ),
        ),
      ],
    );
  }
}

class WaterRequrementDialogTrainingDay extends StatelessWidget {
  const WaterRequrementDialogTrainingDay({super.key});

  @override
  Widget build(BuildContext context) {
    final weight = context.select(
      (FoodReportCubit cubit) =>
          cubit.state.userPhysicalProfile?.weight.last.value,
    );

    return AppDialog(
      title: context.l10n.foodRequerementDialogHydrationTitle,
      contents: [
        Text(context.l10n.foodRequerementDialogHydrationTrainingDayText1),
        Text(context.l10n.foodRequerementDialogHydrationTrainingDayText2),
        Text(
          context.l10n.foodRequerementDialogHydrationTrainingDayText3(
            weight == null ? -1 : (weight * 5).toInt(),
            weight == null ? -1 : (weight * 10).toInt(),
          ),
        ),
        Text(context.l10n.foodRequerementDialogHydrationTrainingDayText4),
        Text(context.l10n.foodRequerementDialogHydrationTrainingDayText5),
        Text(context.l10n.foodRequerementDialogHydrationTrainingDayText6),
        Text(context.l10n.foodRequerementDialogHydrationTrainingDayText7),
        Text(context.l10n.foodRequerementDialogHydrationTrainingDayText8),
        Text(context.l10n.foodRequerementDialogHydrationTrainingDayText9),
        Text(context.l10n.foodRequerementDialogHydrationTrainingDayText10),
      ],
    );
  }
}

class CarbRequrementDialogRestDay extends StatelessWidget {
  const CarbRequrementDialogRestDay({super.key});

  @override
  Widget build(BuildContext context) {
    final calorie = context.select(
      (FoodReportCubit cubit) =>
          cubit
              .state
              .nutritionRequirements
              ?.restDay
              .effectiveTotalDailyEnergyExpenditure,
    );

    return AppDialog(
      title: context.l10n.foodRequerementDialogHydrationTitle,
      contents: [
        Text(context.l10n.foodRequerementDialogCarbohydrateRestDayText1),
        Text(
          context.l10n.foodRequerementDialogCarbohydrateRestDayText2(
            calorie == null ? -1 : (calorie * 0.05).toInt(),
            calorie == null ? -1 : (calorie * 0.1).toInt(),
          ),
        ),
        Text(context.l10n.foodRequerementDialogCarbohydrateRestDayText3),
        Text(context.l10n.foodRequerementDialogCarbohydrateRestDayText4),
        Text(context.l10n.foodRequerementDialogCarbohydrateRestDayText5),
        Text(context.l10n.foodRequerementDialogCarbohydrateRestDayText6),
      ],
    );
  }
}

class CarbRequrementDialogTrainingDayBeforeExcercise extends StatelessWidget {
  const CarbRequrementDialogTrainingDayBeforeExcercise({super.key});

  @override
  Widget build(BuildContext context) {
    final weight = context.select(
      (FoodReportCubit cubit) =>
          cubit.state.userPhysicalProfile?.weight.last.value,
    );
    final carbohydrate = context.select(
      (FoodReportCubit cubit) =>
          cubit.state.nutritionRequirements?.trainingDay.carbohydrateTotal,
    );
    final protein = context.select(
      (FoodReportCubit cubit) =>
          cubit.state.nutritionRequirements?.trainingDay.protein,
    );

    return AppDialog(
      title: context.l10n.foodRequerementDialogHydrationTitle,
      contents: [
        Text(
          context.l10n
              .foodRequerementDialogCarbohydrateTrainingDayBeforeExcersiceText1(
                weight == null ? -1 : weight.toInt(),
                carbohydrate == null ? -1 : carbohydrate.toInt(),
                protein == null ? -1 : protein.toInt(),
              ),
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayBeforeExcersiceText2,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayBeforeExcersiceText3,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayBeforeExcersiceText4,
        ),
      ],
    );
  }
}

class CarbRequrementDialogTrainingDayDuringExcercise extends StatelessWidget {
  const CarbRequrementDialogTrainingDayDuringExcercise({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: context.l10n.foodRequerementDialogHydrationTitle,
      contents: [
        Text(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceText1,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceText2,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceText3,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceText4,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceText5,
        ),
      ],
    );
  }
}

class CarbRequrementDialogTrainingDayAfterExcercise extends StatelessWidget {
  const CarbRequrementDialogTrainingDayAfterExcercise({super.key});

  @override
  Widget build(BuildContext context) {
    final weight = context.select(
      (FoodReportCubit cubit) =>
          cubit.state.userPhysicalProfile?.weight.last.value,
    );
    return AppDialog(
      title: context.l10n.foodRequerementDialogHydrationTitle,
      contents: [
        Text(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText1,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText2,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText3,
        ),
        Text(
          context.l10n
              .foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText4(
                weight == null ? -1 : weight.toInt(),
                weight == null ? -1 : (weight * 1.2).toInt(),
              ),
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText5,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText6,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText7,
        ),
      ],
    );
  }
}

class ProteinRequrementDialogRestDay extends StatelessWidget {
  const ProteinRequrementDialogRestDay({super.key});

  @override
  Widget build(BuildContext context) {
    final weight = context.select(
      (FoodReportCubit cubit) =>
          cubit.state.userPhysicalProfile?.weight.last.value,
    );
    final protein = context.select(
      (FoodReportCubit cubit) =>
          cubit.state.nutritionRequirements?.restDay.protein,
    );
    // 16 hour awake and should eat every 3 hours
    final proteinPerMeal = protein == null ? -1 : protein ~/ (16 / 3);
    final proteinPerBodyWeight =
        (protein == null || weight == null || weight == 0)
            ? -1
            : protein / weight;

    return AppDialog(
      title: context.l10n.foodRequerementDialogHydrationTitle,
      contents: [
        Text(
          context.l10n.foodRequerementDialogProteinRestDayText1(proteinPerMeal),
        ),
        Text(context.l10n.foodRequerementDialogProteinRestDayText2),
        Text(context.l10n.foodRequerementDialogProteinRestDayText3),
        Text(
          context.l10n.foodRequerementDialogProteinRestDayText4(
            proteinPerBodyWeight.toDouble(),
          ),
        ),
        Text(context.l10n.foodRequerementDialogProteinRestDayText5),
        Text(context.l10n.foodRequerementDialogProteinRestDayText6),
        Text(context.l10n.foodRequerementDialogProteinRestDayText7),
      ],
    );
  }
}

class ProteinRequrementDialogTrainingDay extends StatelessWidget {
  const ProteinRequrementDialogTrainingDay({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: context.l10n.foodRequerementDialogHydrationTitle,
      contents: [
        Text(context.l10n.foodRequerementDialogProteinTrainingDayText1),
        Text(context.l10n.foodRequerementDialogProteinTrainingDayText2),
        Text(context.l10n.foodRequerementDialogProteinTrainingDayText3),
        SizedBox(height: context.sizeExtenstion.small),
        _buildLucineProteinSampleFood(context),
        SizedBox(height: context.sizeExtenstion.small),
        Text(context.l10n.foodRequerementDialogProteinTrainingDayText4),
        Text(context.l10n.foodRequerementDialogProteinTrainingDayText5),
        Text(context.l10n.foodRequerementDialogProteinTrainingDayText6),
        Text(context.l10n.foodRequerementDialogProteinTrainingDayText7),
      ],
    );
  }

  Widget _buildLucineProteinSampleFood(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: FlexColumnWidth(),
        1: FlexColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.top,
              child: Text(
                context
                    .l10n
                    .foodRequerementDialogProteinTrainingDayText3SampleLucine1,
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.top,
              child: Text(
                context
                    .l10n
                    .foodRequerementDialogProteinTrainingDayText3SampleLucine2,
              ),
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.top,
              child: Text(
                context
                    .l10n
                    .foodRequerementDialogProteinTrainingDayText3SampleLucine3,
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.top,
              child: Text(
                context
                    .l10n
                    .foodRequerementDialogProteinTrainingDayText3SampleLucine4,
              ),
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.top,
              child: Text(
                context
                    .l10n
                    .foodRequerementDialogProteinTrainingDayText3SampleLucine5,
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.top,
              child: Text(
                context
                    .l10n
                    .foodRequerementDialogProteinTrainingDayText3SampleLucine6,
              ),
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.top,
              child: Text(
                context
                    .l10n
                    .foodRequerementDialogProteinTrainingDayText3SampleLucine7,
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.top,
              child: Text(
                context
                    .l10n
                    .foodRequerementDialogProteinTrainingDayText3SampleLucine8,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FatRequrementDialogRestDay extends StatelessWidget {
  const FatRequrementDialogRestDay({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: context.l10n.foodRequerementDialogHydrationTitle,
      contents: [
        Text(context.l10n.foodRequerementDialogFatRestDayText1),
        Text(context.l10n.foodRequerementDialogFatRestDayText2),
        Text(context.l10n.foodRequerementDialogFatRestDayText3),
        Text(context.l10n.foodRequerementDialogFatRestDayText4),
        Text(context.l10n.foodRequerementDialogFatRestDayText5),
        Text(context.l10n.foodRequerementDialogFatRestDayText6),
        Text(context.l10n.foodRequerementDialogFatRestDayText7),
        Text(context.l10n.foodRequerementDialogFatRestDayText8),
        Text(context.l10n.foodRequerementDialogFatRestDayText9),
        Text(context.l10n.foodRequerementDialogFatRestDayText10),
        Text(context.l10n.foodRequerementDialogFatRestDayText11),
      ],
    );
  }
}

class TimeRestrictedDialogRestDay extends StatelessWidget {
  const TimeRestrictedDialogRestDay({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: context.l10n.foodRequerementDialogHydrationTitle,
      contents: [
        Text(context.l10n.timeRestrictedText1),
        Text(context.l10n.timeRestrictedText2),
        Text(context.l10n.timeRestrictedText3),
        Text(context.l10n.timeRestrictedText4),
        Text(context.l10n.timeRestrictedText5),
        Text(context.l10n.timeRestrictedText6),
        Text(context.l10n.timeRestrictedText7),
        Text(context.l10n.timeRestrictedText8),
        Text(context.l10n.timeRestrictedText9),
        Text(context.l10n.timeRestrictedText10),
      ],
    );
  }
}
