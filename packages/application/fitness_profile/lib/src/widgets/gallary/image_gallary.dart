import 'package:fitness_profile_app/src/widgets/gallary/gallary.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class ImageGallary extends StatelessWidget {
  const ImageGallary({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppCardHeader(title: context.l10n.fitnessProfileImageGallaryTitle),
          CarouselSliderBuilder(),
        ],
      ),
    );
  }
}
