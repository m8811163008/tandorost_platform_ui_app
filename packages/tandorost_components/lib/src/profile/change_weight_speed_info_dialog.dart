import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class ChangeWeightSpeedInfoDialog extends StatelessWidget {
  const ChangeWeightSpeedInfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: EdgeInsets.fromLTRB(
        context.sizeExtenstion.medium,
        12.0,
        context.sizeExtenstion.medium,
        context.sizeExtenstion.medium,
      ),
      title: Text(
        context.l10n.changeWeightSpeedLabel,
        style: context.textTheme.headlineMedium,
      ),
      children: [
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
