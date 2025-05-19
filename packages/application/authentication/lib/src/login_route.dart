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
    return AppScaffold(body: LoginForm());
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('login', style: context.textTheme.headlineLarge),
        TextField(decoration: InputDecoration(labelText: 'Phonenumber')),
        TextField(decoration: InputDecoration(labelText: 'Password')),
        ElevatedButton(onPressed: () {}, child: Text('Login')),
        SizedBox(width: context.sizeExtenstion.medium,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: () {}, child: Text('Register')),
            SizedBox(width: context.sizeExtenstion.small,),
            TextButton(onPressed: () {}, child: Text('ForgotPass')),
          ],
        ),
      ],
    );
  }
}
