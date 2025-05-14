import 'package:flutter/widgets.dart';
import 'package:tandorost_components/src/animations/animation_video_player.dart';
import 'package:tandorost_components/src/animations/circle_clipper.dart';

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleClipperAnimation(
      path: 'assets/animations-lottie/loading_indicator.mp4',
    );
  }
}
