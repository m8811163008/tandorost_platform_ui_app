import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:food_input_app/src/result_route/cubit/result_cubit.dart';
import 'package:tandorost_components/tandorost_components.dart';

class DeleteFoodDialog extends StatelessWidget {
  const DeleteFoodDialog({super.key, required this.food});
  final Food food;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResultCubit, ResultState>(
      listenWhen:
          (previous, current) =>
              previous.deletingStatus != current.deletingStatus,
      listener: (context, state) {
        if (state.deletingStatus.isConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.deletingStatus.isConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.deletingStatus.isSuccess) {
          Navigator.of(context).pop();
        }
      },
      child: AppDialog(
        title: context.l10n.delete,
        contents: [
          Text(
            context.l10n.delete_confirm_question(
              food.userNativeLanguageFoodName,
            ),
          ),
        ],
        submitButton: BlocBuilder<ResultCubit, ResultState>(
          buildWhen:
              (previous, current) =>
                  previous.deletingStatus != current.deletingStatus,
          builder: (context, state) {
            return state.deletingStatus.isLoading
                ? AppTextButton.loading(label: context.l10n.delete)
                : AppTextButton(
                  label: context.l10n.delete,
                  onTap: () {
                    context.read<ResultCubit>().deleteFood([food.id]);
                  },
                );
          },
        ),
      ),
    );
  }
}
