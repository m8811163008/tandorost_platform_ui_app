import 'package:authentication_app/authentication.dart';
import 'package:authentication_app/src/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen:
          (previous, current) => previous.loginStatus != current.loginStatus,
      builder: (context, state) {
        return state.loginStatus.isLoading
            ? AppOutLineButton.loading(label: context.l10n.textButtonLabelLogin)
            : AppOutLineButton(
              label: context.l10n.textButtonLabelLogin,
              onTap: onTap,
            );
      },
    );
  }
}
