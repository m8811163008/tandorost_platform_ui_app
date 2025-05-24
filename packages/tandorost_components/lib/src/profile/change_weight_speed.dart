import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class ChangeWeightSpeedSetting extends StatelessWidget {
  const ChangeWeightSpeedSetting({
    super.key,
    required this.selected,
    this.onSelectionChanged,
  });
  final ChangeWeightSpeed selected;
  final ValueSetter<ChangeWeightSpeed>? onSelectionChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.l10n.changeWeightSpeedLabel,
              style: context.textTheme.titleMedium,
            ),
            IconButton.outlined(
              icon: Icon(Icons.info),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return ChangeWeightSpeedInfoDialog();
                  },
                );
              },
            ),
          ],
        ),
        SizedBox(height: context.sizeExtenstion.small),
        SegmentedButton<ChangeWeightSpeed>(
          segments:
              ChangeWeightSpeed.values
                  .map(
                    (e) => ButtonSegment<ChangeWeightSpeed>(
                      value: e,
                      label: Text(
                        context.l10n.profileChangeWeightSpeedButtonLabel(
                          e.name,
                        ),
                      ),
                    ),
                  )
                  .toList(),
          selected: {selected},
          onSelectionChanged: (Set<ChangeWeightSpeed> newSelection) {
            onSelectionChanged?.call(newSelection.first);
          },
          multiSelectionEnabled: false,
        ),
      ],
    );
  }
}
