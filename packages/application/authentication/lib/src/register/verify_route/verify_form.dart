import 'package:authentication_app/src/common/common.dart';
import 'package:authentication_app/src/register/cubit/register_cubit.dart';
import 'package:authentication_app/src/register/verify_route/verify_route_button.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class VerifyFormRegister extends StatefulWidget {
  const VerifyFormRegister({super.key});

  @override
  State<VerifyFormRegister> createState() => _VerifyFormRegisterState();
}

class _VerifyFormRegisterState extends State<VerifyFormRegister> {
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
            onChanged: context.read<RegisterCubit>().onChangeVerificationCode,
            textDirection: TextDirection.ltr,
          ),
          gapSmall,
          VerifyPhoneButton(onTap: _onTapVerify),
        ],
      ),
    );
  }

  void _onTapVerify() {
    if (_key.currentState!.validate()) {
      context.read<RegisterCubit>().onRegister();
    }
  }
}
