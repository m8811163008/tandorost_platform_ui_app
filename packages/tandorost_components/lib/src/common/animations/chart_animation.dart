import 'package:flutter/widgets.dart';
import 'package:tandorost_components/src/common/animations/circle_clipper.dart';

class ChartAnimation extends StatelessWidget {
  const ChartAnimation({super.key, this.size});
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return AnimationClipper(
      size: size,
      path: 'assets/animations/chart_animation.mp4',
      isCircle: false,
    );
  }
}
