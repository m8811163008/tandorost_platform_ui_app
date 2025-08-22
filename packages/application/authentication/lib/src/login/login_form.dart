import 'package:authentication_app/src/common/autentication_form_header.dart';
import 'package:authentication_app/src/common/password_text_field.dart';
import 'package:authentication_app/src/common/phone_number_text_field.dart';
import 'package:authentication_app/src/login/cubit/login_cubit.dart';
import 'package:authentication_app/src/login/login_button.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    this.goToRegisterRoute,
    this.goToForgotPasswordRoute,
    this.goToHomeRoute,
  });
  final VoidCallback? goToRegisterRoute;
  final VoidCallback? goToForgotPasswordRoute;
  final VoidCallback? goToHomeRoute;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
          AutheticationFormHeader(label: context.l10n.loginRouteLabel),
          gap,
          identifierTextField(
            onChange: context.read<LoginCubit>().onChangePhoneNumber,
            textDirection: TextDirection.ltr,
            autofillHints: [AutofillHints.newUsername, AutofillHints.username],
          ),
          gapSmall,
          PasswordTextField(
            onChange: context.read<LoginCubit>().onChangePinCode,
            textDirection: TextDirection.ltr,
            autofillHints: [AutofillHints.password],
          ),
          gapSmall,
          LoginButton(onTap: _onTapLogin),
          gap,
          Wrap(
            alignment: WrapAlignment.start,
            children: [
              TextButton(
                onPressed: widget.goToRegisterRoute?.call,
                child: Text(context.l10n.registerLabel),
              ),
              gapSmall,
              TextButton(
                onPressed: widget.goToForgotPasswordRoute?.call,
                child: Text(context.l10n.forgotPasswordLabel),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onTapLogin() {
    if (_formKey.currentState!.validate()) {
      context.read<LoginCubit>().login();
    }
  }
}
