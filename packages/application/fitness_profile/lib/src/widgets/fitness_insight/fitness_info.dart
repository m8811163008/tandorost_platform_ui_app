import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class FitnessInfo extends StatelessWidget {
  const FitnessInfo({super.key, required this.fitnessData});
  final FitnessData fitnessData;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppCardHeader(title: 'Your Physical data'),
          _buildFitnessData(
            context,
            'Resting Metabolic Rate',
            fitnessData.restingMetabolicRate.toStringAsFixed(0),
          ),
          _buildFitnessData(
            context,
            'Total Daily Energy Expenditure',
            fitnessData.totalDailyEnergyExpenditure.toStringAsFixed(0),
          ),
          _buildFitnessData(context, 'BMI', fitnessData.bmi.toStringAsFixed(2)),
          _buildFitnessData(
            context,
            'BMI Prime',
            fitnessData.bmiPrime.toStringAsFixed(2),
          ),
          _buildFitnessData(
            context,
            'BMI Level',
            fitnessData.bmiLevel.toString(),
          ),
          _buildFitnessData(
            context,
            'Waist Circumference/Height Ratio',
            fitnessData.waistCircumferenceToHeightRatio?.toStringAsFixed(2) ??
                'N/A',
          ),
          _buildFitnessData(
            context,
            'Is Waist Circumference/Height Ratio Safe',
            fitnessData.isWaistCircumferenceToHeightRatioSafe == null
                ? 'N/A'
                : (fitnessData.isWaistCircumferenceToHeightRatioSafe!
                    ? 'Yes'
                    : 'No'),
          ),
          _buildFitnessData(
            context,
            'Is Waist Circumference Safe Range',
            fitnessData.isWaistCircumferenceSafeRange == null
                ? 'N/A'
                : (fitnessData.isWaistCircumferenceSafeRange! ? 'Yes' : 'No'),
          ),
          // TODO add is weight lose is safe?
        ],
      ),
    );
  }

  Widget _buildFitnessData(BuildContext context, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(width: context.sizeExtenstion.small),
        Text(value),
      ],
    );
  }
}
