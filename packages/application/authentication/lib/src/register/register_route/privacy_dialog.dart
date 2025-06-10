import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class PrivacyDialog extends StatelessWidget {
  const PrivacyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(height: context.sizeExtenstion.medium);
    return AppDialog(
      title: context.l10n.privacyDialogTitle,
      contents: [
        Text(context.l10n.privacyDialogSubtitle1),
        Text(context.l10n.privacyDialogText1),
        gap,
        Text(context.l10n.privacyDialogSubtitle2),
        Text(context.l10n.privacyDialogText2),
        gap,
        Text(context.l10n.privacyDialogSubtitle3),
        Text(context.l10n.privacyDialogText3),
        gap,
        Text(context.l10n.privacyDialogSubtitle4),
        Text(context.l10n.privacyDialogText4),
        gap,
        Text(context.l10n.privacyDialogSubtitle5),
        Text(context.l10n.privacyDialogText5),
        gap,
        Text(context.l10n.privacyDialogText6),
      ],
    );
  }
}
