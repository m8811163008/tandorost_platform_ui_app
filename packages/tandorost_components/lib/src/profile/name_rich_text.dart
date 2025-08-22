import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class UserInfoRichText extends StatelessWidget {
  const UserInfoRichText({
    super.key,
    this.label = '',
    this.value = '',
    required this.editValueButton,
  });
  final String value;
  final String label;

  final Widget? editValueButton;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: [
          TextSpan(text: '$label : ', style: context.textTheme.titleSmall),
          TextSpan(text: value, style: context.textTheme.bodyMedium),
          WidgetSpan(
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 8.0),
              child: editValueButton,
            ),
          ),
        ],
      ),
    );
  }
}
