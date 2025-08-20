import 'package:flutter/widgets.dart';
import 'package:tandorost_components/src/common/package_name.dart';

class EmptyChartImage extends StatelessWidget {
  const EmptyChartImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/chart_background.png',
      package: packageName,
    );
  }
}
