import 'package:flutter/material.dart';
import 'package:food_input_app/src/search_route/search_food/cubit/search_cubit.dart';
import 'package:food_input_app/src/search_route/search_food/food_ai_chat_search/loading_chat_button_indicator.dart';
import 'package:food_input_app/src/search_route/payment/payment_dialog_builder.dart';
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
                await _showPaymentDialog(context);
              }
            } else {
              await _requestMicrophonPremission(context);
            }
          },
          onLongPressUp: context.read<SearchCubit>().onSearchByVoicePressedUp,
        );

        bool isLoading = cubit.state.searchFoodsByVoiceInputStatus.isLoading;
        return !isLoading
            ? chatButton
            : LoadingChatButtonIndicator(chatButton: chatButton);
      },
    );
  }

  Future<void> _showPaymentDialog(BuildContext context) async {
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

  Future<void> _requestMicrophonPremission(BuildContext context) async {
    final content = context.l10n.searchRouteMicrophonePermissionMessage;
    final cubit = context.read<SearchCubit>();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(content)));
    await Future.delayed(Duration(seconds: 2));
    cubit.onRequestRecorderPremission();
  }
}
