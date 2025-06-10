import 'package:flutter/material.dart';
import 'package:food_input_app/src/search_route/cubit/search_cubit.dart';
import 'package:food_input_app/src/search_route/search_bottom_sheet.dart';
import 'package:tandorost_components/tandorost_components.dart';

class FoodBottomSheetButton extends StatelessWidget {
  const FoodBottomSheetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      onPressed: () async {
        await showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) {
            return FractionallySizedBox(
              heightFactor: 1,
              child: BlocProvider.value(
                value: context.read<SearchCubit>(),
                child: SearchFoodBottomSheet(),
              ),
            );
          },
        );
      },
      icon: Icon(Icons.keyboard),
    );
  }
}
