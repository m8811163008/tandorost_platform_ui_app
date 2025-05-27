import 'package:flutter/material.dart';

class DropDownField<E> extends StatelessWidget {
  const DropDownField({
    super.key,
    this.onChange,
    this.label = '',
    this.value,
    this.items = const [],
  });
  final ValueSetter<E?>? onChange;
  final String label;
  final E? value;
  final List<DropdownMenuItem<E>> items;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        label: Text(label),
        border: const OutlineInputBorder(),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<E>(
          isExpanded: true,
          value: value,
          items: items,
          onChanged: onChange,
        ),
      ),
    );
  }
}
