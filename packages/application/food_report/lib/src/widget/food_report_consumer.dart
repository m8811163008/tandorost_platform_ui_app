import 'dart:async';

import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:food_report_app/src/cubit/food_report_cubit.dart';
import 'package:food_report_app/src/widget/food_report_statics.dart';
import 'package:food_report_app/src/widget/food_report_statics_home_widget.dart';
import 'package:food_report_app/src/widget/home_widget.dart';
import 'package:home_widget/home_widget.dart';
import 'package:tandorost_components/tandorost_components.dart';

class FoodReportStaticsConsumer extends StatefulWidget {
  const FoodReportStaticsConsumer({super.key, this.goToFitnessProfileRoute});
  final VoidCallback? goToFitnessProfileRoute;

  @override
  State<FoodReportStaticsConsumer> createState() =>
      _FoodReportStaticsConsumerState();
}

class _FoodReportStaticsConsumerState extends State<FoodReportStaticsConsumer> {
  final _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Center(
      key: _globalKey,
      child: BlocConsumer<FoodReportCubit, FoodReportState>(
        listenWhen:
            (previous, current) =>
                previous.readNutritionRequirementsStatus !=
                current.readNutritionRequirementsStatus,
        listener: (context, state) async {
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
            } else {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            }
            // final state = context.read<FoodReportCubit>().state;
          }
        },
        buildWhen:
            (previous, current) =>
                previous.readNutritionRequirementsStatus !=
                    current.readNutritionRequirementsStatus ||
                previous.readFoodsNutritionStatus !=
                    current.readFoodsNutritionStatus ||
                previous.selectedTab != current.selectedTab ||
                previous.nutritionRequirements != current.nutritionRequirements,
        builder: (context, state) {
          if (state.readNutritionRequirementsStatus.isSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              if (_globalKey.currentContext != null) {
                // Your logic here, e.g. render widget, update imagePath, etc.
                final homeWidget = Column(
                  children: [
                    FoodReportStaticsHomeWidget(
                      totalMacroNutrition: state.totalMacroNutrition,
                      nutritionRequirement:
                          state.nutritionRequirements?.restDay,
                      selectedTab: SelectedTab.restDay,
                      context: context,
                    ),
                    SizedBox(height: context.sizeExtenstion.extraSmall),
                    FoodReportStaticsHomeWidget(
                      totalMacroNutrition: state.totalMacroNutrition,
                      nutritionRequirement:
                          state.nutritionRequirements?.trainingDay,
                      selectedTab: SelectedTab.exerciseDay,
                      context: context,
                    ),
                  ],
                );
                // final homeWidget = Placeholder();
                await HomeWidget.renderFlutterWidget(
                  homeWidget,
                  key: 'filename',
                  logicalSize: Size(MediaQuery.of(context).size.width, 420),
                  pixelRatio:
                      MediaQuery.of(
                        _globalKey.currentContext!,
                      ).devicePixelRatio,
                );
              }
              updateHeadline();
            });
          }
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
              selectedTab: state.selectedTab,
            ),
          };
        },
      ),
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
              widget.goToFitnessProfileRoute?.call();
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
