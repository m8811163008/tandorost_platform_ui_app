import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class IsFastingSetting extends StatelessWidget {
  const IsFastingSetting({super.key, required this.value, this.onChanged});
  final bool value;
  final ValueSetter<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('data', style: context.textTheme.titleMedium),
        Switch(value: value, onChanged: onChanged),
      ],
    );
  }
}
