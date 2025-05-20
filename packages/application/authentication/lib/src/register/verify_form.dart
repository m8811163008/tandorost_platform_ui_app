import 'package:authentication_app/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          Text('Verify number', style: context.textTheme.headlineLarge),
          SizedBox(height: context.sizeExtenstion.medium),

          VerificationCodeTextField(
            onChanged: context.read<RegisterCubit>().onChangeVerificationCode,
          ),
          SizedBox(height: context.sizeExtenstion.large),
          BlocBuilder<RegisterCubit, RegisterState>(
            buildWhen:
                (previous, current) =>
                    previous.registerStatus != current.registerStatus,
            builder: (context, state) {
              return state.registerStatus.isLoading
                  ? AppOutLineButton.loading(label: 'submit')
                  : AppOutLineButton(
                    label: 'submit',
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
