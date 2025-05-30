

import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_report_app/src/cubit/food_report_cubit.dart';
import 'package:food_report_app/src/widget/food_report_statics.dart';
import 'package:tandorost_components/tandorost_components.dart';

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
                  TextButton(
                    onPressed: goToFitnessProfileRoute,
                    child: Text('Go to '),
                  ),
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
              previous.readFoodsNutritionStatus !=
                  current.readFoodsNutritionStatus ||
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