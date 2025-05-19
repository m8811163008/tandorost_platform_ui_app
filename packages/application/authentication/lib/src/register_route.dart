import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tandorost_components/tandorost_components.dart';

class RegisterRoute extends StatelessWidget {
  const RegisterRoute({super.key, this.onLoginTap});
  static const String name = 'register';

  final VoidCallback? onLoginTap;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(body: RegisterForm());
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
        TextField(decoration: InputDecoration(labelText: 'Gender')),
        SizedBox(height: context.sizeExtenstion.small),

        TextField(decoration: InputDecoration(labelText: 'birthday')),
        SizedBox(height: context.sizeExtenstion.small),
        TextField(
          decoration: InputDecoration(labelText: 'waist circumfrences'),
        ),
        SizedBox(height: context.sizeExtenstion.small),
        TextField(decoration: InputDecoration(labelText: 'Height')),
        SizedBox(height: context.sizeExtenstion.small),
        TextField(decoration: InputDecoration(labelText: 'Weight')),
        SizedBox(height: context.sizeExtenstion.small),
        TextField(decoration: InputDecoration(labelText: 'activityLevel')),

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
