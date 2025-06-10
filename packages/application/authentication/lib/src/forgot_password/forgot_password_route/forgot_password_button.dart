import 'package:authentication_app/src/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      buildWhen:
          (previous, current) =>
              previous.verificationStatus != current.verificationStatus,
      builder: (context, state) {
        return state.verificationStatus.isLoading
            ? AppOutLineButton.loading(
              label: context.l10n.verifyRouteOutlineLabel,
            )
            : AppOutLineButton(
              label: context.l10n.verifyRouteOutlineLabel,
              onTap: onTap,
            );
      },
    );
  }
}
