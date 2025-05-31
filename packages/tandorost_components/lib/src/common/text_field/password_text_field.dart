import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
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
        textDirection: TextDirection.ltr,
        autofillHints: autofillHints,
      ),
    );
  }
}
