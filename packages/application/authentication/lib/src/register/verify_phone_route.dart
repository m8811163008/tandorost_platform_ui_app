import 'package:authentication_app/src/register/cubit/register_cubit.dart';
import 'package:authentication_app/src/register/verify_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        if (state.registerStatus.isServerConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.exception ?? content)));
        } else if (state.registerStatus.isServerConnectionError) {
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
