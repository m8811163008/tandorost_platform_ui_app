import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class SettingRadioButton extends StatelessWidget {
  const SettingRadioButton({super.key,this.label = '', required this.value, this.onChanged});
  final bool value;
  final ValueSetter<bool>? onChanged;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.titleMedium,
        ),
        Switch(value: value, onChanged: onChanged),
      ],
    );
  }
}
