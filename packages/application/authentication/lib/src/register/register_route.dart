import 'package:authentication_app/src/register/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class RegisterRoute extends StatelessWidget {
  const RegisterRoute({
    super.key,
    this.goToLoginRoute,
    this.goToVerificationRoute,
    this.goToHomeRoute,
  });

  final VoidCallback? goToLoginRoute;
  final VoidCallback? goToVerificationRoute;
  final VoidCallback? goToHomeRoute;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.sizeExtenstion.extraLarge,
          ),
          child: RegisterListener(
            goToVerificationRoute: goToVerificationRoute,
            goToLoginRoute: goToLoginRoute,
            goToHomeRoute: goToHomeRoute,
          ),
        ),
      ),
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
          Text(
            context.l10n.registerLabel,
            style: context.textTheme.headlineLarge,
          ),
          SizedBox(height: context.sizeExtenstion.extraLarge),
          PhoneNumberTextField(
            onChange: (value) {
              context.read<RegisterCubit>().onChangePhoneNumber('09$value');
            },
            textDirection: TextDirection.ltr,
          ),

          SizedBox(height: context.sizeExtenstion.small),
          PasswordTextField(
            onChange: context.read<RegisterCubit>().onChangePinCode,
            textDirection: TextDirection.ltr,
          ),

          SizedBox(height: context.sizeExtenstion.large),
          BlocBuilder<RegisterCubit, RegisterState>(
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
                        context.read<RegisterCubit>().sendVerificationCode();
                      }
                    },
                  );
            },
          ),

          SizedBox(height: context.sizeExtenstion.large),
          TextButton(
            onPressed: widget.goToLoginRoute,
            child: Text(context.l10n.textButtonLabelLogin),
          ),
        ],
      ),
    );
  }
}
