import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class DeleteFoodDialog extends StatelessWidget {
  const DeleteFoodDialog({super.key, required this.food});
  final Food food;

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: 'title',
      contents: [
        Text('Are you sure delete ${food.userNativeLanguageFoodName}?'),
      ],
      submitButton: TextButton(onPressed: () {}, child: Text('Delete')),
    );
  }
}

