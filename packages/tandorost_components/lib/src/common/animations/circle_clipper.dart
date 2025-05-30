import 'package:flutter/widgets.dart';
import 'package:tandorost_components/src/common/animations/animation_video_player.dart';

class AnimationClipper extends StatelessWidget {
  AnimationClipper({
    super.key,
    required this.path,
    this.isCircle = true,
    Size? size,
  }) : size = size ?? Size.square(40);
  final String path;
  final Size size;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: isCircle ? CircleClipper() : null,
      child: SizedBox.fromSize(
        size: size,
        child: AnimationVideoPlayer(path: path),
      ),
    );
  }
}

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.addOval(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2.15,
      ),
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
