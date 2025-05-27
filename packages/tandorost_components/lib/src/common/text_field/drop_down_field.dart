import 'package:flutter/material.dart';
import 'package:tandorost_theme/tandorost_theme.dart';

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
        contentPadding: EdgeInsets.symmetric(
          vertical: 0,
          horizontal: context.sizeExtenstion.small,
        ),
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
