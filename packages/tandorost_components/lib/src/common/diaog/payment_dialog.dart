import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class PaymentDialog extends StatelessWidget {
  const PaymentDialog({super.key, this.onPlanTap});
  final ValueSetter<SubscriptionType>? onPlanTap;

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: SingleChildScrollView(
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: PaymentBackground(),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(context.sizeExtenstion.medium),
            child: Column(
              children: [
                Text('Payment plans', style: context.textTheme.headlineMedium),
                Wrap(
                  children: [
                    PaymentCard(
                      submitButton: AppOutLineButton(
                        label: 'one',
                        onTap: () {
                          onPlanTap?.call(SubscriptionType.oneMonth);
                        },
                      ),
                    ),
                    PaymentCard(
                      submitButton: AppOutLineButton(
                        label: 'three',
                        onTap: () {
                          onPlanTap?.call(SubscriptionType.threeMonth);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.sizeExtenstion.small),
                TextButton(
                  onPressed: Navigator.of(context).pop,
                  child: Text(context.l10n.cancle),
                ),
              ],
            ),
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
