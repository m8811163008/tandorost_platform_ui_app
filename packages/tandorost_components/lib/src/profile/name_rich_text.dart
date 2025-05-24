import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class NameRichText extends StatelessWidget {
  const NameRichText({super.key, this.name = '', required this.editNameButton});
  final String name;

  final Widget? editNameButton;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: [
          TextSpan(
            text: '${context.l10n.personalInfoNameLabel} : ',
            style: context.textTheme.titleSmall,
          ),
          TextSpan(text: name, style: context.textTheme.bodyMedium),
          WidgetSpan(
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 8.0),
              child: editNameButton,
            ),
          ),
        ],
      ),
    );
  }
}
