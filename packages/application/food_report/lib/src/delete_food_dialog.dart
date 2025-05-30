import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_report_app/src/cubit/food_report_cubit.dart';
import 'package:tandorost_components/tandorost_components.dart';

class DeleteFoodDialog extends StatelessWidget {
  const DeleteFoodDialog({super.key, required this.foodsId});
  final List<String> foodsId;

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: 'context.l10n.fitnessProfileDeleteDataPointDialogLabel',
      contents: [
        Text('context.l10n.fitnessProfileDeleteDataPointDialogDescription'),
      ],
      submitButton: BlocConsumer<FoodReportCubit, FoodReportState>(
        listenWhen:
            (previous, current) =>
                previous.deleteFoodsNutritionsStatus !=
                current.deleteFoodsNutritionsStatus,
        listener: (context, state) {
          if (state.deleteFoodsNutritionsStatus.isServerConnectionError) {
            final content = context.l10n.networkError;
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(content)));
          } else if (state
              .deleteFoodsNutritionsStatus
              .isServerConnectionError) {
            final content = context.l10n.internetConnectionError;
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(content)));
          } else if (state.deleteFoodsNutritionsStatus.isSuccess) {
            Navigator.of(context).pop();
            // fetch data
            // context.read<FitnessProfileCubit>().readFitnessData();
            // context.read<FitnessProfileCubit>().readUserPhysicalProfile();
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
