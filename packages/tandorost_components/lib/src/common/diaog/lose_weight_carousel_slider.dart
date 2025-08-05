import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/src/common/package_name.dart';
import 'package:tandorost_components/tandorost_components.dart';

class LoseWeightCarouselSlider extends StatefulWidget {
  const LoseWeightCarouselSlider({super.key});

  @override
  State<LoseWeightCarouselSlider> createState() =>
      _LoseWeightCarouselSliderState();
}

class _LoseWeightCarouselSliderState extends State<LoseWeightCarouselSlider> {
  int _current = 0;
  final List<Widget> items = [
    Image.asset('assets/payment_slides/2.jpg', package: packageName),
    Image.asset('assets/payment_slides/1.jpg', package: packageName),
    Image.asset('assets/payment_slides/3.jpg', package: packageName),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            context.l10n.paymentDialogCarouselTitle,
            style: context.textTheme.labelLarge!.copyWith(
              color: context.themeData.colorScheme.onPrimary,
            ),
          ),
        ),
        SizedBox(height: context.sizeExtenstion.xExtraLarge),
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 809 / 377,
            // height: 264.0,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          items: items,
        ),

        SizedBox(height: context.sizeExtenstion.xExtraLarge),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(items.length, (index) {
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    _current == index
                        ? context.themeData.colorScheme.onPrimary
                        : Colors.grey,
              ),
            );
          }),
        ),
      ],
    );
  }
}
