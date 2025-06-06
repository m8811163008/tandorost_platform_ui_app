import 'package:fitness_profile_app/src/widgets/fitness_insight/package_name.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class AddMesurementDialogHint extends StatelessWidget {
  const AddMesurementDialogHint({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: context.l10n.addMeasurementDialogHintTitle,
      contents: [
        Text(context.l10n.addMeasurementDialogHintText1),
        Text(context.l10n.addMeasurementDialogHintText2),
        Text(context.l10n.addMeasurementDialogHintText3),
    
        SizedBox(height: context.sizeExtenstion.medium),
        const AddMesurementDialogHintImage(),
        SizedBox(height: context.sizeExtenstion.medium),
        Text(context.l10n.addMeasurementDialogHintText4),
        Text(context.l10n.addMeasurementDialogHintText5),
    
        const Divider(),
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
        SizedBox(height: context.sizeExtenstion.medium),
        Text(context.l10n.addMeasurementDialogHintText8),
      ],
    );
  }
}

class AddMesurementDialogHintImage extends StatelessWidget {
  const AddMesurementDialogHintImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/body_composition_sites.png',
      package: packageName,
    );
  }
}
