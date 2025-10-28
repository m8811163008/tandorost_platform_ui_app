import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tandorost_components/src/utility/build_context_l10n_extension.dart';

class NumberTextField extends StatelessWidget {
  const NumberTextField({
    super.key,
    required this.label,
    this.prefix,
    this.hintText,
    this.maxLength,
    this.onChange,
    this.validator,
    this.obscureText = false,
    this.initialValue,
    this.errorMessage,
    this.suffix,
    this.textDirection,
    this.autofillHints,
    this.keyboardType = TextInputType.number,
    this.inputFormatters,
    this.controller,
  });
  final String label;
  final String? prefix;
  final String? hintText;
  final int? maxLength;
  final ValueSetter<String>? onChange;
  final String? Function(String?)? validator;
  final bool obscureText;
  final String? initialValue;
  final String? errorMessage;
  final Widget? suffix;
  final TextDirection? textDirection;
  final Iterable<String>? autofillHints;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: autofillHints,
      controller: controller ?? TextEditingController(text: initialValue),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      inputFormatters:
          inputFormatters ?? [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        labelText: label,
        prefixText: prefix,
        hintText: hintText,
        errorText: errorMessage,
        suffix: suffix,
      ),
      obscureText: obscureText,
      maxLength: maxLength,
      maxLines: obscureText ? 1 : null,
      onChanged: onChange,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return context.l10n.emptyFormFieldValidationError;
            }
            return null;
          },
      textDirection: textDirection,
    );
  }
}
