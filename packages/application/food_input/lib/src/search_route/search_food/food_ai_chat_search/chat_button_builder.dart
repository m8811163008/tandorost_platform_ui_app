import 'package:flutter/material.dart';
import 'package:food_input_app/src/search_route/cubit/search_cubit.dart';
import 'package:food_input_app/src/search_route/search_food/payment/payment_dialog_builder.dart';
import 'package:tandorost_components/tandorost_components.dart';

class ChatButtonBuilder extends StatelessWidget {
  const ChatButtonBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>();
    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen:
          (previous, current) =>
              previous.isRecorderPermissionAllowed !=
                  current.isRecorderPermissionAllowed ||
              previous.canRequestForFoodNutrition !=
                  current.canRequestForFoodNutrition ||
              previous.searchFoodsByVoiceInputStatus !=
                  current.searchFoodsByVoiceInputStatus,
      builder: (context, state) {
        final chatButton = AIChatButton(
          onLongPressStart: () async {
            if (state.isRecorderPermissionAllowed) {
              if (state.canRequestForFoodNutrition) {
                context.read<SearchCubit>().onSearchByVoicePressedDown();
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
              final content =
                  context.l10n.searchRouteMicrophonePermissionMessage;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
              await Future.delayed(Duration(seconds: 2));
              if (context.mounted) {
                context.read<SearchCubit>().onRequestRecorderPremission();
              }
            }
          },

          onLongPressUp: context.read<SearchCubit>().onSearchByVoicePressedUp,
        );

        bool isLoading = cubit.state.searchFoodsByVoiceInputStatus.isLoading;
        return !isLoading
            ? chatButton
            : Stack(
              alignment: Alignment.center,
              children: [
                IgnorePointer(ignoring: true, child: chatButton),
                Material(
                  color: context.themeData.colorScheme.primary.withAlpha(50),
                  shape: const CircleBorder(),
                  child: SizedBox.fromSize(
                    size: context.sizeExtenstion.chatButton,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            context.l10n.foodInputChatButtonLoadingText1,
                            style: context.themeData.textTheme.bodyMedium,
                          ),
                          Text(
                            context.l10n.foodInputChatButtonLoadingText2,
                            style: context.themeData.textTheme.bodySmall,
                          ),
                          SizedBox(height: context.sizeExtenstion.extraSmall),
                          SizedBox(
                            width: context.sizeExtenstion.chatButton.width / 3,
                            child: LinearProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                context.themeData.colorScheme.primary,
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
    );
  }
}
