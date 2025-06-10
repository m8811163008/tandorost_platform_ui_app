import 'package:authentication_app/authentication.dart';
import 'package:authentication_app/src/login/login_form.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class LoginListener extends StatelessWidget {
  const LoginListener({
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
    return BlocListener<LoginCubit, LoginState>(
      listenWhen:
          (previous, current) => previous.loginStatus != current.loginStatus,
      listener: (context, state) {
        if (state.loginStatus.isConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.exception ?? content)));
        } else if (state.loginStatus.isConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.loginStatus.isSuccess) {
          goToHomeRoute?.call();
        }
      },
      child: LoginForm(
        goToRegisterRoute: goToRegisterRoute,
        goToForgotPasswordRoute: goToForgotPasswordRoute,
        goToHomeRoute: goToHomeRoute,
      ),
    );
  }
}