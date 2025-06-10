import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class BottomSheetHeader extends StatelessWidget {
  const BottomSheetHeader({super.key, this.title = ''});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: context.textTheme.headlineMedium),
        Divider(),
        SizedBox(height: context.sizeExtenstion.medium),
      ],
    );
  }
}