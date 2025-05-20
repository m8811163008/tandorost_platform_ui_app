import 'package:authentication_app/src/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:authentication_app/src/register/cubit/register_cubit.dart';
import 'package:authentication_app/src/verify_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tandorost_components/tandorost_components.dart';

class ForgotPasswordVerifyPhoneNumberRoute extends StatelessWidget {
  const ForgotPasswordVerifyPhoneNumberRoute({super.key, this.goToLoginRoute});
  static const String name = 'forgot-password-verify-phone-number';
  final VoidCallback? goToLoginRoute;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listenWhen:
          (previous, current) =>
              previous.forgotPasswordStatus != current.forgotPasswordStatus,
      listener: (context, state) {
        if (state.forgotPasswordStatus.isServerConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.exception ?? content)));
        } else if (state.forgotPasswordStatus.isServerConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.exception ?? content)));
        } else if (state.forgotPasswordStatus.isSuccess) {
          goToLoginRoute?.call();
        }
      },
      child: AppScaffold(
        body: VerifyForm(
          submitLabel: 'submit',
          onSubmitPressed: context.read<ForgotPasswordCubit>().onForgotPassword,
          onChangeCode: context.read<ForgotPasswordCubit>().onChangeVerificationCode,
        ),
      ),
    );
  }
}
