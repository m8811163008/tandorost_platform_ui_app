import 'package:flutter/material.dart';
import 'package:food_input_app/src/search_route/cubit/search_cubit.dart';
import 'package:tandorost_components/tandorost_components.dart';

class SearchFoodByTextSubmitButton extends StatelessWidget {
  const SearchFoodByTextSubmitButton({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen:
          (previous, current) =>
              previous.searchFoodsByTextInputStatus !=
              current.searchFoodsByTextInputStatus,
      builder: (context, state) {
        if (state.searchFoodsByTextInputStatus.isLoading) {
          return AppOutLineButton.loading(
            label: context.l10n.searchFoodBottomSheetButtonLabel,
          );
        } else {
          return AppOutLineButton(
            onTap: onTap,
            label: context.l10n.searchFoodBottomSheetButtonLabel,
          );
        }
      },
    );
  }
}
