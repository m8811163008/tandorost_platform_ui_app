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
        ...ChangeWeightSpeed.values.map(
          (e) => InkWell(
            onTap: () => onSelectionChanged?.call(e),
            child: Row(
              children: [
                Radio<ChangeWeightSpeed>(
                  value: e,
                  groupValue: selected,
                  onChanged: (val) {
                    if (val != null) onSelectionChanged?.call(val);
                  },
                ),
                GestureDetector(
                  onTap: () => onSelectionChanged?.call(e),
                  child: Text(
                    context.l10n.profileChangeWeightSpeedButtonLabel(e.name),
                    style: context.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
