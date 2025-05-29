import 'package:fitness_profile_app/src/widgets/fitness_insight/package_name.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class AddMesurementDialogHint extends StatelessWidget {
  const AddMesurementDialogHint({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      titlePadding:  EdgeInsets.all(context.sizeExtenstion.medium),
      contentPadding:  EdgeInsets.only(
        left: context.sizeExtenstion.medium,
        right: context.sizeExtenstion.medium,
        bottom: context.sizeExtenstion.medium,
      ),
      title: const Text('شکل بدن'),
      children: [
        const Text(
          'بخاطر پیشگیری از وسواس فکری بیش از هفته‌ای یکبار خود را وزن نکنید.',
        ),
        const Text(
          'اندازه گیری شکل بدن نسبت به اندازه گیری وزن بیشتر باعث انگیزه تناسب اندام میشود.',
        ),
        const Text(
          'با اندازه گیری شکل بدن متوجه میشوید توزیع کاهش چربی در بدن چه شکلی داشته',
        ),
        SizedBox(height: context.sizeExtenstion.medium),
        const AddMesurementDialogHintImage(),
        SizedBox(height: context.sizeExtenstion.medium),
        Text(
          'زمان اندازه گیری ماهیچه سرد باشد.',
          style: context.themeData.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text('حداکثر انقباض یا قطر ماهیچه را اندازه بگیرید.'),
        const Divider(),
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
        SizedBox(height: context.sizeExtenstion.medium),
        const Text('بالاتر از ناف باشد و پوست زیر متر جمع نشود'),
      ],
    );
  }
}

class AddMesurementDialogHintImage extends StatelessWidget {
  const AddMesurementDialogHintImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/body_composition_sites.png',
      package: packageName,
    );
  }
}
