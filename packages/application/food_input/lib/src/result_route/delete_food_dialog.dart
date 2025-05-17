import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class DeleteFoodDialog extends StatelessWidget {
  const DeleteFoodDialog({super.key, required this.food});
  final Food food;

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: context.l10n.delete,
      contents: [
        Text(
          context.l10n.delete_confirm_question(food.userNativeLanguageFoodName),
        ),
      ],
      submitButton: TextButton(
        onPressed: () {},
        child: Text(context.l10n.delete),
      ),
    );
  }
}
