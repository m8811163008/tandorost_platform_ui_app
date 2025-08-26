import 'package:authentication_app/src/common/common.dart';
import 'package:authentication_app/src/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:authentication_app/src/forgot_password/forgot_password_route/forgot_password_button.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({
    super.key,
    this.goToRegisterRoute,
    this.goToLoginRoute,
    this.goToVerificationRoute,
  });
  final VoidCallback? goToLoginRoute;
  final VoidCallback? goToVerificationRoute;
  final VoidCallback? goToRegisterRoute;

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(height: context.sizeExtenstion.medium);
    final gapSmall = SizedBox(height: context.sizeExtenstion.small);

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutheticationFormHeader(label: context.l10n.forgotPasswordLabel),
          gap,
          IdentifierTextField(
            onChange: context.read<ForgotPasswordCubit>().onChangePhoneNumber,
            textDirection: TextDirection.ltr,
          ),
          gapSmall,
          PasswordTextField(
            onChange: context.read<ForgotPasswordCubit>().onChangePinCode,
            textDirection: TextDirection.ltr,
            isForgotPasswordField: true,
          ),
          gapSmall,
          ForgotPasswordButton(onTap: _onTapForgotPassword),
          gap,
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              TextButton(
                onPressed: widget.goToRegisterRoute,
                child: Text(context.l10n.registerLabel),
              ),
              SizedBox(width: context.sizeExtenstion.small),
              TextButton(
                onPressed: widget.goToLoginRoute,
                child: Text(context.l10n.textButtonLabelLogin),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onTapForgotPassword() {
    if (_formKey.currentState!.validate()) {
      context.read<ForgotPasswordCubit>().sendVerificationCode();
    }
  }
}
