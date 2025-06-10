import 'package:flutter/material.dart';
import 'package:food_input_app/src/search_route/cubit/search_cubit.dart';
import 'package:food_input_app/src/search_route/search_food/spoken_language/language_bottom_sheet_form.dart';
import 'package:food_input_app/src/search_route/search_food/food_ai_text_field_search/search_form_layout.dart';
import 'package:tandorost_components/tandorost_components.dart';

class FoodBottomSheetButton extends StatelessWidget {
  const FoodBottomSheetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      tooltip: context.l10n.searchFoodBottomSheetHeading,
      onPressed: () async {
        await showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) {
            return BlocProvider.value(
              value: context.read<SearchCubit>(),
              child: AppBottomSheet(
                title: context.l10n.searchFoodBottomSheetHeading,
                child: LanguageBottomSheetForm(),
              ),
            );
          },
        );
      },
      icon: Icon(Icons.keyboard),
    );
  }
}
