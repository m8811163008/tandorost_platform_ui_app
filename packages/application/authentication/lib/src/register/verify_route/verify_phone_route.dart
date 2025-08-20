import 'package:authentication_app/src/common/common.dart';
import 'package:authentication_app/src/register/verify_route/verify_phone_listener.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class RegisterVerifyPhoneNumberRoute extends StatelessWidget {
  const RegisterVerifyPhoneNumberRoute({super.key, this.goToLoginRoute});

  final VoidCallback? goToLoginRoute;

  @override
  Widget build(BuildContext context) {
    return AuthenticationScaffold(
      title: context.l10n.appRoutesName(RoutesNames.verificationRoute.name),
      child: VerifyPhoneListener(goToLoginRoute: goToLoginRoute),
    );
  }
}
