import 'package:flutter/material.dart';
import 'package:food_input_app/src/search_route/payment/cubit/payment_cubit.dart';
import 'package:tandorost_components/tandorost_components.dart';

class PaymentBlocListeners extends StatelessWidget {
  const PaymentBlocListeners({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PaymentCubit, PaymentState>(
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
              context.read<PaymentCubit>().onCafeBazzarSubscribe();
            }
          },
        ),

        BlocListener<PaymentCubit, PaymentState>(
          listenWhen:
              (previous, current) =>
                  previous.coffeBazzarConnectionStatus !=
                  current.coffeBazzarConnectionStatus,
          listener: (context, state) async {
            //web
            final content = context.l10n.bazzarNotFound;
            if (state.coffeBazzarConnectionStatus.isConnectionError) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state.coffeBazzarConnectionStatus.isSuccess) {
              context.read<PaymentCubit>().onReadUserProfile();
            }
          },
        ),
        BlocListener<PaymentCubit, PaymentState>(
          listenWhen:
              (previous, current) =>
                  previous.onReadCafeBazzarSkusStatus !=
                  current.onReadCafeBazzarSkusStatus,
          listener: (context, state) async {
            //web
            if (state.onReadCafeBazzarSkusStatus.isConnectionError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.exceptionDetail!)));
            }
          },
        ),

        BlocListener<PaymentCubit, PaymentState>(
          listenWhen:
              (previous, current) =>
                  previous.onCafeBazzarSubscribeStatus !=
                  current.onCafeBazzarSubscribeStatus,
          listener: (context, state) async {
            //web
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
              context.read<PaymentCubit>().onReadCafeBazzarSkus();
            }
          },
        ),

        BlocListener<PaymentCubit, PaymentState>(
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

        BlocListener<PaymentCubit, PaymentState>(
          listenWhen:
              (previous, current) =>
                  previous.readCoffeBazzarPaymentStatus !=
                  current.readCoffeBazzarPaymentStatus,
          listener: (context, state) async {
            //web
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
        BlocListener<PaymentCubit, PaymentState>(
          listenWhen:
              (previous, current) =>
                  previous.onReadUserProfileStatus !=
                      current.onReadUserProfileStatus ||
                  previous.onReadCafeBazzarSkusStatus !=
                      current.onReadCafeBazzarSkusStatus,
          listener: (context, state) async {
            //web
            if (state.onReadUserProfileStatus.isSuccess &&
                state.onReadCafeBazzarSkusStatus.isSuccess) {
              context.read<PaymentCubit>().onCreateSubscriptionPayments();
            }
          },
        ),
      ],
      child: child,
    );
  }
}
