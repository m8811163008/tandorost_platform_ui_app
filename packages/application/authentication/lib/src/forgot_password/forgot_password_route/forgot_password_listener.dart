import 'package:authentication_app/authentication.dart';
import 'package:authentication_app/src/forgot_password/forgot_password_route/forgot_password_form.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class ForgotPasswordListener extends StatelessWidget {
  const ForgotPasswordListener({
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
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
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
      child: ForgotPasswordForm(
        goToRegisterRoute: goToRegisterRoute,
        goToLoginRoute: goToLoginRoute,
        goToVerificationRoute: goToVerificationRoute,
      ),
    );
  }
}
