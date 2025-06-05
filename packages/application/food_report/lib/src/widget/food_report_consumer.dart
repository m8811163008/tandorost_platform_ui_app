import 'dart:async';

import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
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
        if (state.readNutritionRequirementsStatus.isConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.readNutritionRequirementsStatus.isConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.readFoodsNutritionStatus.isSuccess) {
          if (state.nutritionRequirements == null) {
            _showBanner(context);
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
          AsyncProcessingStatus.connectionError =>
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

  void _showBanner(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.showMaterialBanner(
      MaterialBanner(
        content: Text(context.l10n.foodReportBannerContent),
        leading: Icon(Icons.agriculture_outlined),
        onVisible: () {
          Timer(Duration(seconds: 5), () {
            messenger.hideCurrentMaterialBanner();
          });
        },
        actions: <Widget>[
          TextButton(
            onPressed: () {
              messenger.hideCurrentMaterialBanner();
              goToFitnessProfileRoute?.call();
            },
            child: Text(context.l10n.foodReportBannerGotoLabel),
          ),
          TextButton(
            onPressed: () {
              messenger.hideCurrentMaterialBanner();
            },
            child: Text(context.l10n.cancle),
          ),
        ],
      ),
    );
  }
}
