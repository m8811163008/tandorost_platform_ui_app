import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({
    super.key,
    this.onChange,
    this.textDirection,
    this.autofillHints,
  });
  final ValueSetter<String>? onChange;
  final TextDirection? textDirection;
  final Iterable<String>? autofillHints;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: textDirection ?? Directionality.of(context),
      child: NumberTextField(
        label: context.l10n.phoneNumberTextFieldLabel,
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
        autofillHints: autofillHints,
      ),
    );
  }
}
