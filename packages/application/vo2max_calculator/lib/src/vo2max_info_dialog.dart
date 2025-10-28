import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';
import 'package:vo2max_calculator/src/fuel_mixture.dart';

class Vo2maxInfoDialog extends StatelessWidget {
  const Vo2maxInfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: context.l10n.changeWeightSpeedLabel,
      contents: [
        ...List.generate(
          6,
          (index) => Text(
            _buildVo2maxText(context, index + 1),
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(height: context.sizeExtenstion.medium),
        SizedBox(
          width: double.infinity,
          child: Center(child: FuelMixtureImage()),
        ),
        SizedBox(height: context.sizeExtenstion.medium),
        ...List.generate(
          4,
          (index) => Text(
            _buildVo2maxText(context, index + 1 + 6),
            textAlign: TextAlign.justify,
          ),
        ),
        Divider(),
      ],
    );
  }

  String _buildVo2maxText(BuildContext context, int index) => switch (index) {
    1 => context.l10n.vo2maxCalculatorText1,
    2 => context.l10n.vo2maxCalculatorText2,
    3 => context.l10n.vo2maxCalculatorText3,
    4 => context.l10n.vo2maxCalculatorText4,
    5 => context.l10n.vo2maxCalculatorText5,
    6 => context.l10n.vo2maxCalculatorText6,
    7 => context.l10n.vo2maxCalculatorText7,
    8 => context.l10n.vo2maxCalculatorText9,
    9 => context.l10n.vo2maxCalculatorText10,
    10 => context.l10n.vo2maxCalculatorText11,
    11 => context.l10n.vo2maxCalculatorText12,
    12 => context.l10n.vo2maxCalculatorText13,
    13 => context.l10n.vo2maxCalculatorText14,
    _ => context.l10n.notTranslated,
  };
}
