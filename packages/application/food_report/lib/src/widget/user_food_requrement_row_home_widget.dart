import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class UserFoodRequirementRowHomeWidget extends StatelessWidget {
  const UserFoodRequirementRowHomeWidget({
    super.key,
    required this.currentValue,
    required this.context,
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
  final BuildContext context;

  @override
  Widget build(BuildContext _) {
    final value = total == null ? 0.0 : currentValue / total!;
    final progressValue = value > 1.0 ? 1.0 : value;
    final isExceed = value > 1.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          runAlignment: WrapAlignment.center,
          children: [
            Material(
              shape: CircleBorder(),
              color: color,
              child: SizedBox.fromSize(size: Size.square(12)),
            ),
            SizedBox(width: 4),
            Text(
              '$macroNutritionLabel $currentValue ${context.l10n.foodReportUserFoodRequirementFrom} ${total ?? context.l10n.foodReportUserFoodRequirementNA} $unitOfmeasurement',
            ),
            SizedBox(width: 4),
            if (isExceed)
              Icon(
                Icons.warning_amber_rounded,
                color: context.themeData.colorScheme.error,
                size: 16,
              ),
          ],
        ),
        SizedBox(width: 4),
        LinearProgressIndicator(value: progressValue, color: color),
      ],
    );
  }
}
