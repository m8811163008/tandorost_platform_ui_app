import 'package:authentication_app/src/common/authentication_scaffold.dart';
import 'package:authentication_app/src/forgot_password/verify_route/forgot_password_verify_form_listener.dart';

import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class ForgotPasswordVerifyPhoneNumberRoute extends StatelessWidget {
  const ForgotPasswordVerifyPhoneNumberRoute({super.key, this.goToLoginRoute});
  final VoidCallback? goToLoginRoute;

  @override
  Widget build(BuildContext context) {
    return AuthenticationScaffold(
      child: ForgotPasswordVerifyListener(goToLoginRoute: goToLoginRoute),
    );
  }
}
