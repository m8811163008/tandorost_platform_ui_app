import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class AppScaffoldBody extends StatelessWidget {
  const AppScaffoldBody({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.sizeExtenstion.small),
      child: child,
    );
  }
}
