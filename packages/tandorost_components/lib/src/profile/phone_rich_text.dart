import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class PhoneNumberRichText extends StatelessWidget {
  const PhoneNumberRichText({super.key, this.phoneNumber = ''});
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      overflow: TextOverflow.fade,

      text: TextSpan(
        children: [
          TextSpan(
            text: '${context.l10n.personalInfoPhoneLabel} : ',
            style: context.textTheme.titleSmall,
          ),
          TextSpan(text: phoneNumber, style: context.textTheme.bodyMedium),
        ],
      ),
    );
  }
}
