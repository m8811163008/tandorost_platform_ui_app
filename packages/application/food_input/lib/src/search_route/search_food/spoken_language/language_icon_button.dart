import 'package:flutter/material.dart';
import 'package:food_input_app/src/search_route/search_food/cubit/search_cubit.dart';
import 'package:food_input_app/src/search_route/search_food/spoken_language/language_bottom_sheet_form.dart';
import 'package:tandorost_components/tandorost_components.dart';

class LanguageIconButton extends StatelessWidget {
  const LanguageIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      tooltip: context.l10n.selectLanguageBottomSheetHeading,
      onPressed: () async {
        await showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) {
            return BlocProvider.value(
              value: context.read<SearchCubit>(),
              child: AppBottomSheet(
                title: context.l10n.selectLanguageBottomSheetHeading,
                child: LanguageBottomSheetForm(),
              ),
            );
          },
        );
      },
      icon: Icon(Icons.language),
    );
  }
}
