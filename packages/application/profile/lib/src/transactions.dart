import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:profile_app/src/cubit/profile_cubit.dart';
import 'package:tandorost_components/tandorost_components.dart';

class Transactions extends StatelessWidget {
  const Transactions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listenWhen: (previous, current) =>
          previous.readSubscriptionStatus != current.readSubscriptionStatus,
      listener: (context, state) {
        if (state.readSubscriptionStatus.isConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.readSubscriptionStatus.isConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        }
      },
      buildWhen: (previous, current) =>
          previous.readSubscriptionStatus != current.readSubscriptionStatus,
      builder: (context, state) {
        if (state.readSubscriptionStatus.isLoading) {
          return AppDialog(
            title: context.l10n.profileRouteTansactionDialogTitle,
            contents: [CircularProgressIndicator()],
          );
        }
        return AppDialog(
          title: context.l10n.profileRouteTansactionDialogTitle,
          contents: state.subscriptions
              .map(
                (e) => Padding(
                  padding: EdgeInsets.only(
                    bottom: context.sizeExtenstion.medium,
                  ),
                  child: TransactionTile(subscriptionPayment: e),
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class TransactionTile extends StatelessWidget {
  const TransactionTile({super.key, required this.subscriptionPayment});
  final SubscriptionPayment subscriptionPayment;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '${context.l10n.profileRouteTansactionListTileID}: ${subscriptionPayment.id ?? "-"}',
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${context.l10n.profileRouteTansactionListTilePaidAmount}: ${subscriptionPayment.paidAmount} ${subscriptionPayment.currency.name}',
          ),
          Text(
            '${context.l10n.profileRouteTansactionListTilePaymentMethod}: ${subscriptionPayment.paymentMethod.name}',
          ),
          Text(
            '${context.l10n.profileRouteTansactionListTilePurchaseDate}: ${subscriptionPayment.purchaseDate.formattedDate(context)}',
          ),
          Text(
            '${context.l10n.profileRouteTansactionListTileExpireDate}: ${subscriptionPayment.expireDate.formattedDate(context)}',
          ),
          Text(
            '${context.l10n.profileRouteTansactionListTileSubscriptionType}: ${subscriptionPayment.subscriptionType.name}',
          ),
          if (subscriptionPayment.cafeBazzarOrderId != null)
            Text(
              '${context.l10n.profileRouteTansactionListTileCafeBazzarOrderID}: ${subscriptionPayment.cafeBazzarOrderId}',
            ),
          if (subscriptionPayment.updatedAt != null)
            Text(
              '${context.l10n.profileRouteTansactionListTileUpdatedAt}: ${subscriptionPayment.updatedAt?.formattedDate(context)}',
            ),
          Text(
            '${context.l10n.profileRouteTansactionListTileFoodRequestLimit}: ${subscriptionPayment.userAiRequestLimitFoods ?? "-"}',
          ),
          Text(
            '${context.l10n.profileRouteTansactionListTileNumberOfRequestedFoods}: ${subscriptionPayment.userAiRequestedFoods}',
          ),
          Text(
            '${context.l10n.profileRouteTansactionListTileActive}: ${subscriptionPayment.isActive ? context.l10n.yes : context.l10n.no}',
          ),
          if (subscriptionPayment.programId != null)
            Text(
              '${context.l10n.profileRouteTansactionListTileProgramId}: ${subscriptionPayment.programId}',
            ),
        ],
      ),
    );
  }
}
