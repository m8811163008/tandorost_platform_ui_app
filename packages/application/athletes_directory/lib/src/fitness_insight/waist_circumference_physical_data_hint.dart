import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class WaistCircumferencePhysicalDataHint extends StatelessWidget {
  const WaistCircumferencePhysicalDataHint({
    super.key,
    required this.fitnessData,
  });
  final FitnessData fitnessData;

  @override
  Widget build(BuildContext context) {
    final bmiLevelDescription = context.l10n.fitnessProfileBmiStatus(
      fitnessData.bmiLevel.name,
    );
    final waistCircumferenceToHeightRatioDescription =
        fitnessData.waistCircumferenceToHeightRatio == null
        ? context
              .l10n
              .fitnessProfileWaistCircumferenceToHeightRatioNotAvailableDescription
        : context.l10n
              .fitnessProfileWaistCircumferenceToHeightRatioAvailableDescription(
                fitnessData.waistCircumferenceToHeightRatio!,
              );
    final waistCircumferenceSafeRangeDescription =
        fitnessData.isWaistCircumferenceSafeRange == null
        ? context
              .l10n
              .fitnessProfileWaistCircumferenceSafeRangeNotAvailableDescription
        : context.l10n.fitnessProfileIsWaistCircumferenceSafeRangeDescription(
            fitnessData.isWaistCircumferenceSafeRange!.toString(),
          );

    return AppDialog(
      title: context.l10n.fitnessProfileWaistCircumferencePhysicalDataHintLabel,
      contents: [
        Text(
          context.l10n.fitnessProfileBmiDescription(
            fitnessData.bmi,
            bmiLevelDescription,
          ),
        ),
        SizedBox(height: context.sizeExtenstion.medium),
        Text(
          context.l10n.fitnessProfileWaistCircumferenceToHeightRatioDescription,
        ),
        SizedBox(height: context.sizeExtenstion.medium),
        Text(waistCircumferenceToHeightRatioDescription),
        SizedBox(height: context.sizeExtenstion.medium),
        Text(context.l10n.fitnessProfileBmiWaistCircumferenceHealthDescription),
        SizedBox(height: context.sizeExtenstion.medium),
        Text(context.l10n.fitnessProfileWaistCircumferenceSafeRangeDescription),
        SizedBox(height: context.sizeExtenstion.medium),
        Text(waistCircumferenceSafeRangeDescription),
      ],
    );
  }
}

class WaistCircumferenceFieldHintImage extends StatelessWidget {
  const WaistCircumferenceFieldHintImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/waist_circumference.png',
      package: 'athletes_directory',
    );
  }
}
