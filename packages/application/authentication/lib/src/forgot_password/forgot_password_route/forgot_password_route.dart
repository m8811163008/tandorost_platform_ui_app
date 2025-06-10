import 'package:authentication_app/src/common/authentication_scaffold.dart';
import 'package:authentication_app/src/forgot_password/forgot_password_route/forgot_password_listener.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class ForgotPasswordRoute extends StatelessWidget {
  const ForgotPasswordRoute({
    super.key,
    this.goToLoginRoute,
    this.goToVerificationRoute,
    this.goToRegisterRoute,
  });

  final VoidCallback? goToLoginRoute;
  final VoidCallback? goToVerificationRoute;
  final VoidCallback? goToRegisterRoute;

  @override
  Widget build(BuildContext context) {
    return AuthenticationScaffold(
      title: context.l10n.appRoutesName(RoutesNames.forgotPassRoute.name),
      child: ForgotPasswordListener(
        goToLoginRoute: goToLoginRoute,
        goToVerificationRoute: goToVerificationRoute,
        goToRegisterRoute: goToRegisterRoute,
      ),
    );
  }
}
