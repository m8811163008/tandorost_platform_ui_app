import 'package:authentication/authentication.dart';
import 'package:authentication_app/src/register/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tandorost_components/tandorost_components.dart';

class RegisterRoute extends StatelessWidget {
  const RegisterRoute({
    super.key,
    this.goToLoginRoute,
    this.goToVerificationRoute,
    this.goToHomeRoute,
  });
  static const String name = 'register';

  final VoidCallback? goToLoginRoute;
  final VoidCallback? goToVerificationRoute;
  final VoidCallback? goToHomeRoute;

  @override
  Widget build(BuildContext context) {
    return RegisterListener(
      goToVerificationRoute: goToVerificationRoute,
      goToLoginRoute: goToLoginRoute,
      goToHomeRoute: goToHomeRoute,
    );
  }
}

class RegisterListener extends StatelessWidget {
  const RegisterListener({
    super.key,
    this.goToVerificationRoute,
    this.goToLoginRoute,
    this.goToHomeRoute,
  });
  final VoidCallback? goToVerificationRoute;
  final VoidCallback? goToLoginRoute;
  final VoidCallback? goToHomeRoute;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen:
          (previous, current) =>
              previous.verificationStatus != current.verificationStatus,
      listener: (context, state) {
        if (state.verificationStatus.isServerConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.exception ?? content)));
        } else if (state.verificationStatus.isServerConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.verificationStatus.isSuccess) {
          goToVerificationRoute?.call();
        }
      },
      child: RegisterForm(
        goToHomeRoute: goToHomeRoute,
        goToLoginRoute: goToLoginRoute,
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key, this.goToLoginRoute, this.goToHomeRoute});
  final VoidCallback? goToLoginRoute;

  final VoidCallback? goToHomeRoute;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('register', style: context.textTheme.headlineLarge),
          SizedBox(height: context.sizeExtenstion.medium),
          PhoneNumberTextField(
            onChange: (value) {
              context.read<RegisterCubit>().onChangePhoneNumber('09$value');
            },
          ),

          SizedBox(height: context.sizeExtenstion.small),
          PasswordTextField(
            onChange: context.read<RegisterCubit>().onChangePinCode,
          ),

          SizedBox(height: context.sizeExtenstion.large),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<RegisterCubit, RegisterState>(
                buildWhen:
                    (previous, current) =>
                        previous.verificationStatus !=
                        current.verificationStatus,
                builder: (context, state) {
                  return state.verificationStatus.isLoading
                      ? AppOutLineButton.loading(label: 'Send')
                      : AppOutLineButton(
                        label: 'Send',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context
                                .read<RegisterCubit>()
                                .sendVerificationCode();
                          }
                        },
                      );
                },
              ),
              SizedBox(width: context.sizeExtenstion.small),
              TextButton(
                onPressed: widget.goToHomeRoute,
                child: Text('Cancle'),
              ),
            ],
          ),

          SizedBox(height: context.sizeExtenstion.large),
          TextButton(onPressed: widget.goToLoginRoute, child: Text('Login')),
        ],
      ),
    );
  }
}
