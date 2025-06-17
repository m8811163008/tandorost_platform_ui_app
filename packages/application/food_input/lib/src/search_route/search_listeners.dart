import 'package:flutter/material.dart';
import 'package:food_input_app/src/search_route/payment/cubit/payment_cubit.dart';
import 'package:food_input_app/src/search_route/payment/payment_dialog_builder.dart';
import 'package:food_input_app/src/search_route/search_food/cubit/search_cubit.dart';
import 'package:tandorost_components/tandorost_components.dart';

class SearchBlocListeners extends StatelessWidget {
  const SearchBlocListeners({
    super.key,
    required this.child,
    this.onSeachFoodSuccess,
  });
  final Widget child;
  final VoidCallback? onSeachFoodSuccess;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>();
    return MultiBlocListener(
      listeners: [
        BlocListener<SearchCubit, SearchState>(
          listenWhen:
              (previous, current) =>
                  (previous.searchFoodsByVoiceInputStatus !=
                          current.searchFoodsByVoiceInputStatus ||
                      previous.searchFoodsByTextInputStatus !=
                          current.searchFoodsByTextInputStatus),
          listener: (context, state) async {
            if (state.searchFoodsByTextInputStatus.isSuccess ||
                state.searchFoodsByVoiceInputStatus.isSuccess) {
              cubit.resetStatus();
              onSeachFoodSuccess?.call();
            }
          },
        ),
        BlocListener<SearchCubit, SearchState>(
          listenWhen:
              (previous, current) =>
                  previous.searchFoodsByVoiceInputStatus !=
                  current.searchFoodsByVoiceInputStatus,
          listener: (context, state) {
            if (state.searchFoodsByVoiceInputStatus.isConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state.searchFoodsByVoiceInputStatus.isConnectionError) {
              final content = context.l10n.internetConnectionError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            }
          },
        ),
        BlocListener<SearchCubit, SearchState>(
          listenWhen:
              (previous, current) =>
                  previous.searchFoodsByTextInputStatus !=
                  current.searchFoodsByTextInputStatus,
          listener: (context, state) {
            if (state.searchFoodsByTextInputStatus.isConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state.searchFoodsByTextInputStatus.isConnectionError) {
              final content = context.l10n.internetConnectionError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            }
          },
        ),

        BlocListener<SearchCubit, SearchState>(
          listenWhen:
              (previous, current) =>
                  previous.canRequestForFoodNutrition !=
                      current.canRequestForFoodNutrition ||
                  previous.canRequestForFoodNutritionStatus !=
                      current.canRequestForFoodNutritionStatus,
          listener: (context, state) async {
            if (!state.canRequestForFoodNutrition) {
              await showDialog(
                context: context,
                builder: (_) {
                  return BlocProvider.value(
                    value: context.read<PaymentCubit>(),
                    child: PaymentDialogBuilder(),
                  );
                },
              );
            }
          },
        ),
        BlocListener<SearchCubit, SearchState>(
          listenWhen:
              (previous, current) =>
                  previous.canRequestForFoodNutritionStatus !=
                  current.canRequestForFoodNutritionStatus,
          listener: (context, state) async {
            if (state.canRequestForFoodNutritionStatus.isConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state
                .canRequestForFoodNutritionStatus
                .isConnectionError) {
              final content = context.l10n.internetConnectionError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            }
          },
        ),
      ],
      child: child,
    );
  }
}
