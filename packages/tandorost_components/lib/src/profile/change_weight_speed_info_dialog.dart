import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class ChangeWeightSpeedInfoDialog extends StatelessWidget {
  const ChangeWeightSpeedInfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: context.l10n.changeWeightSpeedLabel,
      contents: [
        Text(context.l10n.changeWeightSpeedInfoHint),
        SizedBox(height: context.sizeExtenstion.small),
        Text(context.l10n.changeWeightSpeedInfoConstantSpeed),
        SizedBox(height: context.sizeExtenstion.small),
        Text(context.l10n.changeWeightSpeedInfoSlowAndEasySpeed),
        SizedBox(height: context.sizeExtenstion.small),
        Text(context.l10n.changeWeightSpeedInfoMediumSpeed),
        SizedBox(height: context.sizeExtenstion.small),
        Text(context.l10n.changeWeightSpeedInfoFastSpeed),
        SizedBox(height: context.sizeExtenstion.small),
        Text(context.l10n.changeWeightSpeedInfoFastAndHardSpeed),
        SizedBox(height: context.sizeExtenstion.small),
        Text(context.l10n.changeWeightSpeedInfoFastAndHardSpeedCaution),
      ],
    );
  }
}
