import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:food_input_app/src/result_route/delete_food_dialog.dart';
import 'package:tandorost_components/tandorost_components.dart';

class EditFoodDialog extends StatelessWidget {
  const EditFoodDialog({super.key, required this.food});
  final Food food;

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: context.l10n.update,
      contents: [
        TextField(
          decoration: InputDecoration(label: Text(context.l10n.upsertDate)),
        ),
        TextField(
          decoration: InputDecoration(label: Text(context.l10n.foodName)),
        ),
        TextField(
          decoration: InputDecoration(
            label: Text(context.l10n.unitOfMeasurement),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            label: Text(context.l10n.quantityOfUnitOfMeasurement),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            label: Text(context.l10n.calculatedCalorie),
          ),
        ),
        TextField(decoration: InputDecoration(label: Text(context.l10n.fat))),
        TextField(
          decoration: InputDecoration(label: Text(context.l10n.protein)),
        ),
        TextField(
          decoration: InputDecoration(
            label: Text(context.l10n.carbohydrateSource),
          ),
        ),
        TextField(
          decoration: InputDecoration(label: Text(context.l10n.carbohydrate)),
        ),
      ],
      submitButton: TextButton(onPressed: () {}, child: Text(context.l10n.update)),
    );
  }
}
