import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_report_app/src/cubit/food_report_cubit.dart';
import 'package:food_report_app/src/widget/success_status_food_list.dart';
import 'package:tandorost_components/tandorost_components.dart';

class FoodListConsumer extends StatelessWidget {
  const FoodListConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: BlocConsumer<FoodReportCubit, FoodReportState>(
        listenWhen:
            (previous, current) =>
                previous.readFoodsNutritionStatus !=
                current.readFoodsNutritionStatus,
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
          }
        },
        buildWhen:
            (previous, current) =>
                previous.readFoodsNutritionStatus !=
                current.readFoodsNutritionStatus,
        builder: (context, state) {
          return switch (state.readFoodsNutritionStatus) {
            AsyncProcessingStatus.inital => AppAsyncStatusCard.inital(),
            AsyncProcessingStatus.loading => AppAsyncStatusCard.loading(),
            AsyncProcessingStatus.serverConnectionError =>
              AppAsyncStatusCard.serverError(),
            AsyncProcessingStatus.internetConnectionError =>
              AppAsyncStatusCard.internetConnectionError(),
            AsyncProcessingStatus.success => SuccessStatusFoodsList(
              foods: state.foods,
            ),
          };
        },
      ),
    );
  }
}
