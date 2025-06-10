import 'package:authentication_app/src/common/common.dart';
import 'package:authentication_app/src/register/register_route/register_listener.dart';
import 'package:flutter/material.dart';

class RegisterRoute extends StatelessWidget {
  const RegisterRoute({
    super.key,
    this.goToLoginRoute,
    this.goToVerificationRoute,
    this.goToHomeRoute,
  });

  final VoidCallback? goToLoginRoute;
  final VoidCallback? goToVerificationRoute;
  final VoidCallback? goToHomeRoute;

  @override
  Widget build(BuildContext context) {
    return AuthenticationScaffold(
      child: RegisterListener(
        goToVerificationRoute: goToVerificationRoute,
        goToLoginRoute: goToLoginRoute,
        goToHomeRoute: goToHomeRoute,
      ),
    );
  }
}
