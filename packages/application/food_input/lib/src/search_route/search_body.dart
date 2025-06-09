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
                  previous.onCreateSubscriptionPaymentsStatus !=
                  current.onCreateSubscriptionPaymentsStatus,
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
                  previous.coffeBazzarConnectionStatus !=
                  current.coffeBazzarConnectionStatus,
          listener: (context, state) async {
            final content = context.l10n.bazzarNotFound;
            if (state.coffeBazzarConnectionStatus.isConnectionError) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state.coffeBazzarConnectionStatus.isSuccess) {
              context.read<SearchCubit>().onReadUserProfile();
            }
          },
        ),
        BlocListener<SearchCubit, SearchState>(
          listenWhen:
              (previous, current) =>
                  previous.onReadCafeBazzarSkusStatus !=
                  current.onReadCafeBazzarSkusStatus,
          listener: (context, state) async {
            if (state.onReadCafeBazzarSkusStatus.isConnectionError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.exceptionDetail!)));
            }
          },
        ),

        BlocListener<SearchCubit, SearchState>(
          listenWhen:
              (previous, current) =>
                  previous.onCafeBazzarSubscribeStatus !=
                  current.onCafeBazzarSubscribeStatus,
          listener: (context, state) async {
            if (state.onCafeBazzarSubscribeStatus.isConnectionError) {
              Navigator.of(context).pop();
              final message =
                  state.exceptionDetail?.contains('PURCHASE_CANCELLED') == true
                      ? context.l10n.bazzarFailPayment
                      : state.exceptionDetail ?? '';
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message)));
            } else if (state.onCafeBazzarSubscribeStatus.isSuccess) {
              context.read<SearchCubit>().onReadCafeBazzarSkus();
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

        BlocListener<SearchCubit, SearchState>(
          listenWhen:
              (previous, current) =>
                  previous.onCreateSubscriptionPaymentsStatus !=
                  current.onCreateSubscriptionPaymentsStatus,
          listener: (context, state) async {
            if (state.onCreateSubscriptionPaymentsStatus.isConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state
                .onCreateSubscriptionPaymentsStatus
                .isConnectionError) {
              final content = context.l10n.internetConnectionError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state.onCreateSubscriptionPaymentsStatus.isSuccess) {
              Navigator.of(context).pop();
              final content = context.l10n.bazzarSuccessfulPayment;
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
            if (state.readCoffeBazzarPaymentStatus.isConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state.readCoffeBazzarPaymentStatus.isConnectionError) {
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
              ),
              Flexible(
                child: BlocBuilder<SearchCubit, SearchState>(
                  buildWhen:
                      (previous, current) =>
                          previous.isRecorderPermissionAllowed !=
                              current.isRecorderPermissionAllowed ||
                          previous.canRequestForFoodNutrition !=
                              current.canRequestForFoodNutrition,
                  builder: (context, state) {
                    final chatButton = AIChatButton(
                      onLongPressStart: () async {
                        if (state.isRecorderPermissionAllowed) {
                          if (state.canRequestForFoodNutrition) {
                            context
                                .read<SearchCubit>()
                                .onSearchByVoicePressedDown();
                          } else {
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
                        } else {
                          context
                              .read<SearchCubit>()
                              .onRequestRecorderPremission();
                        }
                      },

                      onLongPressUp:
                          context.read<SearchCubit>().onSearchByVoicePressedUp,
                    );

                    bool isLoading = context.select<SearchCubit, bool>(
                      (cubit) =>
                          cubit.state.searchFoodsByVoiceInputStatus.isLoading,
                    );
                    return !isLoading
                        ? Stack(
                          alignment: Alignment.center,
                          children: [
                            chatButton,
                            GestureDetector(
                              onLongPressStart: (_) async {
                                if (state.isRecorderPermissionAllowed) {
                                  if (state.canRequestForFoodNutrition) {
                                    context
                                        .read<SearchCubit>()
                                        .onSearchByVoicePressedDown();
                                  } else {
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
                                } else {
                                  context
                                      .read<SearchCubit>()
                                      .onRequestRecorderPremission();
                                }
                              },
                              onLongPressUp:
                                  context
                                      .read<SearchCubit>()
                                      .onSearchByVoicePressedUp,
                              child: SizedBox.fromSize(
                                size: context.sizeExtenstion.chatButton,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        context.l10n.aiChatButtonTitle,
                                        style:
                                            context
                                                .themeData
                                                .textTheme
                                                .bodyMedium,
                                      ),
                                      Text(
                                        context.l10n.aiChatButtonSubTitle,
                                        style:
                                            context
                                                .themeData
                                                .textTheme
                                                .bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                        : Stack(
                          alignment: Alignment.center,
                          children: [
                            IgnorePointer(ignoring: true, child: chatButton),
                            Material(
                              color: context.themeData.colorScheme.primary
                                  .withAlpha(50),
                              shape: const CircleBorder(),
                              child: SizedBox.fromSize(
                                size: context.sizeExtenstion.chatButton,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        context
                                            .l10n
                                            .foodInputChatButtonLoadingText1,
                                        style:
                                            context
                                                .themeData
                                                .textTheme
                                                .bodyMedium,
                                      ),
                                      Text(
                                        context
                                            .l10n
                                            .foodInputChatButtonLoadingText2,
                                        style:
                                            context
                                                .themeData
                                                .textTheme
                                                .bodySmall,
                                      ),
                                      SizedBox(
                                        height:
                                            context.sizeExtenstion.extraSmall,
                                      ),
                                      SizedBox(
                                        width:
                                            context
                                                .sizeExtenstion
                                                .chatButton
                                                .width /
                                            3,
                                        child: LinearProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                context
                                                    .themeData
                                                    .colorScheme
                                                    .primary,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
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
      onPlanTap: (planType) {
        context.read<SearchCubit>().onChangeSelectedSubscriptionType(planType);
        context.read<SearchCubit>().onConnectToCofeBazzar();
      },
    );
  }
}
