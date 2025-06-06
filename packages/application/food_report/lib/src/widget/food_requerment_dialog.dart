import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class FoodRequrementDialog extends StatelessWidget {
  const FoodRequrementDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog(title: 'Carbs', contents: [Text('data')]);
  }
}
