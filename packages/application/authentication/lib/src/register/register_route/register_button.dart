import 'package:authentication_app/authentication.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
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
