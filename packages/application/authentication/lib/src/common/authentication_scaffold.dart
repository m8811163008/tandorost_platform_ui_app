import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class AuthenticationScaffold extends StatelessWidget {
  const AuthenticationScaffold({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.sizeExtenstion.extraLarge,
          ),
          child: child,
        ),
      ),
    );
  }
}