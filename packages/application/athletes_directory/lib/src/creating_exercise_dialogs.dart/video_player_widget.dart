import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class VideoPlayerWidget extends StatefulWidget {
  final Uri videoUrl;
  const VideoPlayerWidget({super.key, required this.videoUrl});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
        _controller.play();
      });
    _controller.addListener(() {
      if (_controller.value.hasError) {
        print('Video player error: ${_controller.value.errorDescription}');

        setState(() {
          _isInitialized = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if (!_isInitialized) {
    //   return const Center(child: CircularProgressIndicator());
    // }
    if (!_isInitialized) {
      return Center(
        child: Text(
          _controller.value.hasError
              ? context.l10n.videoPlayerWidgetHasErrorStatusLabel
              : context.l10n.videoPlayerWidgetLodingStatusLabel,
        ),
      );
    }
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
        VideoProgressIndicator(_controller, allowScrubbing: true),
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton(
            mini: true,
            onPressed: () {
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            },
            child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
          ),
        ),
      ],
    );
  }
}
