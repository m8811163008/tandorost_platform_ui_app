import 'package:authentication_app/src/register/verify_route/verify_phone_listener.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class RegisterVerifyPhoneNumberRoute extends StatelessWidget {
  const RegisterVerifyPhoneNumberRoute({super.key, this.goToLoginRoute});

  final VoidCallback? goToLoginRoute;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.sizeExtenstion.extraLarge,
        ),
        child: VerifyPhoneListener(goToLoginRoute: goToLoginRoute),
      ),
    );
  }
}