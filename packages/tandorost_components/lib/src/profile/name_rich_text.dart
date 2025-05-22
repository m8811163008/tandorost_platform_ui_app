import 'package:flutter/material.dart';
import 'package:tandorost_components/src/profile/edit_name_button.dart';
import 'package:tandorost_components/tandorost_components.dart';

class NameRichText extends StatelessWidget {
  const NameRichText({super.key, this.name = '', required this.submitButton});
  final String name;
  final Widget submitButton;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.end,
      text: TextSpan(
        children: [
          TextSpan(text: 'Name : ', style: context.textTheme.titleSmall),
          TextSpan(text: name, style: context.textTheme.bodyMedium),
          WidgetSpan(
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 8.0),
              child: EditNameButton(
                initialValue: name,
                submitButton: submitButton,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
