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
            color: context.themeData.colorScheme.secondary,
          ),
          child: Padding(
            padding: EdgeInsets.all(context.sizeExtenstion.medium),
            child: Column(
              children: [
                Text(
                  context.l10n.paymentDialogTitle,
                  style: context.textTheme.headlineMedium!.copyWith(
                    color: context.themeData.colorScheme.onPrimary,
                  ),
                ),
                SizedBox(height: context.sizeExtenstion.medium),
                Wrap(
                  spacing: context.sizeExtenstion.medium,
                  runSpacing: context.sizeExtenstion.medium,
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
                      titleColor: Colors.amber,
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
                      titleColor: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(height: context.sizeExtenstion.small),
                Padding(
                  padding: EdgeInsets.all(context.sizeExtenstion.medium),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: Navigator.of(context).pop,
                      child: Text(
                        context.l10n.cancle,
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: context.themeData.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
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
    required this.titleColor,
  });
  final Widget? submitButton;
  final String title, limit;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Padding(
        padding: EdgeInsets.only(bottom: context.sizeExtenstion.small),
        child: Column(
          children: [
            Text(
              title,
              style: context.textTheme.headlineSmall!.copyWith(
                color: titleColor,
                fontWeight: FontWeight.bold,
              ),
            ),
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
            if (submitButton != null)
              SizedBox(width: double.infinity, child: submitButton!),
          ],
        ),
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
