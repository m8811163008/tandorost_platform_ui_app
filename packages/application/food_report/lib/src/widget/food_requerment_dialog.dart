import 'package:flutter/material.dart';
import 'package:food_report_app/food_report.dart';
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
    context.read<FoodReportCubit>().readProfile();
    
    return AppDialog(
      title: context.l10n.foodRequerementDialogHydrationTitle,
      contents: [
        Text(
          context.l10n.foodRequerementDialogHydrationRestDayText1,
        ),
        Text(
          context.l10n.foodRequerementDialogHydrationRestDayText2,
        ),
        Text(
          context.l10n.foodRequerementDialogHydrationRestDayText3,
        ),
        Text(
          context.l10n.foodRequerementDialogHydrationRestDayText4,
        ),
        Text(
          context.l10n.foodRequerementDialogHydrationRestDayText5(context.select((FoodReportCubit cubit) => cubit.state.) ? 2.5 : 2.0),
        ),
      ],
    );
  }
}
