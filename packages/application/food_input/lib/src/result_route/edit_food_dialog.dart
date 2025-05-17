import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class EditFoodDialog extends StatelessWidget {
  const EditFoodDialog({super.key, required this.food});
  final Food food;

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(height: context.sizeExtenstion.small);
    return AppDialog(
      fullscreen: true,
      title: context.l10n.update,
      contents: [
        TextField(
          decoration: InputDecoration(label: Text(context.l10n.upsertDate)),
        ),
        gap,
        TextField(
          decoration: InputDecoration(label: Text(context.l10n.foodName)),
        ),
        gap,
        TextField(
          decoration: InputDecoration(
            label: Text(context.l10n.unitOfMeasurement),
          ),
        ),
        gap,
        TextField(
          decoration: InputDecoration(
            label: Text(context.l10n.quantityOfUnitOfMeasurement),
          ),
        ),
        gap,
        TextField(
          decoration: InputDecoration(
            label: Text(context.l10n.calculatedCalorie),
          ),
        ),
        gap,
        TextField(decoration: InputDecoration(label: Text(context.l10n.fat))),
        gap,
        TextField(
          decoration: InputDecoration(label: Text(context.l10n.protein)),
        ),
        gap,
        TextField(
          decoration: InputDecoration(
            label: Text(context.l10n.carbohydrateSource),
          ),
        ),
        gap,
        TextField(
          decoration: InputDecoration(label: Text(context.l10n.carbohydrate)),
        ),
      ],
      submitButton: TextButton(
        onPressed: () {},
        child: Text(context.l10n.update),
      ),
    );
  }
}
