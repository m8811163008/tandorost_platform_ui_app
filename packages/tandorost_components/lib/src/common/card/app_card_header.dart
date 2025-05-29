import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class AppCardHeader extends StatelessWidget {
  const AppCardHeader({super.key, this.title = ''});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.textTheme.headlineSmall),
        SizedBox(height: context.sizeExtenstion.small),
      ],
    );
  }
}
