import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class IdentifierTextField extends StatelessWidget {
  const IdentifierTextField({
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
      child: TextFormField(
        autofillHints: autofillHints,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: context.l10n.identifierTextFieldLabel,
        ),
        onChanged: onChange,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return context.l10n.emptyFormFieldValidationError;
          } else {
            final phonenumberEmailRegex = RegExp(
              r'(^09\d{9}$)|(^[^@]+@[^@]+\.[^@]+$)',
            );
            if (!phonenumberEmailRegex.hasMatch(value)) {
              return context.l10n.identifierTextFieldValidationError;
            }
          }
          return null;
        },
        textDirection: textDirection ?? Directionality.of(context),
      ),
    );
  }
}
