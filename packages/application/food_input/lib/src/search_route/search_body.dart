import 'package:domain_model/domain_model.dart';
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
                  previous.coffeBazzarConnectionStatus !=
                  current.coffeBazzarConnectionStatus,
          listener: (context, state) async {
            if (state.coffeBazzarConnectionStatus.isServerConnectionError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.exceptionDetail!)));
            } else if (state.canRequestForFoodNutritionStatus.isSuccess) {
              context.read<SearchCubit>().onCafeBazzarSubscribe();
            }
          },
        ),
        BlocListener<SearchCubit, SearchState>(
          listenWhen:
              (previous, current) =>
                  previous.onCafeBazzarSubscribeStatus !=
                  current.onCafeBazzarSubscribeStatus,
          listener: (context, state) async {
            if (state.onCafeBazzarSubscribeStatus.isServerConnectionError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.exceptionDetail!)));
            } else if (state.onCafeBazzarSubscribeStatus.isSuccess) {
              context.read<SearchCubit>().onCreateSubscriptionPayments();
            }
          },
        ),
        BlocListener<SearchCubit, SearchState>(
          listenWhen:
              (previous, current) =>
                  previous.onCreateSubscriptionPaymentsStatus !=
                  current.onCreateSubscriptionPaymentsStatus,
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
            }
          },
        ),
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
                builder: (_) {
                  return BlocProvider.value(
                    value: context.read<SearchCubit>(),
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
                  previous.readCoffeBazzarPaymentStatus !=
                  current.readCoffeBazzarPaymentStatus,
          listener: (context, state) async {
            if (state.readCoffeBazzarPaymentStatus.isServerConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state
                .readCoffeBazzarPaymentStatus
                .isServerConnectionError) {
              final content = context.l10n.internetConnectionError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
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
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: context.sizeExtenstion.medium),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton.filledTonal(
                onPressed: () async {
                  await showModalBottomSheet(
                    context: context,
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
              ),
              Flexible(
                child: FutureBuilder(
                  future: context.read<SearchCubit>().isPremissionAllowed,
                  builder: (context, snapshot) {
                    final chatButton = AIChatButton(
                      onLongPressStart:
                          context
                              .read<SearchCubit>()
                              .onSearchByVoicePressedDown,
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
              ),
              IconButton.filledTonal(
                onPressed: () async {
                  await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (_) {
                      return FractionallySizedBox(
                        heightFactor: 1,
                        child: BlocProvider.value(
                          value: context.read<SearchCubit>(),
                          child: LanguageBottomSheet(),
                        ),
                      );
                    },
                  );
                },
                icon: Icon(Icons.language),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentDialogBuilder extends StatelessWidget {
  const PaymentDialogBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentDialog(
      submitButtonPlanMonthly:
          context.select(
                (SearchCubit cubit) =>
                    cubit.state.coffeBazzarConnectionStatus.isLoading,
              )
              ? AppOutLineButton.loading(label: 'one')
              : AppOutLineButton(
                label: 'one',
                onTap: () {
                  context.read<SearchCubit>().onConnectToCofeBazzar();
                  context.read<SearchCubit>().onChangeSelectedSubscriptionType(
                    SubscriptionType.oneMonth,
                  );
                },
              ),
      submitButtonPlanQuarterly:
          context.select(
                (SearchCubit cubit) =>
                    cubit.state.coffeBazzarConnectionStatus.isLoading,
              )
              ? AppOutLineButton.loading(label: 'three')
              : AppOutLineButton(
                label: 'three',
                onTap: () {
                  context.read<SearchCubit>().onConnectToCofeBazzar();
                  context.read<SearchCubit>().onChangeSelectedSubscriptionType(
                    SubscriptionType.threeMonth,
                  );
                },
              ),
    );
  }
}
