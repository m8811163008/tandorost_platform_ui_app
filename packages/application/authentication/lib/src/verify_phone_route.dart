import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tandorost_components/tandorost_components.dart';

class VerifyPhoneNumberRoute extends StatelessWidget {
  const VerifyPhoneNumberRoute({super.key});
  static const String name = 'verify-phone-number';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(body: VerifyForm());
  }
}

class VerifyForm extends StatelessWidget {
  const VerifyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Verify number', style: context.textTheme.headlineLarge),
        SizedBox(height: context.sizeExtenstion.medium),
        TextField(decoration: InputDecoration(labelText: 'verificationCode')),
        SizedBox(height: context.sizeExtenstion.large),
        OutlinedButton(onPressed: () {}, child: Text('Verify')),
      ],
    );
  }
}
