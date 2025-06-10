import 'package:flutter/material.dart';
import 'package:food_input_app/src/search_route/cubit/search_cubit.dart';
import 'package:food_input_app/src/search_route/search_food/payment/payment_dialog_builder.dart';
import 'package:tandorost_components/tandorost_components.dart';

class PaymentBlocListeners extends StatelessWidget {
  const PaymentBlocListeners({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners:[
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
      ],
      child: child,
    );
  }
}