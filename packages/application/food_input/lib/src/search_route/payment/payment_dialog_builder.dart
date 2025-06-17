import 'package:flutter/material.dart';
import 'package:food_input_app/src/search_route/payment/cubit/payment_cubit.dart';
import 'package:tandorost_components/tandorost_components.dart';

class PaymentDialogBuilder extends StatelessWidget {
  const PaymentDialogBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return PaymentDialog(
      onPlanTap: (planType) {
        context.read<PaymentCubit>().onChangeSelectedSubscriptionType(planType);
        context.read<PaymentCubit>().onConnectToCofeBazzar();
      },
    );
  }
}
