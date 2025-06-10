import 'package:authentication_app/authentication.dart';
import 'package:authentication_app/src/common/common.dart';
import 'package:authentication_app/src/forgot_password/forgot_password_route/forgot_password_button.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class VerifyFormForgotPassword extends StatefulWidget {
  const VerifyFormForgotPassword({super.key});

  @override
  State<VerifyFormForgotPassword> createState() =>
      _VerifyFormForgotPasswordState();
}

class _VerifyFormForgotPasswordState extends State<VerifyFormForgotPassword> {
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(height: context.sizeExtenstion.medium);
    final gapSmall = SizedBox(height: context.sizeExtenstion.small);

    return Form(
      key: _key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutheticationFormHeader(
            label: context.l10n.verifyNumberTextFieldLabel,
          ),
          gap,
          VerificationCodeTextField(
            onChanged:
                context.read<ForgotPasswordCubit>().onChangeVerificationCode,
            textDirection: TextDirection.ltr,
          ),
          gapSmall,
          ForgotPasswordButton(onTap: _onVerifyTap),
        ],
      ),
    );
  }

  void _onVerifyTap() {
    if (_key.currentState!.validate()) {
      context.read<ForgotPasswordCubit>().onForgotPassword();
    }
  }
}
