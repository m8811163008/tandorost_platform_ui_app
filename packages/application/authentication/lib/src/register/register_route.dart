import 'package:authentication/authentication.dart';
import 'package:authentication_app/src/register/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return BlocProvider(
      create:
          (context) => RegisterCubit(
            RepositoryProvider.of<AuthenticationRepository>(context),
          ),
      child: AppScaffold(
        body: RegisterListener(goToVerificationRoute: goToVerificationRoute),
      ),
    );
  }
}

class RegisterListener extends StatelessWidget {
  const RegisterListener({super.key, this.goToVerificationRoute});
  final VoidCallback? goToVerificationRoute;

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
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.verificationStatus.isServerConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.verificationStatus.isSuccess) {
          goToVerificationRoute?.call();
        }
      },
      child: RegisterForm(),
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
          NumberTextField(
            label: 'Phonenumber',
            prefix: '+98  9',
            hintText: '---------',
            maxLength: 9,
            onChange: (value) {
              context.read<RegisterCubit>().onChangePhoneNumber('09$value');
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.l10n.emptyFormFieldValidationError;
              } else if (value.length < 9) {
                return context.l10n.minLengthFormFieldValidationError(9);
              }
              return null;
            },
          ),

          SizedBox(height: context.sizeExtenstion.small),
          NumberTextField(
            label: 'PinCode',
            hintText: '1234',
            maxLength: 4,
            obscureText: true,
            onChange: context.read<RegisterCubit>().onChangePinCode,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.l10n.emptyFormFieldValidationError;
              } else if (value.length < 4) {
                return context.l10n.minLengthFormFieldValidationError(4);
              }
              return null;
            },
          ),

          SizedBox(height: context.sizeExtenstion.large),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<RegisterCubit>().sendVerificationCode();
                  }
                },
                child: Text('Register'),
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

class NumberTextField extends StatelessWidget {
  const NumberTextField({
    super.key,
    required this.label,
    this.prefix,
    this.hintText,
    this.maxLength,
    this.onChange,
    this.validator,
    this.obscureText = false,
  });
  final String label;
  final String? prefix;
  final String? hintText;
  final int? maxLength;
  final ValueSetter<String>? onChange;
  final String? Function(String?)? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          labelText: label,
          prefixText: prefix,
          hintText: hintText,
        ),
        obscureText: obscureText,
        textDirection: TextDirection.ltr,
        maxLength: maxLength,
        textAlign: TextAlign.left,
        onChanged: onChange,

        validator: validator,
      ),
    );
  }
}
