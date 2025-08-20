import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class UserFoodRequirementRow extends StatelessWidget {
  const UserFoodRequirementRow({
    super.key,
    required this.currentValue,
    this.macroNutritionLabel = '',
    this.unitOfmeasurement = '',
    this.total,
    this.color,
  });
  final int? total;
  final int currentValue;
  final String macroNutritionLabel;
  final String unitOfmeasurement;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final value = total == null ? 0.0 : currentValue / total!;
    final progressValue = value > 1.0 ? 1.0 : value;
    final isExceed = value > 1.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.end,
          children: [
            Material(
              shape: CircleBorder(),
              color: color,
              child: SizedBox.fromSize(size: context.sizeExtenstion.appButton),
            ),
            SizedBox(width: context.sizeExtenstion.small),
            Text(
              '$macroNutritionLabel $currentValue ${context.l10n.foodReportUserFoodRequirementFrom} ${total ?? context.l10n.foodReportUserFoodRequirementNA} $unitOfmeasurement',
            ),
            SizedBox(width: context.sizeExtenstion.small),
            if (isExceed)
              Icon(
                Icons.warning_amber_rounded,
                color: context.themeData.colorScheme.error,
                size: context.sizeExtenstion.extraLarge,
              ),
          ],
        ),
        SizedBox(height: context.sizeExtenstion.small),
        LinearProgressIndicator(value: progressValue, color: color),
      ],
    );
  }
}
