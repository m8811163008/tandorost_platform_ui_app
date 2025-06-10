import 'package:authentication_app/authentication.dart';
import 'package:authentication_app/src/register/verify_route/verify_form.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class VerifyPhoneListener extends StatelessWidget {
  const VerifyPhoneListener({super.key, this.goToLoginRoute});
  final VoidCallback? goToLoginRoute;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen:
          (previous, current) =>
              previous.registerStatus != current.registerStatus,
      listener: (context, state) {
        if (state.registerStatus.isConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.exception ?? content)));
        } else if (state.registerStatus.isConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.exception ?? content)));
        } else if (state.registerStatus.isSuccess) {
          goToLoginRoute?.call();
        }
      },
      child: VerifyFormRegister(),
    );
  }
}