import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class TimeRestrictedSetting extends StatelessWidget {
  const TimeRestrictedSetting({super.key, required this.value, this.onChanged});
  final bool value;
  final ValueSetter<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.l10n.timeRestrictedEatingLabel, style: context.textTheme.titleMedium),
        Switch(value: value, onChanged: onChanged),
      ],
    );
  }
}
