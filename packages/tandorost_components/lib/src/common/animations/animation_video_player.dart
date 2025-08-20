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
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      widget.path,
      package: packageName,
    );
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      _controller.setLooping(true);
      _controller.setVolume(0);
      _controller.play();
      setState(() {}); // Ensure widget rebuilds after initialization
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return VideoPlayer(_controller);
        } else {
          return const SizedBox(); // Or a loading indicator
        }
      },
    );
  }
}
