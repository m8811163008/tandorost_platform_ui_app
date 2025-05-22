import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class PhoneNumberRichText extends StatelessWidget {
  const PhoneNumberRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.end,
      overflow: TextOverflow.fade,
      text: TextSpan(
        children: [
          TextSpan(text: 'PhoneNumber : ', style: context.textTheme.titleSmall),
          TextSpan(
            // style: TextStyle(),
            text: '+9892123123',
            // style: context.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
