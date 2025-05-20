import 'package:authentication_app/src/register/cubit/register_cubit.dart';
import 'package:authentication_app/src/verify_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tandorost_components/tandorost_components.dart';

class RegisterVerifyPhoneNumberRoute extends StatelessWidget {
  const RegisterVerifyPhoneNumberRoute({super.key, this.goToLoginRoute});
  static const String name = 'verify-phone-number';
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
        } else if (state.verificationStatus.isSuccess) {
          goToLoginRoute?.call();
        }
      },
      child: AppScaffold(
        body: VerifyForm(
          submitLabel: 'submit',
          onSubmitPressed: context.read<RegisterCubit>().onRegister,
          onChangeCode: context.read<RegisterCubit>().onChangeVerificationCode,
        ),
      ),
    );
  }
}
