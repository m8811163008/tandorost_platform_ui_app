import 'package:authentication_app/src/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class ForgotPasswordRoute extends StatelessWidget {
  const ForgotPasswordRoute({
    super.key,
    this.goToLoginRoute,
    this.goToVerificationRoute,
    this.goToRegisterRoute,
  });

  final VoidCallback? goToLoginRoute;
  final VoidCallback? goToVerificationRoute;
  final VoidCallback? goToRegisterRoute;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.sizeExtenstion.extraLarge,
          ),
          child: ForgotPasswordListener(
            goToLoginRoute: goToLoginRoute,
            goToVerificationRoute: goToVerificationRoute,
            goToRegisterRoute: goToRegisterRoute,
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordListener extends StatelessWidget {
  const ForgotPasswordListener({
    super.key,
    this.goToLoginRoute,
    this.goToVerificationRoute,
    this.goToRegisterRoute,
  });
  final VoidCallback? goToLoginRoute;
  final VoidCallback? goToVerificationRoute;
  final VoidCallback? goToRegisterRoute;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listenWhen:
          (previous, current) =>
              previous.verificationStatus != current.verificationStatus,
      listener: (context, state) {
        if (state.verificationStatus.isConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.exception ?? content)));
        } else if (state.verificationStatus.isConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.verificationStatus.isSuccess) {
          goToVerificationRoute?.call();
        }
      },
      child: ForgotPasswordForm(
        goToRegisterRoute: goToRegisterRoute,
        goToLoginRoute: goToLoginRoute,
        goToVerificationRoute: goToVerificationRoute,
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({
    super.key,
    this.goToRegisterRoute,
    this.goToLoginRoute,
    this.goToVerificationRoute,
  });
  final VoidCallback? goToLoginRoute;
  final VoidCallback? goToVerificationRoute;
  final VoidCallback? goToRegisterRoute;

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.l10n.forgotPasswordLabel,
            style: context.textTheme.headlineLarge,
          ),
          SizedBox(height: context.sizeExtenstion.extraLarge),
          PhoneNumberTextField(
            onChange: (value) {
              context.read<ForgotPasswordCubit>().onChangePhoneNumber(
                '09$value',
              );
            },
            textDirection: TextDirection.ltr,
          ),
          SizedBox(height: context.sizeExtenstion.small),
          PasswordTextField(
            onChange: context.read<ForgotPasswordCubit>().onChangePinCode,
            textDirection: TextDirection.ltr,
          ),

          SizedBox(height: context.sizeExtenstion.large),
          BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
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
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        context
                            .read<ForgotPasswordCubit>()
                            .sendVerificationCode();
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
                onPressed: widget.goToRegisterRoute,
                child: Text(context.l10n.registerLabel),
              ),
              SizedBox(width: context.sizeExtenstion.small),
              TextButton(
                onPressed: widget.goToLoginRoute,
                child: Text(context.l10n.textButtonLabelLogin),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
