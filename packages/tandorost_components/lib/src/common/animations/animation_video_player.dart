import 'package:flutter/widgets.dart';
import 'package:tandorost_components/src/common/package_name.dart';
import 'package:video_player/video_player.dart';

class AnimationVideoPlayer extends StatefulWidget {
  const AnimationVideoPlayer({super.key, required this.path});

  final String path;

  @override
  State<AnimationVideoPlayer> createState() => _AnimationVideoPlayerState();
}

class _AnimationVideoPlayerState extends State<AnimationVideoPlayer> {
  late final VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset(widget.path, package: packageName)
          ..initialize()
          ..play()
          ..setLooping(true)
          ..setVolume(0);
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(_controller);
  }
}
