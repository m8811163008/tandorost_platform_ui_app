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
      children: [
        Text('data', style: context.textTheme.titleMedium),
        SegmentedButton<ChangeWeightSpeed>(
          segments: const <ButtonSegment<ChangeWeightSpeed>>[
            ButtonSegment<ChangeWeightSpeed>(
              value: ChangeWeightSpeed.constant,
              label: Text('XS'),
            ),
            ButtonSegment<ChangeWeightSpeed>(
              value: ChangeWeightSpeed.fastAndHard,
              label: Text('S'),
            ),
            ButtonSegment<ChangeWeightSpeed>(
              value: ChangeWeightSpeed.medium,
              label: Text('M'),
            ),
            ButtonSegment<ChangeWeightSpeed>(
              value: ChangeWeightSpeed.slowAndEasy,
              label: Text('M'),
            ),
          ],
          selected: {ChangeWeightSpeed.constant},
          onSelectionChanged: (Set<ChangeWeightSpeed> newSelection) {},
        ),
      ],
    );
  }
}
