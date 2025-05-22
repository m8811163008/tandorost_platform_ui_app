import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(context.sizeExtenstion.small),
        child: child,
      ),
    );
  }
}
