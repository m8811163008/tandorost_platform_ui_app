import 'package:flutter/widgets.dart';
import 'package:tandorost_components/src/common/animations/circle_clipper.dart';

class ActiveChatLotties extends StatelessWidget {
  const ActiveChatLotties({super.key, this.size});
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return CircleClipperAnimation(
      size: size,
      path: 'assets/animations-lottie/active_chat.mp4',
    );
  }
}
