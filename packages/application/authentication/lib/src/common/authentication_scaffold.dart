import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class AuthenticationScaffold extends StatelessWidget {
  const AuthenticationScaffold({
    super.key,
    required this.child,
    this.title = '',
  });
  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: context.themeData.scaffoldBackgroundColor,
      ),
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
