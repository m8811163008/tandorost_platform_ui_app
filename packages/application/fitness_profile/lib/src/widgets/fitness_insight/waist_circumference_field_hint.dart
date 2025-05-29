import 'package:flutter/material.dart';
import 'package:fitness_profile_app/src/widgets/fitness_insight/package_name.dart';
import 'package:tandorost_components/tandorost_components.dart';

class WaistCircumferenceFieldHint extends StatelessWidget {
  const WaistCircumferenceFieldHint({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      titlePadding: EdgeInsets.all(context.sizeExtenstion.medium),
      contentPadding: EdgeInsets.only(
        left: context.sizeExtenstion.medium,
        right: context.sizeExtenstion.medium,
        bottom: context.sizeExtenstion.medium,
      ),
      title: const Text('دور کمر'),
      children: [
        Text.rich(
          TextSpan(
            text:
                'روش اندازه گیری دور کمر به توصیه سازمان بهداشت جهانی و فدراسیون بین المللی دیابت ',
            children: [
              TextSpan(
                text: 'بین پایین ترین دنده ها و ستیغ تهیگاهی ',
                style: context.themeData.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(text: 'است. '),
            ],
          ),
        ),
        WaistCircumferenceFieldHintImage(),
        SizedBox(height: context.sizeExtenstion.medium),
        const Text('بالاتر از ناف باشد و پوست زیر متر جمع نشود'),
      ],
    );
  }
}

class WaistCircumferenceFieldHintImage extends StatelessWidget {
  const WaistCircumferenceFieldHintImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/waist_circumference.png',
      package: packageName,
    );
  }
}
