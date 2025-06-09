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
                Text(
                  context.l10n.paymentDialogTitle,
                  style: context.textTheme.headlineMedium,
                ),
                Wrap(
                  children: [
                    PaymentCard(
                      title: context.l10n.paymentDialogThreeMonth,
                      limit: context.l10n.paymentDialogThreeMonthText5,
                      submitButton: AppOutLineButton(
                        label: context.l10n.paymentDialogSubmitButtonLabel,
                        onTap: () {
                          onPlanTap?.call(SubscriptionType.threeMonth);
                        },
                      ),
                    ),
                    PaymentCard(
                      title: context.l10n.paymentDialogOneMonth,
                      limit: context.l10n.paymentDialogOneMonthText5,
                      submitButton: AppOutLineButton(
                        label: context.l10n.paymentDialogSubmitButtonLabel,
                        onTap: () {
                          onPlanTap?.call(SubscriptionType.oneMonth);
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
  const PaymentCard({
    super.key,
    this.submitButton,
    this.title = '',
    this.limit = '',
  });
  final Widget? submitButton;
  final String title, limit;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        children: [
          Text(title, style: context.textTheme.headlineSmall),
          Divider(),
          Text(
            context.l10n.paymentDialogText1,
            style: context.textTheme.titleMedium,
          ),
          SizedBox(height: context.sizeExtenstion.small),
          Text(context.l10n.paymentDialogText2),
          SizedBox(height: context.sizeExtenstion.small),
          PaymentCardRow(text: limit),
          PaymentCardRow(text: context.l10n.paymentDialogText6),
          PaymentCardRow(text: context.l10n.paymentDialogText7),
          PaymentCardRow(text: context.l10n.paymentDialogText3),
          PaymentCardRow(text: context.l10n.paymentDialogText4),
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
        Text(text),
      ],
    );
  }
}
