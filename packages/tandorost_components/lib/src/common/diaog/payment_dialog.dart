import 'package:flutter/material.dart';
import 'package:tandorost_components/src/common/layout/payment_background.dart';
import 'package:tandorost_components/tandorost_components.dart';

class PaymentDialog extends StatelessWidget {
  const PaymentDialog({
    super.key,
    this.submitButtonPlanMonthly,
    this.submitButtonPlanQuarterly,
  });
  final Widget? submitButtonPlanMonthly;
  final Widget? submitButtonPlanQuarterly;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.sizeExtenstion.medium),
          ),
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 2 / 3,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    context.sizeExtenstion.medium,
                  ),

                  child: PaymentBackground(),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(context.sizeExtenstion.medium),
                child: Column(
                  children: [
                    Text(
                      'Payment plans',
                      style: context.textTheme.headlineMedium,
                    ),
                    Wrap(
                      children: [
                        PaymentCard(submitButton: submitButtonPlanMonthly),
                        PaymentCard(submitButton: submitButtonPlanQuarterly),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  const PaymentCard({super.key, this.submitButton});
  final Widget? submitButton;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        children: [
          Text('plan name', style: context.textTheme.headlineSmall),
          Divider(),
          Text('137', style: context.textTheme.titleMedium),
          Text('ماهانه'),
          SizedBox(height: context.sizeExtenstion.small),
          PaymentCardRow(text: 'انتخاب یک بهترین'),
          PaymentCardRow(text: 'یک از بهترین'),
          PaymentCardRow(text: 'کاهش وزن سریع'),
          PaymentCardRow(text: 'دقیق ترین روش کاهش'),
          SizedBox(height: context.sizeExtenstion.medium),
          if (submitButton != null) submitButton!,
        ],
      ),
    );
  }
}

class PaymentCardRow extends StatelessWidget {
  const PaymentCardRow({super.key, this.text = ''});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.check, color: context.themeData.colorScheme.primary),
        Text('label'),
      ],
    );
  }
}
