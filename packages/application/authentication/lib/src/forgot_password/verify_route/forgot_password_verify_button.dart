import 'package:authentication_app/authentication.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class ForgotPasswordVerifyButton extends StatelessWidget {
  const ForgotPasswordVerifyButton({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      buildWhen:
          (previous, current) =>
              previous.forgotPasswordStatus != current.forgotPasswordStatus,
      builder: (context, state) {
        return state.forgotPasswordStatus.isLoading
            ? AppOutLineButton.loading(
              label: context.l10n.verifyFormOutlineLabel,
            )
            : AppOutLineButton(
              label: context.l10n.verifyFormOutlineLabel,
              onTap: onTap,
            );
      },
    );
  }
}
