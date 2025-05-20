import 'package:authentication_app/src/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tandorost_components/tandorost_components.dart';

class LoginRoute extends StatelessWidget {
  const LoginRoute({super.key, this.onForgotPasswordTap, this.onRegisterTap});
  static const String name = 'login';

  final VoidCallback? onRegisterTap;
  final VoidCallback? onForgotPasswordTap;

  @override
  Widget build(BuildContext context) {
    return LoginForm();
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('login', style: context.textTheme.headlineLarge),
          SizedBox(height: context.sizeExtenstion.medium),
          PhoneNumberTextField(
            onChange: (value) {
              context.read<LoginCubit>().onChangePhoneNumber('09$value');
            },
          ),
          SizedBox(height: context.sizeExtenstion.small),
          PasswordTextField(
            onChange: context.read<LoginCubit>().onChangePinCode,
          ),

          SizedBox(height: context.sizeExtenstion.large),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<LoginCubit, LoginState>(
                buildWhen:
                    (previous, current) =>
                        previous.loginStatus != current.loginStatus,
                builder: (context, state) {
                  return state.loginStatus.isLoading
                      ? AppOutLineButton.loading(label: 'Login')
                      : AppOutLineButton(
                        label: 'Login',
                        onTap: context.read<LoginCubit>().login,
                      );
                },
              ),

              SizedBox(width: context.sizeExtenstion.small),
              TextButton(onPressed: () {}, child: Text('Cancle')),
            ],
          ),
          SizedBox(height: context.sizeExtenstion.large),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: () {}, child: Text('Register')),
              SizedBox(width: context.sizeExtenstion.small),
              TextButton(onPressed: () {}, child: Text('ForgotPass')),
            ],
          ),
        ],
      ),
    );
  }
}
