import 'package:flutter/widgets.dart';
import 'package:tandorost_components/src/animations/circle_clipper.dart';

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({super.key, this.size});
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return CircleClipperAnimation(
      size: size,
      path: 'assets/animations-lottie/loading_indicator.mp4',
    );
  }
}
