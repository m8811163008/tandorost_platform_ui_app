import 'package:domain_model/domain_model.dart';
import 'package:fitness_profile_app/src/widgets/fitness_insight/add_measurement_dialog.dart';
import 'package:fitness_profile_app/src/widgets/fitness_insight/waist_circumference_physical_data_hint.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class FitnessInfo extends StatelessWidget {
  const FitnessInfo({super.key, required this.fitnessData});
  final FitnessData fitnessData;

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(height: context.sizeExtenstion.small);
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              AppCardHeader(
                title: context.l10n.fitnessProfilePhysicalDataLabel,
              ),
              HintButton(
                child: WaistCircumferencePhysicalDataHint(
                  fitnessData: fitnessData,
                ),
              ),
            ],
          ),
          _buildFitnessData(
            context,
            context.l10n.fitnessProfileRestingMetabolicRate,
            fitnessData.restingMetabolicRate.toStringAsFixed(0),
          ),
          gap,
          _buildFitnessData(
            context,
            context.l10n.fitnessProfileTotalDailyEnergyExpenditure,
            fitnessData.totalDailyEnergyExpenditure.toStringAsFixed(0),
          ),
          gap,
          _buildFitnessData(
            context,
            context.l10n.fitnessProfileBodyMassIndex,
            fitnessData.bmi.toStringAsFixed(2),
          ),
          gap,
          _buildFitnessData(
            context,
            context.l10n.fitnessProfileBodyMassIndexPrime,
            fitnessData.bmiPrime.toStringAsFixed(2),
          ),
          gap,
          _buildFitnessData(
            context,
            context.l10n.fitnessProfileBodyMassIndexLevelLabel,
            context.l10n.fitnessProfileBmiStatus(fitnessData.bmiLevel.name),
          ),
          gap,
          _buildFitnessData(
            context,
            context.l10n.fitnessProfileWaistCircumferenceToHeightRatio,
            fitnessData.waistCircumferenceToHeightRatio?.toStringAsFixed(2) ??
                context.l10n.fitnessProfileNA,
          ),
          gap,
          _buildFitnessData(
            context,
            context.l10n.fitnessProfileIsWaistCircumferenceToHeightRatioSafe,
            fitnessData.isWaistCircumferenceToHeightRatioSafe == null
                ? context.l10n.fitnessProfileNA
                : (fitnessData.isWaistCircumferenceToHeightRatioSafe!
                    ? context.l10n.fitnessProfileYes
                    : context.l10n.fitnessProfileNo),
          ),
          gap,
          _buildFitnessData(
            context,
            context.l10n.fitnessProfileIsWaistCircumferenceSafeRange,
            fitnessData.isWaistCircumferenceSafeRange == null
                ? context.l10n.fitnessProfileNA
                : (fitnessData.isWaistCircumferenceSafeRange!
                    ? context.l10n.fitnessProfileYes
                    : context.l10n.fitnessProfileNo),
          ),
          // TODO add is weight lose is safe?
        ],
      ),
    );
  }

  Widget _buildFitnessData(BuildContext context, String label, String value) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      children: [
        Text(label),
        SizedBox(width: context.sizeExtenstion.small),
        Text(':'),
        SizedBox(width: context.sizeExtenstion.small),
        Text(
          value,
          style: context.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
