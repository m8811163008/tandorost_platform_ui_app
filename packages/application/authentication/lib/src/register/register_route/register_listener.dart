import 'package:authentication_app/src/register/cubit/register_cubit.dart';
import 'package:authentication_app/src/register/register_route/register_form.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class RegisterListener extends StatelessWidget {
  const RegisterListener({
    super.key,
    this.goToVerificationRoute,
    this.goToLoginRoute,
    this.goToHomeRoute,
  });
  final VoidCallback? goToVerificationRoute;
  final VoidCallback? goToLoginRoute;
  final VoidCallback? goToHomeRoute;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen:
          (previous, current) =>
              previous.verificationStatus != current.verificationStatus,
      listener: (context, state) {
        if (state.verificationStatus.isConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.exception ?? content)));
        } else if (state.verificationStatus.isConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.verificationStatus.isSuccess) {
          goToVerificationRoute?.call();
        }
      },
      child: RegisterForm(
        goToHomeRoute: goToHomeRoute,
        goToLoginRoute: goToLoginRoute,
      ),
    );
  }
}
