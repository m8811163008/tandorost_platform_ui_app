import 'package:authentication_app/src/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tandorost_components/tandorost_components.dart';

class LoginRoute extends StatelessWidget {
  const LoginRoute({
    super.key,
    this.goToRegisterRoute,
    this.goToForgotPasswordRoute,
    this.goToHomeRoute,
  });
  static const String name = 'login';

  final VoidCallback? goToRegisterRoute;
  final VoidCallback? goToForgotPasswordRoute;
  final VoidCallback? goToHomeRoute;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.sizeExtenstion.extraLarge,
        ),
        child: LoginListener(
          goToRegisterRoute: goToRegisterRoute,
          goToForgotPasswordRoute: goToForgotPasswordRoute,
          goToHomeRoute: goToHomeRoute,
        ),
      ),
    );
  }
}

class LoginListener extends StatelessWidget {
  const LoginListener({
    super.key,
    this.goToRegisterRoute,
    this.goToForgotPasswordRoute,
    this.goToHomeRoute,
  });
  final VoidCallback? goToRegisterRoute;
  final VoidCallback? goToForgotPasswordRoute;
  final VoidCallback? goToHomeRoute;
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen:
          (previous, current) => previous.loginStatus != current.loginStatus,
      listener: (context, state) {
        if (state.loginStatus.isServerConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.exception ?? content)));
        } else if (state.loginStatus.isServerConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.loginStatus.isSuccess) {
          goToHomeRoute?.call();
        }
      },
      child: LoginForm(
        goToRegisterRoute: goToRegisterRoute,
        goToForgotPasswordRoute: goToForgotPasswordRoute,
        goToHomeRoute: goToHomeRoute,
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    this.goToRegisterRoute,
    this.goToForgotPasswordRoute,
    this.goToHomeRoute,
  });
  final VoidCallback? goToRegisterRoute;
  final VoidCallback? goToForgotPasswordRoute;
  final VoidCallback? goToHomeRoute;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<LoginCubit>().login();
                          }
                        },
                      );
                },
              ),
              SizedBox(width: context.sizeExtenstion.small),
              TextButton(
                onPressed: widget.goToHomeRoute?.call,
                child: Text('Cancle'),
              ),
            ],
          ),
          SizedBox(height: context.sizeExtenstion.large),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: widget.goToRegisterRoute?.call,
                child: Text('Register'),
              ),
              SizedBox(width: context.sizeExtenstion.small),
              TextButton(
                onPressed: widget.goToForgotPasswordRoute?.call,
                child: Text('ForgotPass'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
