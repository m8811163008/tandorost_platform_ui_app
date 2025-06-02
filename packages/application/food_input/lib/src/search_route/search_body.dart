import 'package:food_input_app/src/search_route/cubit/search_cubit.dart';
import 'package:food_input_app/src/search_route/language_bottom_sheet.dart';

import 'package:flutter/material.dart';
import 'package:food_input_app/src/search_route/search_bottom_sheet.dart';

import 'package:tandorost_components/tandorost_components.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key, this.onSeachFoodSuccess});
  final VoidCallback? onSeachFoodSuccess;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>();
    return MultiBlocListener(
      listeners: [
        BlocListener<SearchCubit, SearchState>(
          listenWhen:
              (previous, current) =>
                  previous.canRequestForFoodNutritionStatus !=
                  current.canRequestForFoodNutritionStatus,
          listener: (context, state) async {
            if (state
                .canRequestForFoodNutritionStatus
                .isServerConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state
                .canRequestForFoodNutritionStatus
                .isServerConnectionError) {
              final content = context.l10n.internetConnectionError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (!state.canRequestForFoodNutrition &&
                state.canRequestForFoodNutritionStatus.isSuccess) {
              await showDialog(
                context: context,
                builder: (context) {
                  return PaymentDialog();
                },
              );
            }
          },
        ),
        // handle routing
        BlocListener<SearchCubit, SearchState>(
          listenWhen:
              (previous, current) =>
                  (previous.searchFoodsByVoiceInputStatus !=
                          current.searchFoodsByVoiceInputStatus ||
                      previous.searchFoodsByTextInputStatus !=
                          current.searchFoodsByTextInputStatus) &&
                  (current.searchFoodsByTextInputStatus.isSuccess ||
                      current.searchFoodsByVoiceInputStatus.isSuccess),
          listener: (context, state) async {
            cubit.resetStatus();
            onSeachFoodSuccess?.call();
          },
        ),
        // handle errors
        BlocListener<SearchCubit, SearchState>(
          listenWhen:
              (previous, current) =>
                  previous.searchFoodsByVoiceInputStatus !=
                  current.searchFoodsByVoiceInputStatus,
          listener: (context, state) {
            if (state.searchFoodsByVoiceInputStatus.isServerConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state
                .searchFoodsByVoiceInputStatus
                .isServerConnectionError) {
              final content = context.l10n.internetConnectionError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            }
          },
        ),
      ],

      child: Column(
        children: [
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton.filledTonal(
                onPressed: () {
                  showBottomSheet(
                    context: context,
                    builder: (_) {
                      return SearchFoodBottomSheet();
                    },
                  );
                },
                icon: Icon(Icons.keyboard),
              ),
              FutureBuilder(
                future: context.read<SearchCubit>().isPremissionAllowed,
                builder: (context, snapshot) {
                  final chatButton = AIChatButton(
                    onLongPressStart:
                        context.read<SearchCubit>().onSearchByVoicePressedDown,
                    onLongPressUp:
                        context.read<SearchCubit>().onSearchByVoicePressedUp,
                  );
                  bool isAllowed = snapshot.data ?? false;
                  bool isLoading = context.select<SearchCubit, bool>(
                    (cubit) =>
                        cubit.state.searchFoodsByVoiceInputStatus.isLoading,
                  );
                  return IgnorePointer(
                    ignoring: !isAllowed || isLoading,
                    child: chatButton,
                  );
                },
              ),
              IconButton.filledTonal(
                onPressed: () {
                  showBottomSheet(
                    context: context,
                    builder: (_) {
                      return LanguageBottomSheet();
                    },
                  );
                },
                icon: Icon(Icons.language),
              ),
            ],
          ),
          SizedBox(height: context.sizeExtenstion.extraLarge),
        ],
      ),
    );
  }
}
