import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class VerifyForm extends StatefulWidget {
  const VerifyForm({
    super.key,
    this.submitLabel = '',
    this.onSubmitPressed,
    this.onChangeCode,
  });
  final String submitLabel;
  final VoidCallback? onSubmitPressed;
  final ValueSetter<String>? onChangeCode;

  @override
  State<VerifyForm> createState() => _VerifyFormState();
}

class _VerifyFormState extends State<VerifyForm> {
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Verify number', style: context.textTheme.headlineLarge),
          SizedBox(height: context.sizeExtenstion.medium),

          NumberTextField(
            label: 'verificationCode',
            hintText: '- - - -',
            maxLength: 4,
            obscureText: true,
            onChange: widget.onChangeCode,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.l10n.emptyFormFieldValidationError;
              } else if (value.length < 4) {
                return context.l10n.minLengthFormFieldValidationError(4);
              }
              return null;
            },
          ),
          SizedBox(height: context.sizeExtenstion.large),
          OutlinedButton(
            onPressed: () {
              if (_key.currentState!.validate()) {
                widget.onSubmitPressed?.call();
              }
            },
            child: Text(widget.submitLabel),
          ),
        ],
      ),
    );
  }
}
