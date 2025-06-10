import 'package:authentication_app/authentication.dart';
import 'package:authentication_app/src/common/common.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class VerifyFormRegister extends StatefulWidget {
  const VerifyFormRegister({super.key});

  @override
  State<VerifyFormRegister> createState() => _VerifyFormRegisterState();
}

class _VerifyFormRegisterState extends State<VerifyFormRegister> {
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
            onChanged: context.read<RegisterCubit>().onChangeVerificationCode,
            textDirection: TextDirection.ltr,
          ),
          SizedBox(height: context.sizeExtenstion.large),
          BlocBuilder<RegisterCubit, RegisterState>(
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
                    onTap: () {
                      if (_key.currentState!.validate()) {
                        context.read<RegisterCubit>().onRegister();
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
