import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class RegullarTextField extends StatelessWidget {
  const RegullarTextField({
    super.key,
    required this.label,
    this.prefix,
    this.hintText,
    this.maxLength,
    this.onChange,
    this.validator,
    this.obscureText = false,
    this.readOnly = false,
    this.initalValue,
    this.onTap,
    this.errorMessage,
  });
  final String label;
  final String? prefix;
  final String? hintText;
  final int? maxLength;
  final ValueSetter<String>? onChange;
  final String? Function(String?)? validator;
  final bool obscureText;
  final String? initalValue;
  final bool readOnly;
  final VoidCallback? onTap;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: TextEditingController(text: initalValue),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.text,
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: label,
        prefixText: prefix,
        hintText: hintText,
        errorText: errorMessage,
      ),
      obscureText: obscureText,
      maxLength: maxLength,
      textAlign: TextAlign.left,
      onChanged: onChange,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return context.l10n.emptyFormFieldValidationError;
        }
        return null;
      },
    );
  }
}
