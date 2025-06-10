import 'package:authentication_app/src/common/common.dart';
import 'package:authentication_app/src/register/cubit/register_cubit.dart';
import 'package:authentication_app/src/register/privacy_dialog.dart';
import 'package:authentication_app/src/register/register_listener.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

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
    return AppScaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.sizeExtenstion.extraLarge,
          ),
          child: RegisterListener(
            goToVerificationRoute: goToVerificationRoute,
            goToLoginRoute: goToLoginRoute,
            goToHomeRoute: goToHomeRoute,
          ),
        ),
      ),
    );
  }
}
