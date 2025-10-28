import 'package:authentication_app/src/common/autentication_form_header.dart';
import 'package:authentication_app/src/common/password_text_field.dart';
import 'package:authentication_app/src/common/phone_number_text_field.dart';
import 'package:authentication_app/src/login/cubit/login_cubit.dart';
import 'package:authentication_app/src/login/login_button.dart';
import 'package:domain_model/domain_model.dart';
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
          IdentifierTextField(
            onChange: context.read<LoginCubit>().onChangePhoneNumber,
            textDirection: TextDirection.ltr,
            autofillHints: [AutofillHints.newUsername, AutofillHints.username],
            initialValue: context
                .select<LoginCubit, Credential?>(
                  (cubit) => cubit.state.cachedCredential,
                )
                ?.username,
          ),
          gapSmall,
          PasswordTextField(
            onChange: context.read<LoginCubit>().onChangePinCode,
            textDirection: TextDirection.ltr,
            autofillHints: [AutofillHints.password],
            initialValue: context
                .select<LoginCubit, Credential?>(
                  (cubit) => cubit.state.cachedCredential,
                )
                ?.password,
            // initialValue: context
            //     .select<LoginCubit, Credential?>(
            //       (cubit) => cubit.state.cachedCredential,
            //     )
            //     ?.password,
          ),
          gapSmall,
          LoginButton(onTap: _onTapLogin),
          gapSmall,
          GoogleSignInButton(
            onPressed: context.read<LoginCubit>().signInWithGoogle,
            text: context.l10n.googleSignInButtonText,
          ),
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

class GoogleSignInButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const GoogleSignInButton({
    super.key,
    required this.onPressed,
    this.text = '',
  });

  @override
  Widget build(BuildContext context) {
    // GIS Button Styles
    const Color buttonColor = Colors.white;
    const Color borderColor = Color(0xFF747775);
    const Color textColor = Color(0xFF1F1F1F);
    const double buttonHeight = 40.0;

    // Use OutlinedButton for built-in border, focus, and disabled states.
    // This is the standard Flutter way to handle bordered buttons.
    return OutlinedButton.icon(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        fixedSize: const Size.fromHeight(buttonHeight),

        // Minimal elevation for the Material Design look
        elevation: 1,
      ),
      label: Text(text),
      icon: Icon(FontAwesomeIcons.google, size: 20.0),
    );
  }
}
