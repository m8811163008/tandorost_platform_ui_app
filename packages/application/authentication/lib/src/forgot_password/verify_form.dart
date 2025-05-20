import 'package:authentication_app/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tandorost_components/tandorost_components.dart';

class VerifyFormForgotPassword extends StatefulWidget {
  const VerifyFormForgotPassword({super.key});

  @override
  State<VerifyFormForgotPassword> createState() =>
      _VerifyFormForgotPasswordState();
}

class _VerifyFormForgotPasswordState extends State<VerifyFormForgotPassword> {
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.l10n.verifyNumberTextFieldLabel,
            style: context.textTheme.headlineLarge,
          ),
          SizedBox(height: context.sizeExtenstion.extraLarge),
          VerificationCodeTextField(
            onChanged:
                context.read<ForgotPasswordCubit>().onChangeVerificationCode,
          ),

          SizedBox(height: context.sizeExtenstion.large),
          BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
            buildWhen:
                (previous, current) =>
                    previous.forgotPasswordStatus !=
                    current.forgotPasswordStatus,
            builder: (context, state) {
              return state.forgotPasswordStatus.isLoading
                  ? AppOutLineButton.loading(
                    label: context.l10n.verifyFormOutlineLabel,
                  )
                  : AppOutLineButton(
                    label: context.l10n.verifyFormOutlineLabel,
                    onTap: () {
                      if (_key.currentState!.validate()) {
                        context.read<ForgotPasswordCubit>().onForgotPassword();
                      }
                    },
                  );
            },
          ),
        ],
      ),
    );
  }
}
