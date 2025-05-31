import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    this.initalValue,
    this.errorMessage,
    this.suffix,
    this.textDirection,
    this.autofillHints,
  });
  final String label;
  final String? prefix;
  final String? hintText;
  final int? maxLength;
  final ValueSetter<String>? onChange;
  final String? Function(String?)? validator;
  final bool obscureText;
  final String? initalValue;
  final String? errorMessage;
  final Widget? suffix;
  final TextDirection? textDirection;
  final Iterable<String>? autofillHints;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: autofillHints,
      controller: TextEditingController(text: initalValue),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        labelText: label,
        prefixText: prefix,
        hintText: hintText,
        errorText: errorMessage,
        suffix: suffix,
      ),
      obscureText: obscureText,
      maxLength: maxLength,
      onChanged: onChange,
      validator: validator,
      textDirection: textDirection,
    );
  }
}
