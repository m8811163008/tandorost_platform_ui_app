import 'package:authentication_app/authentication.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class VerifyPhoneButton extends StatelessWidget {
  const VerifyPhoneButton({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen:
          (previous, current) =>
              previous.registerStatus != current.registerStatus,
      builder: (context, state) {
        return state.registerStatus.isLoading
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
