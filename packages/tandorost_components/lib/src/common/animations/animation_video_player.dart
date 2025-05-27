import 'package:flutter/widgets.dart';
import 'package:tandorost_components/src/common/package_name.dart';
import 'package:video_player/video_player.dart';

class AnimationVideoPlayer extends StatelessWidget {
  const AnimationVideoPlayer({
    super.key,
    required this.path,
  });

  final String path;

  @override
  Widget build(BuildContext context) {
    final controller = VideoPlayerController.asset(path, package: packageName);
    return FutureBuilder(
      future: Future.wait([
        controller.initialize(),
        controller.play(),
        controller.setLooping(true),
        controller.setVolume(0),
      ]),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return VideoPlayer(controller);
        }
        return SizedBox.shrink();
      },
    );
  }
}
