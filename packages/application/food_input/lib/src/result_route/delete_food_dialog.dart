import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_input_app/src/result_route/cubit/result_cubit.dart';
import 'package:tandorost_components/tandorost_components.dart';

class DeleteFoodDialog extends StatelessWidget {
  const DeleteFoodDialog({super.key, required this.food});
  final Food food;

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      listener: (context, state) {
        
      },
      child: AppDialog(
        title: context.l10n.delete,
        contents: [
          Text(
            context.l10n.delete_confirm_question(food.userNativeLanguageFoodName),
          ),
        ],
        submitButton: BlocBuilder<ResultCubit, ResultState>(
          buildWhen: (previous, current) => previous.deletingStatus != current.deletingStatus,
          builder: (context, state) {
            return state.updatingStatus.isLoading
                ? AppTextButton.loading(label: context.l10n.update)
                : AppTextButton.loading(
                  label: context.l10n.update,
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
