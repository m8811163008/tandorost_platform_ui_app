import 'package:flutter/widgets.dart';
import 'package:tandorost_components/src/common/package_name.dart';

class AddNewImageSelfie extends StatelessWidget {
  const AddNewImageSelfie({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/fitness_selfie.jpg',
      package: packageName,
    );
  }
}
