import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class AppLineChartInputChips extends StatelessWidget {
  const AppLineChartInputChips({
    super.key,
    this.chartTypes = const {},
    this.selectedChartType,
    this.onSelected,
  });
  final Set<ChartType> chartTypes;
  final ChartType? selectedChartType;
  final ValueSetter<ChartType>? onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: context.sizeExtenstion.small,
      children:
          chartTypes
              .map(
                (chartType) => InputChip(
                  label: Text(
                    context.l10n.profileChartTypeLabel(chartType.name),
                  ),
                  onSelected: (value) {
                    if (value) {
                      onSelected?.call(chartType);
                    }
                  },
                  selected: selectedChartType == chartType,
                ),
              )
              .toList(),
    );
  }
}
