import 'package:authentication_app/authentication.dart';
import 'package:authentication_app/src/common/common.dart';
import 'package:authentication_app/src/login/login_listeners.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class LoginRoute extends StatelessWidget {
  const LoginRoute({
    super.key,
    this.goToRegisterRoute,
    this.goToForgotPasswordRoute,
    this.goToHomeRoute,
  });

  final VoidCallback? goToRegisterRoute;
  final VoidCallback? goToForgotPasswordRoute;
  final VoidCallback? goToHomeRoute;

  @override
  Widget build(BuildContext context) {
    return AuthenticationScaffold(
      title: context.l10n.appRoutesName(RoutesNames.loginRoute.name),
      child: LoginListener(
        goToRegisterRoute: goToRegisterRoute,
        goToForgotPasswordRoute: goToForgotPasswordRoute,
        goToHomeRoute: goToHomeRoute,
      ),
    );
  }
}

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
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.l10n.loginRouteLabel,
            style: context.textTheme.headlineLarge,
          ),
          SizedBox(height: context.sizeExtenstion.extraLarge),
          IdentifierTextField(
            onChange: context.read<LoginCubit>().onChangePhoneNumber,
            textDirection: TextDirection.ltr,
            autofillHints: [AutofillHints.newUsername, AutofillHints.username],
          ),
          SizedBox(height: context.sizeExtenstion.small),
          PasswordTextField(
            onChange: context.read<LoginCubit>().onChangePinCode,
            textDirection: TextDirection.ltr,
            autofillHints: [AutofillHints.password],
          ),

          SizedBox(height: context.sizeExtenstion.large),
          BlocBuilder<LoginCubit, LoginState>(
            buildWhen: (previous, current) =>
                previous.loginStatus != current.loginStatus,
            builder: (context, state) {
              return state.loginStatus.isLoading
                  ? AppOutLineButton.loading(
                      label: context.l10n.textButtonLabelLogin,
                    )
                  : AppOutLineButton(
                      label: context.l10n.textButtonLabelLogin,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<LoginCubit>().login();
                        }
                      },
                    );
            },
          ),
          SizedBox(height: context.sizeExtenstion.large),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: widget.goToRegisterRoute?.call,
                child: Text(context.l10n.registerLabel),
              ),
              SizedBox(width: context.sizeExtenstion.small),
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
}
