import 'package:authentication_app/src/common/common.dart';
import 'package:authentication_app/src/register/cubit/register_cubit.dart';
import 'package:authentication_app/src/register/register_route/privacy_dialog.dart';
import 'package:authentication_app/src/register/register_route/register_button.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key, this.goToLoginRoute, this.goToHomeRoute});
  final VoidCallback? goToLoginRoute;

  final VoidCallback? goToHomeRoute;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
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
          AutheticationFormHeader(label: context.l10n.registerLabel),
          gap,
          PhoneNumberTextField(
            onChange: (value) {
              context.read<RegisterCubit>().onChangePhoneNumber('09$value');
            },
            textDirection: TextDirection.ltr,
          ),
          gapSmall,
          PasswordTextField(
            onChange: context.read<RegisterCubit>().onChangePinCode,
            textDirection: TextDirection.ltr,
          ),
          gapSmall,
          RegisterButton(onTap: _onTapRegister),
          gap,
          Wrap(
            children: [
              TextButton(
                onPressed: widget.goToLoginRoute,
                child: Text(context.l10n.textButtonLabelLogin),
              ),
              TextButton(
                onPressed: _onPrivacyTap,
                child: Text(context.l10n.privacyDialogTitle),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onPrivacyTap() async {
    await showDialog(
      context: context,
      builder: (context) {
        return PrivacyDialog();
      },
    );
  }

  void _onTapRegister() {
    if (_formKey.currentState!.validate()) {
      context.read<RegisterCubit>().sendVerificationCode();
    }
  }
}
