import 'package:authentication_app/src/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class LoginRoute extends StatelessWidget {
  const LoginRoute({
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
    return AppScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.sizeExtenstion.extraLarge,
          ),
          child: LoginListener(
            goToRegisterRoute: goToRegisterRoute,
            goToForgotPasswordRoute: goToForgotPasswordRoute,
            goToHomeRoute: goToHomeRoute,
          ),
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
        if (state.loginStatus.isConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.exception ?? content)));
        } else if (state.loginStatus.isConnectionError) {
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
          AppLogo(size: context.sizeExtenstion.chatButton),
          Text(
            context.l10n.loginRouteLabel,
            style: context.textTheme.headlineLarge,
          ),
          SizedBox(height: context.sizeExtenstion.extraLarge),
          PhoneNumberTextField(
            onChange: (value) {
              context.read<LoginCubit>().onChangePhoneNumber('09$value');
            },
            textDirection: TextDirection.ltr,
            autofillHints: [AutofillHints.newUsername, AutofillHints.username],
          ),
          SizedBox(height: context.sizeExtenstion.small),
          PasswordTextField(
            onChange: context.read<LoginCubit>().onChangePinCode,
            textDirection: TextDirection.ltr,
            autofillHints: [AutofillHints.password],
          ),

          SizedBox(height: context.sizeExtenstion.large),
          BlocBuilder<LoginCubit, LoginState>(
            buildWhen:
                (previous, current) =>
                    previous.loginStatus != current.loginStatus,
            builder: (context, state) {
              return state.loginStatus.isLoading
                  ? AppOutLineButton.loading(
                    label: context.l10n.textButtonLabelLogin,
                  )
                  : AppOutLineButton(
                    label: context.l10n.textButtonLabelLogin,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<LoginCubit>().login();
                      }
                    },
                  );
            },
          ),
          SizedBox(height: context.sizeExtenstion.large),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              TextButton(
                onPressed: widget.goToRegisterRoute?.call,
                child: Text(context.l10n.registerLabel),
              ),
              SizedBox(width: context.sizeExtenstion.small),
              TextButton(
                onPressed: widget.goToForgotPasswordRoute?.call,
                child: Text(context.l10n.forgotPasswordLabel),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
