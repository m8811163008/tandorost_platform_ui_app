import 'package:flutter/material.dart';
import 'package:food_report_app/src/cubit/food_report_cubit.dart';
import 'package:tandorost_components/tandorost_components.dart';

class DeleteFoodDialog extends StatelessWidget {
  const DeleteFoodDialog({super.key, required this.foodsId});
  final List<String> foodsId;

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: context.l10n.foodReportDeleteDialogTitle,
      contents: [Text(context.l10n.foodReportDeleteDialogContent)],
      submitButton: BlocConsumer<FoodReportCubit, FoodReportState>(
        listenWhen:
            (previous, current) =>
                previous.deleteFoodsNutritionsStatus !=
                current.deleteFoodsNutritionsStatus,
        listener: (context, state) {
          if (state.deleteFoodsNutritionsStatus.isConnectionError) {
            final content = context.l10n.networkError;
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(content)));
          } else if (state.deleteFoodsNutritionsStatus.isConnectionError) {
            final content = context.l10n.internetConnectionError;
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(content)));
          } else if (state.deleteFoodsNutritionsStatus.isSuccess) {
            context.read<FoodReportCubit>().readFoodsNutrition();
            context.read<FoodReportCubit>().readNutritionRequirements();
            context.read<FoodReportCubit>().resetSelectedFoods();
            Navigator.of(context).pop();
          }
        },
        buildWhen:
            (previous, current) =>
                previous.deleteFoodsNutritionsStatus !=
                current.deleteFoodsNutritionsStatus,
        builder: (context, state) {
          return state.deleteFoodsNutritionsStatus.isLoading
              ? AppTextButton.loading(label: context.l10n.delete)
              : AppTextButton(
                label: context.l10n.delete,
                onTap: () {
                  context.read<FoodReportCubit>().deleteFoodsNutritions(
                    foodsId,
                  );
                },
              );
        },
      ),
    );
  }
}
