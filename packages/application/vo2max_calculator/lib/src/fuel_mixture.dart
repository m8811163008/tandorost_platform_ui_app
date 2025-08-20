import 'package:flutter/widgets.dart';
import 'package:vo2max_calculator/src/package_name.dart';

class FuelMixtureImage extends StatelessWidget {
  const FuelMixtureImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/fuel_mixture.jpg',
      package: packageName,
      fit: BoxFit.cover,
    );
  }
}