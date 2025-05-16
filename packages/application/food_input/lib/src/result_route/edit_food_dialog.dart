import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:food_input_app/src/result_route/delete_food_dialog.dart';

class EditFoodDialog extends StatelessWidget {
  const EditFoodDialog({super.key, required this.food});
  final Food food;

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: 'Editing food',
      contents: [
        TextField(decoration: InputDecoration(label: Text('Upsert date'))),
        TextField(decoration: InputDecoration(label: Text('Field2'))),
        TextField(decoration: InputDecoration(label: Text('Field3'))),
      ],
      submitButton: TextButton(onPressed: () {}, child: Text('Save')),
    );
  }
}
