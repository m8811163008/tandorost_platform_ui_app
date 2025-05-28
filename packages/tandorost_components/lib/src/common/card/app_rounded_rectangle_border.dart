import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class AppRoundedRectangleBorder extends StatelessWidget {
  const AppRoundedRectangleBorder({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.sizeExtenstion.small),
      child: Material(
        shape: RoundedRectangleBorder(
          side: BorderSide(),
          borderRadius: BorderRadius.circular(context.sizeExtenstion.small),
        ),

        child: child,
      ),
    );
  }
}