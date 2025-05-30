

import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class FoodSuggestionChips extends StatelessWidget {
  const FoodSuggestionChips({super.key});

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(width: context.sizeExtenstion.small);
    return Row(
      children: [
        ActionChip.elevated(label: Text('carbs'), onPressed: () {}),
        gap,
        ActionChip.elevated(label: Text('fats'), onPressed: () {}),
      ],
    );
  }
}
