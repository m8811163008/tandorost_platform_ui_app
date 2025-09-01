import 'package:flutter/widgets.dart';
import 'package:tandorost_components/src/common/package_name.dart';

class AddNewImageSelfiePlaceholder extends StatelessWidget {
  const AddNewImageSelfiePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/fitness_selfie.png',
      package: packageName,
      fit: BoxFit.cover,
    );
  }
}
