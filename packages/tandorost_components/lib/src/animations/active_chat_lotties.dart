import 'package:flutter/widgets.dart';
import 'package:tandorost_components/src/animations/circle_clipper.dart';

class ActiveChatLotties extends StatelessWidget {
  const ActiveChatLotties({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleClipperAnimation(
      path: 'assets/animations-lottie/active_chat.mp4',
    );
  }
}
