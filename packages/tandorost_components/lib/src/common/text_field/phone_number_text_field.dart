import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({super.key, this.onChange});
  final ValueSetter<String>? onChange;

  @override
  Widget build(BuildContext context) {
    return NumberTextField(
      label: 'phonenumber',
      prefix: '+98  9',
      hintText: '---------',
      maxLength: 9,
      onChange: onChange,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return context.l10n.emptyFormFieldValidationError;
        } else if (value.length < 9) {
          return context.l10n.minLengthFormFieldValidationError(9);
        }
        return null;
      },
    );
  }
}