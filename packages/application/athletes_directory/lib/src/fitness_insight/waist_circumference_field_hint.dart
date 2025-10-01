import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class WaistCircumferenceFieldHint extends StatelessWidget {
  const WaistCircumferenceFieldHint({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: context.l10n.fitnessProfileNewMeasurementDialogWaistCircumference,
      contents: [
        Text.rich(
          TextSpan(
            text: context.l10n.addMeasurementDialogHintText6,
            children: [
              TextSpan(
                text: context.l10n.addMeasurementDialogHintText6Bold,
                style: context.themeData.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(text: context.l10n.addMeasurementDialogHintText7),
            ],
          ),
        ),
        WaistCircumferenceFieldHintImage(),
        SizedBox(height: context.sizeExtenstion.medium),
        Text(context.l10n.addMeasurementDialogHintText8),
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
