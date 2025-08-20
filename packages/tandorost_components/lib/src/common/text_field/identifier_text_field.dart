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
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: context.l10n.identifierTextFieldLabel,

      ),
      onChanged: onChange,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return context.l10n.emptyFormFieldValidationError;
        }
        final phoneRegExp = RegExp(r'^09\d{9}$');
        final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
        if (!phoneRegExp.hasMatch(value) && !emailRegExp.hasMatch(value)) {
          return context.l10n.invalidIdentifierValidationError;
        }
        return null;
      },
    ));
  }
}
