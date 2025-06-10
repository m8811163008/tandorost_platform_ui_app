import 'package:flutter/material.dart';
import 'package:food_input_app/src/search_route/cubit/search_cubit.dart';
import 'package:tandorost_components/tandorost_components.dart';

class SearchListeners extends StatelessWidget {
  const SearchListeners({
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
                  previous.onReadUserProfileStatus !=
                  current.onReadUserProfileStatus,
          listener: (context, state) async {
            if (state.onReadUserProfileStatus.isConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state.onReadUserProfileStatus.isConnectionError) {
              final content = context.l10n.internetConnectionError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state.onReadUserProfileStatus.isSuccess) {
              context.read<SearchCubit>().onCafeBazzarSubscribe();
            }
          },
        ),
        BlocListener<SearchCubit, SearchState>(
          listenWhen:
              (previous, current) =>
                  previous.onReadUserProfileStatus !=
                      current.onReadUserProfileStatus ||
                  previous.onReadCafeBazzarSkusStatus !=
                      current.onReadCafeBazzarSkusStatus,
          listener: (context, state) async {
            if (state.onReadUserProfileStatus.isSuccess &&
                state.onReadCafeBazzarSkusStatus.isSuccess) {
              context.read<SearchCubit>().onCreateSubscriptionPayments();
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
