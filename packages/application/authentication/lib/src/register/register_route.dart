import 'package:authentication/authentication.dart';
import 'package:authentication_app/src/register/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tandorost_components/tandorost_components.dart';

class RegisterRoute extends StatelessWidget {
  const RegisterRoute({super.key, this.onLoginTap});
  static const String name = 'register';

  final VoidCallback? onLoginTap;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => RegisterCubit(
            RepositoryProvider.of<AuthenticationRepository>(context),
          ),
      child: AppScaffold(body: RegisterForm()),
    );
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('register', style: context.textTheme.headlineLarge),
        SizedBox(height: context.sizeExtenstion.medium),
        TextField(decoration: InputDecoration(labelText: 'Phonenumber')),
        SizedBox(height: context.sizeExtenstion.small),
        TextField(decoration: InputDecoration(labelText: 'Password')),
        SizedBox(height: context.sizeExtenstion.large),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(onPressed: () {}, child: Text('Register')),
            SizedBox(width: context.sizeExtenstion.small),
            TextButton(onPressed: () {}, child: Text('Cancle')),
          ],
        ),

        SizedBox(height: context.sizeExtenstion.large),
        TextButton(onPressed: () {}, child: Text('Login')),
      ],
    );
  }
}
