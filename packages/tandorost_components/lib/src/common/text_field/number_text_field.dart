import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

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
  });
  final String label;
  final String? prefix;
  final String? hintText;
  final int? maxLength;
  final ValueSetter<String>? onChange;
  final String? Function(String?)? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          labelText: label,
          prefixText: prefix,
          hintText: hintText,
        ),
        obscureText: obscureText,
        textDirection: TextDirection.ltr,
        maxLength: maxLength,
        textAlign: TextAlign.left,
        onChanged: onChange,

        validator: validator,
      ),
    );
  }
}
