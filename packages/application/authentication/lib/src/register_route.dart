import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tandorost_components/tandorost_components.dart';

class RegisterRoute extends StatelessWidget {
  const RegisterRoute({super.key, this.onLoginTap});
  static const String name = 'register';

  final VoidCallback? onLoginTap;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(body: ForgotPasswordForm());
  }
}

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('register', style: context.textTheme.headlineLarge),
        TextField(decoration: InputDecoration(labelText: 'Phonenumber')),
        TextField(decoration: InputDecoration(labelText: 'Gender')),

        TextField(decoration: InputDecoration(labelText: 'birthday')),
        TextField(
          decoration: InputDecoration(labelText: 'waist circumfrences'),
        ),
        TextField(decoration: InputDecoration(labelText: 'Height')),
        TextField(decoration: InputDecoration(labelText: 'Weight')),
        TextField(decoration: InputDecoration(labelText: 'activityLevel')),
        ElevatedButton(onPressed: () {}, child: Text('Register')),
        SizedBox(width: context.sizeExtenstion.medium),
        TextButton(onPressed: () {}, child: Text('Login')),
      ],
    );
  }
}
