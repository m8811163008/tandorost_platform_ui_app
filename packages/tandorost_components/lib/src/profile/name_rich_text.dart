import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class UserInfoRichText extends StatelessWidget {
  const UserInfoRichText({
    super.key,
    this.label = '',
    this.value = '',
    this.editValueButton,
  });
  final String value;
  final String label;

  final Widget? editValueButton;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: context.sizeExtenstion.small,
      children: [
        Text(label, style: context.textTheme.titleSmall),

        Text(value, style: context.textTheme.bodyMedium),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 8.0),
          child: editValueButton,
        ),
      ],
    );
  }
}
