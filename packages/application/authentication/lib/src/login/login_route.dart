import 'package:authentication_app/src/login/cubit/login_cubit.dart';
import 'package:authentication_app/src/login/login_listeners.dart';
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
    return AppScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.sizeExtenstion.extraLarge,
          ),
          child: LoginListener(
            goToRegisterRoute: goToRegisterRoute,
            goToForgotPasswordRoute: goToForgotPasswordRoute,
            goToHomeRoute: goToHomeRoute,
          ),
        ),
      ),
    );
  }
}






