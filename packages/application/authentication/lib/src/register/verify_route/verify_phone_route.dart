import 'package:authentication_app/src/common/common.dart';
import 'package:authentication_app/src/register/verify_route/verify_phone_listener.dart';
import 'package:flutter/material.dart';

class RegisterVerifyPhoneNumberRoute extends StatelessWidget {
  const RegisterVerifyPhoneNumberRoute({super.key, this.goToLoginRoute});

  final VoidCallback? goToLoginRoute;

  @override
  Widget build(BuildContext context) {
    return AuthenticationScaffold(
      child: VerifyPhoneListener(goToLoginRoute: goToLoginRoute),
    );
  }
}
