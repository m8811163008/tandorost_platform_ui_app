import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tandorost_components/tandorost_components.dart';

class ForgotPasswordRoute extends StatelessWidget {
  const ForgotPasswordRoute({super.key, this.onLoginTap, this.onRegisterTap});
  static const String name = 'forgot-password';

  final VoidCallback? onRegisterTap;
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
        Text('forgot password', style: context.textTheme.headlineLarge,),
        TextField(decoration: InputDecoration(labelText: 'Phonenumber')),
        TextField(decoration: InputDecoration(labelText: 'NewPassword')),
        ElevatedButton(onPressed: () {}, child: Text('Forgot password')),
        SizedBox(width: context.sizeExtenstion.medium,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: () {}, child: Text('Register')),
            SizedBox(width: context.sizeExtenstion.small,),
            TextButton(onPressed: () {}, child: Text('Login')),
          ],
        ),
      ],
    );
  }
}
