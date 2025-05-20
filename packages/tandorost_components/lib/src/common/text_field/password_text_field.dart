import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key, this.onChange});
  final ValueSetter<String>? onChange;

  @override
  Widget build(BuildContext context) {
    return NumberTextField(
      label: context.l10n.passwordTextFieldLabel,
      hintText: '1234',
      maxLength: 4,
      obscureText: true,
      onChange: onChange,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return context.l10n.emptyFormFieldValidationError;
        } else if (value.length < 4) {
          return context.l10n.minLengthFormFieldValidationError(4);
        }
        return null;
      },
    );
  }
}
