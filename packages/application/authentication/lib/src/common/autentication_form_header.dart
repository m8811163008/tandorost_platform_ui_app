import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class AutheticationFormHeader extends StatelessWidget {
  const AutheticationFormHeader({super.key, this.label = ''});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.sizeExtenstion.medium),
        AppLogo(size: context.sizeExtenstion.logoImage),
        SizedBox(height: context.sizeExtenstion.medium),
        Text(label, style: context.textTheme.headlineSmall),
      ],
    );
  }
}
