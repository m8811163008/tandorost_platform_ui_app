import 'package:flutter/widgets.dart';
import 'package:tandorost_components/src/common/animations/circle_clipper.dart';
import 'package:tandorost_components/src/common/package_name.dart';

class ChartAnimation extends StatelessWidget {
  const ChartAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/chart_background.png',
      package: packageName,
    );
  }
}
