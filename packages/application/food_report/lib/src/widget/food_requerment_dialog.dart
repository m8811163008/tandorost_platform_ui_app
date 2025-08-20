import 'package:flutter/material.dart';
import 'package:food_report_app/src/cubit/food_report_cubit.dart';
import 'package:food_report_app/src/widget/food_requerment_dialog_text_widget.dart';
import 'package:tandorost_components/tandorost_components.dart';

class GeneralRequrementDialog extends StatelessWidget {
  const GeneralRequrementDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: context.l10n.foodRequerementDialogGeneralRecommendationTitle,
      contents: [
        DialogBodyTitle(
          context.l10n.foodRequerementDialogGeneralRecommendationVitaminTitle,
        ),
        DialogBodyText(
          context.l10n.foodRequerementDialogGeneralRecommendationVitaminText2,
        ),
        DialogNetworkImage(
          'https://tandorost-a.ir/wp-content/uploads/2025/07/vitamin-1.png',
        ),
        DialogBodyText(
          context.l10n.foodRequerementDialogGeneralRecommendationVitaminText3,
        ),

        DialogBodyText(
          context.l10n.foodRequerementDialogGeneralRecommendationVitaminText5,
        ),
        DialogNetworkImage(
          'https://tandorost-a.ir/wp-content/uploads/2025/07/vitamin-3.png',
        ),
        DialogBodyText(
          context.l10n.foodRequerementDialogGeneralRecommendationVitaminText4,
        ),
        DialogNetworkImage(
          'https://tandorost-a.ir/wp-content/uploads/2025/07/vitamin-2.png',
        ),
        DialogBodyText(
          context.l10n.foodRequerementDialogGeneralRecommendationVitaminText6,
        ),
        DialogBodyText(
          context.l10n.foodRequerementDialogGeneralRecommendationVitaminText7,
        ),
        Divider(),
        DialogBodyTitle(
          context
              .l10n
              .foodRequerementDialogGeneralRecommendationProperSleepTitle,
        ),
        DialogBodyText(
          context
              .l10n
              .foodRequerementDialogGeneralRecommendationProperSleepText1,
        ),
        DialogBodyText(
          context
              .l10n
              .foodRequerementDialogGeneralRecommendationProperSleepText2,
        ),
        Divider(),
        DialogBodyTitle(
          context.l10n.foodRequerementDialogGeneralRecommendationStressTitle,
        ),
        DialogBodyText(
          context.l10n.foodRequerementDialogGeneralRecommendationStressText1,
        ),
        DialogNetworkImage(
          'https://tandorost-a.ir/wp-content/uploads/2025/07/vitamins-6.png',
        ),
        DialogBodyText(
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
      title: context.l10n.foodRequerementDialogHydrationTrainingTitle,
      contents: [
        DialogBodyText(context.l10n.foodRequerementDialogHydrationRestDayText1),
        DialogNetworkImage(
          'https://tandorost-a.ir/wp-content/uploads/2025/07/water-2.png',
        ),
        DialogBodyText(context.l10n.foodRequerementDialogHydrationRestDayText2),
        DialogNetworkImage(
          'https://tandorost-a.ir/wp-content/uploads/2025/07/water-1.png',
        ),
        DialogBodyTitle(
          context.l10n.foodRequerementDialogHydrationRestDaySubtitle2,
        ),
        DialogBodyText(
          context.l10n.foodRequerementDialogHydrationRestDayText5(
            isMale == null
                ? -1
                : isMale
                ? 2.5
                : 2.0,
          ),
        ),

        DialogBodyTitle(
          context.l10n.foodRequerementDialogHydrationRestDaySubtitle1,
        ),
        DialogBodyText(context.l10n.foodRequerementDialogHydrationRestDayText3),
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
      title: context.l10n.foodRequerementDialogHydrationTrainingTitle,
      contents: [
        DialogBodyText(
          context.l10n.foodRequerementDialogHydrationTrainingDayText1,
        ),
        DialogBodyText(
          context.l10n.foodRequerementDialogHydrationTrainingDayText2,
        ),
        DialogBodyTitle(
          context.l10n.foodRequerementDialogHydrationTrainingDaySubtitle1,
        ),
        DialogBodyText(
          context.l10n.foodRequerementDialogHydrationTrainingDayText3(
            weight == null ? -1 : (weight * 5).toInt(),
            weight == null ? -1 : (weight * 10).toInt(),
          ),
        ),
        DialogNetworkImage(
          'https://tandorost-a.ir/wp-content/uploads/2025/07/carbohydrate_bodybuilding-6.png',
        ),
        DialogBodyText(
          context.l10n.foodRequerementDialogHydrationTrainingDayText4,
        ),
        DialogBodyText(
          context.l10n.foodRequerementDialogHydrationTrainingDayText5,
        ),
        DialogBodyTitle(
          context.l10n.foodRequerementDialogHydrationTrainingDaySubtitle2,
        ),
        DialogBodyText(
          context.l10n.foodRequerementDialogHydrationTrainingDayText6,
        ),
        DialogBodyText(
          context.l10n.foodRequerementDialogHydrationTrainingDayText7,
        ),
        DialogBodyTitle(
          context.l10n.foodRequerementDialogHydrationTrainingDaySubtitle3,
        ),
        DialogBodyText(
          context.l10n.foodRequerementDialogHydrationTrainingDayText8,
        ),
        DialogBodyText(
          context.l10n.foodRequerementDialogHydrationTrainingDayText9,
        ),
        DialogBodyText(
          context.l10n.foodRequerementDialogHydrationTrainingDayText10,
        ),
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
      title: context.l10n.carbohydrate,
      contents: [
        DialogBodyText(
          context.l10n.foodRequerementDialogCarbohydrateRestDayText1,
        ),
        DialogNetworkImage(
          'https://tandorost-a.ir/wp-content/uploads/2025/07/carbohydrates-2.png',
        ),

        DialogBodyTitle(
          context.l10n.foodRequerementDialogCarbohydrateRestDaySubtitle1,
        ),
        DialogBodyText(
          context.l10n.foodRequerementDialogCarbohydrateRestDayText2(
            calorie == null ? -1 : (calorie * 0.05).toInt(),
            // 9 calarie per sugar cube
            calorie == null ? -1 : (calorie * 0.05 / 9).toInt(),
          ),
        ),
        DialogNetworkImage(
          'https://tandorost-a.ir/wp-content/uploads/2025/07/carbohydrates-5.png',
        ),

        DialogBodyTitle(
          context.l10n.foodRequerementDialogCarbohydrateRestDaySubtitle2,
        ),
        DialogBodyText(
          context.l10n.foodRequerementDialogCarbohydrateRestDayText3,
        ),
        DialogNetworkImage(
          'https://tandorost-a.ir/wp-content/uploads/2025/07/carbohydrates-4.png',
        ),
        DialogBodyText(
          context.l10n.foodRequerementDialogCarbohydrateRestDayText4,
        ),
        DialogNetworkImage(
          'https://tandorost-a.ir/wp-content/uploads/2025/07/carbohydrates-3.png',
        ),
        DialogBodyTitle(
          context.l10n.foodRequerementDialogCarbohydrateRestDaySubtitle3,
        ),
        DialogBodyText(
          context.l10n.foodRequerementDialogCarbohydrateRestDayText5,
        ),
        DialogNetworkImage(
          'https://tandorost-a.ir/wp-content/uploads/2025/07/carbohydrates-1.png',
        ),
        DialogBodyText(
          context.l10n.foodRequerementDialogCarbohydrateRestDayText6,
        ),
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
      title:
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayBeforeExcersiceTitle,
      contents: [
        DialogBodyText(
          context.l10n
              .foodRequerementDialogCarbohydrateTrainingDayBeforeExcersiceText1(
                weight == null ? -1 : weight.toInt(),
                carbohydrate == null ? -1 : carbohydrate.toInt(),
                protein == null ? -1 : protein.toInt(),
              ),
        ),
        DialogBodyTitle(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayBeforeExcersiceSubtitle1,
        ),
        DialogBodyText(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayBeforeExcersiceText2,
        ),
        DialogNetworkImage(
          'https://tandorost-a.ir/wp-content/uploads/2025/07/carbohydrate_bodybuilding-7.png',
        ),
        DialogBodyText(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayBeforeExcersiceText3,
        ),
        DialogBodyText(
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
      title:
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceTitle,
      contents: [
        DialogBodyText(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceText1,
        ),
        DialogNetworkImage(
          'https://tandorost-a.ir/wp-content/uploads/2025/07/carbohydrate_bodybuilding-2.png',
        ),
        DialogBodyText(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceText2,
        ),
        DialogBodyTitle(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceSubtitle1,
        ),
        DialogBodyText(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceText3,
        ),
        DialogNetworkImage(
          'https://tandorost-a.ir/wp-content/uploads/2025/07/carbohydrate_bodybuilding-1.png',
        ),
        DialogBodyText(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceText4,
        ),
        DialogBodyTitle(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayDuringExcersiceSubtitle2,
        ),
        DialogBodyText(
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
      title:
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceTitle,
      contents: [
        DialogBodyText(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText1,
        ),
        DialogBodyText(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText2,
        ),
        DialogNetworkImage(
          'https://tandorost-a.ir/wp-content/uploads/2025/07/carbohydrate_bodybuilding-3.png',
        ),
        DialogBodyText(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText3,
        ),
        DialogBodyTitle(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceSubtitle1,
        ),
        DialogBodyText(
          context.l10n
              .foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText4(
                weight == null ? -1 : weight.toInt(),
                weight == null ? -1 : (weight * 1.2).toInt(),
              ),
        ),
        DialogBodyTitle(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceSubtitle2,
        ),
        DialogBodyText(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText5,
        ),
        DialogNetworkImage(
          'https://tandorost-a.ir/wp-content/uploads/2025/07/carbohydrate_bodybuilding-9.png',
        ),
        DialogBodyText(
          context
              .l10n
              .foodRequerementDialogCarbohydrateTrainingDayAfterExcersiceText6,
        ),
        DialogBodyText(
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
      title: context.l10n.protein,
      contents: [
        DialogBodyText(
          context.l10n.foodRequerementDialogProteinRestDayText1(proteinPerMeal),
        ),
        DialogNetworkImage(
          'https://tandorost-a.ir/wp-content/uploads/2025/07/protein.png',
        ),
        DialogBodyTitle(
          context.l10n.foodRequerementDialogProteinRestDaySubtitile1,
        ),
        DialogBodyText(context.l10n.foodRequerementDialogProteinRestDayText2),
        DialogNetworkImage(
          'https://tandorost-a.ir/wp-content/uploads/2025/07/protein-1.png',
        ),

        DialogBodyText(context.l10n.foodRequerementDialogProteinRestDayText3),
        DialogNetworkImage(
          'https://tandorost-a.ir/wp-content/uploads/2025/07/protein-4.png',
        ),

        DialogBodyTitle(
          context.l10n.foodRequerementDialogProteinRestDaySubtitile2,
        ),
        DialogBodyText(
          context.l10n.foodRequerementDialogProteinRestDayText4(
            proteinPerBodyWeight.toDouble(),
          ),
        ),

        DialogBodyText(context.l10n.foodRequerementDialogProteinRestDayText5),
        DialogBodyTitle(
          context.l10n.foodRequerementDialogProteinRestDaySubtitile3,
        ),
        DialogBodyText(context.l10n.foodRequerementDialogProteinRestDayText6),
        DialogNetworkImage(
          'https://tandorost-a.ir/wp-content/uploads/2025/07/protein-2.png',
        ),
        DialogBodyText(context.l10n.foodRequerementDialogProteinRestDayText7),
      ],
    );
  }
}

class ProteinRequrementDialogTrainingDay extends StatelessWidget {
  const ProteinRequrementDialogTrainingDay({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: context.l10n.protein,
      contents: [
        DialogBodyText(
          context.l10n.foodRequerementDialogProteinTrainingDayText1,
        ),
        DialogBodyText(
          context.l10n.foodRequerementDialogProteinTrainingDayText2,
        ),
        DialogBodyTitle(
          context.l10n.foodRequerementDialogProteinTrainingDaySubtitle1,
        ),
        DialogBodyText(
          context.l10n.foodRequerementDialogProteinTrainingDayText3,
        ),
        SizedBox(height: context.sizeExtenstion.small),
        _buildLucineProteinSampleFood(context),
        SizedBox(height: context.sizeExtenstion.small),
        DialogBodyText(
          context.l10n.foodRequerementDialogProteinTrainingDayText4,
        ),
        DialogNetworkImage(
          'https://tandorost-a.ir/wp-content/uploads/2025/07/carbohydrate_bodybuilding-10.png',
        ),
        DialogBodyText(
          context.l10n.foodRequerementDialogProteinTrainingDayText5,
        ),
        DialogBodyTitle(
          context.l10n.foodRequerementDialogProteinTrainingDaySubtitle2,
        ),
        DialogBodyText(
          context.l10n.foodRequerementDialogProteinTrainingDayText6,
        ),
        DialogBodyText(
          context.l10n.foodRequerementDialogProteinTrainingDayText7,
        ),
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
      title: context.l10n.fat,
      contents: [
        DialogBodyText(context.l10n.foodRequerementDialogFatRestDayText1),
        DialogBodyText(context.l10n.foodRequerementDialogFatRestDayText2),
        DialogNetworkImage(
          'https://tandorost-a.ir/wp-content/uploads/2025/07/fat-1.png',
        ),

        DialogBodyTitle(context.l10n.foodRequerementDialogFatRestDaySubtitle1),

        DialogBodyText(context.l10n.foodRequerementDialogFatRestDayText3),
        DialogBodyText(context.l10n.foodRequerementDialogFatRestDayText4),
        DialogNetworkImage(
          'https://tandorost-a.ir/wp-content/uploads/2025/07/fat-2.png',
        ),
        DialogBodyText(context.l10n.foodRequerementDialogFatRestDayText5),
        DialogNetworkImage(
          'https://tandorost-a.ir/wp-content/uploads/2025/07/fat-4.png',
        ),
        DialogBodyText(context.l10n.foodRequerementDialogFatRestDayText6),
        DialogBodyText(context.l10n.foodRequerementDialogFatRestDayText7),
        DialogNetworkImage(
          'https://tandorost-a.ir/wp-content/uploads/2025/07/fat-3.png',
        ),
        DialogBodyText(context.l10n.foodRequerementDialogFatRestDayText8),
        DialogBodyTitle(context.l10n.foodRequerementDialogFatRestDaySubtitle2),
        DialogBodyText(context.l10n.foodRequerementDialogFatRestDayText9),
        DialogBodyText(context.l10n.foodRequerementDialogFatRestDayText10),
        DialogBodyText(context.l10n.foodRequerementDialogFatRestDayText11),
      ],
    );
  }
}

class TimeRestrictedDialogRestDay extends StatelessWidget {
  const TimeRestrictedDialogRestDay({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: context.l10n.timeRestrictedEatingLabel,
      contents: [
        DialogBodyText(context.l10n.timeRestrictedText1),
        DialogBodyText(context.l10n.timeRestrictedText2),
        DialogBodyText(context.l10n.timeRestrictedText3),
        DialogNetworkImage(
          'https://tandorost-a.ir/wp-content/uploads/2025/07/fasting-1.png',
        ),
        DialogBodyTitle(context.l10n.timeRestrictedSubtitle1),
        DialogBodyText(context.l10n.timeRestrictedText4),
        DialogBodyText(context.l10n.timeRestrictedText5),
        DialogBodyText(context.l10n.timeRestrictedText9),
        DialogBodyTitle(context.l10n.timeRestrictedSubtitle2),
        DialogBodyText(context.l10n.timeRestrictedText6),
        DialogBodyText(context.l10n.timeRestrictedText7),
        DialogBodyText(context.l10n.timeRestrictedText8),
        DialogBodyText(context.l10n.timeRestrictedText10),
      ],
    );
  }
}

class FoodRequerementDialogAgeRelatedFoodConsidarationRestDay
    extends StatelessWidget {
  const FoodRequerementDialogAgeRelatedFoodConsidarationRestDay({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: context.l10n.foodRequerementDialogAgeRelatedFoodConsidarationTitle,
      contents: [
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationRestDayText1,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationRestDayText2,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationRestDayText3,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationRestDayText4,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationRestDayText5,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationRestDayText6,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationRestDayText7,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationRestDayText8,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationRestDayText9,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationRestDayText10,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationRestDayText11,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationRestDayText12,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationRestDayText13,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationRestDayText14,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationRestDayText15,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationRestDayText16,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationRestDayText17,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationRestDayText18,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationRestDayText19,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationRestDayText20,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationRestDayText21,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationRestDayText22,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationRestDayText23,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationRestDayText24,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationRestDayText25,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationRestDayText26,
        ),
      ],
    );
  }
}

class FoodRequerementDialogAgeRelatedFoodConsidarationTraningDay
    extends StatelessWidget {
  const FoodRequerementDialogAgeRelatedFoodConsidarationTraningDay({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: context.l10n.foodRequerementDialogAgeRelatedFoodConsidarationTitle,
      contents: [
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationTrainnigDayText1,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationTrainnigDayText2,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationTrainnigDayText3,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationTrainnigDayText4,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationTrainnigDayText5,
        ),
        Text(
          context
              .l10n
              .foodRequerementDialogAgeRelatedFoodConsidarationTrainnigDayText6,
        ),
      ],
    );
  }
}
