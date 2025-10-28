import 'package:athletes_directory/athletes_directory.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class Referrals extends StatelessWidget {
  const Referrals({super.key});

  @override
  Widget build(BuildContext context) {
    // ⚠️ Note: You must ensure ProfileState includes:
    // 1. List<Referral> referrals
    // 2. ReadStatus readReferralStatus (or similar status enum)

    return BlocConsumer<AthelteDirectoryCubit, AthelteDirectoryState>(
      // Only rebuild or listen when the status changes
      listenWhen: (previous, current) =>
          previous.onReadReferralByInviterIdStatus !=
          current.onReadReferralByInviterIdStatus,
      listener: (context, state) {
        if (state.onInviteTraineeStatus.isConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.onInviteTraineeStatus.isInternetConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        }
      },
      // Rebuild the UI when the status or the list of referrals changes
      buildWhen: (previous, current) =>
          previous.onReadReferralByInviterIdStatus !=
          current.onReadReferralByInviterIdStatus,
      builder: (context, state) {
        // Show loading indicator
        if (state.onReadReferralByInviterIdStatus.isLoading) {
          return AppDialog(
            title: context.l10n.profileRouteReferralsDialogTitle,
            contents: const [CircularProgressIndicator()],
          );
        }

        // Show the list of referrals
        return AppDialog(
          title: context.l10n.profileRouteReferralsDialogTitle,
          contents: state.referralByInviterId.isEmpty
              ? [
                  Padding(
                    padding: EdgeInsets.all(context.sizeExtenstion.medium),
                    child: Text(context.l10n.noReferralsFound),
                  ),
                ]
              : state.referralByInviterId
                    .map(
                      (referral) => Padding(
                        padding: EdgeInsets.only(
                          bottom: context.sizeExtenstion.medium,
                        ),
                        // Use the new ReferralTile widget
                        child: ReferralTile(referral: referral),
                      ),
                    )
                    .toList(),
        );
      },
    );
  }
}

class ReferralTile extends StatelessWidget {
  const ReferralTile({super.key, required this.referral});
  final Referral referral;
  Color _getStatusColor(ReferralStatus? status) {
    return switch (status) {
      ReferralStatus.claimed => Colors.green,
      ReferralStatus.pending => Colors.orange,
      ReferralStatus.expired => Colors.red,
      _ => Colors.grey, // Default for null or unhandled status
    };
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(referral.status);
    return ListTile(
      // The contact (email/phone) of the invited person
      title: Text(
        '${context.l10n.referralTileInvitedContact}: ${referral.invitedContact}',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      // Display the status and the benefit/code
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display the Referral Status
          Text(
            '${context.l10n.referralTileStatus}: ${context.l10n.referralStatus(referral.status!.name)}',
          ),

          // Display the Referral Code/Value
          Text(
            '${context.l10n.referralTileUpdatedDate}: ${referral.updatedAt.formattedDate(context)}',
          ),
        ],
      ),
      // Optional: Add a visual indicator for the status on the trailing side
      trailing: Icon(
        Icons.circle,
        color: statusColor,
        size: context.sizeExtenstion.small,
      ),
    );
  }
}
