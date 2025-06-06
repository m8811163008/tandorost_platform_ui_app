import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class VerificationCodeTextField extends StatelessWidget {
  const VerificationCodeTextField({
    super.key,
    this.onChanged,
    this.textDirection,
  });
  final ValueSetter<String>? onChanged;
  final TextDirection? textDirection;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: textDirection ?? Directionality.of(context),
      child: NumberTextField(
        label: context.l10n.verificationCodeTextFieldLabel,
        hintText: '- - - -',
        maxLength: 4,
        onChange: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return context.l10n.emptyFormFieldValidationError;
          } else if (value.length < 4) {
            return context.l10n.minLengthFormFieldValidationError(4);
          }
          return null;
        },
      ),
    );
  }
}
