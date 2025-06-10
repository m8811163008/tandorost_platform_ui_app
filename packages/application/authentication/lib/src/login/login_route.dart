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
