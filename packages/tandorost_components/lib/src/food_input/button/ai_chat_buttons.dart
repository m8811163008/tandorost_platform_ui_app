import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class AIChatButton extends StatefulWidget {
  const AIChatButton({super.key, this.onLongPressStart, this.onLongPressUp});
  final VoidCallback? onLongPressStart, onLongPressUp;

  @override
  State<AIChatButton> createState() => _AIChatButtonState();
}

class _AIChatButtonState extends State<AIChatButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  Timer _timer = Timer(Duration.zero, () {});
  final Duration _conversation_duration = Duration(seconds: 2);
  bool _isPressed = false;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      reverseDuration: Duration(seconds: 1),
    );
    _animation = Tween(begin: 1.0, end: 0.0).animate(_controller);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _isPressed = true;
        _controller.forward();
      },
      onTapUp: (_) {
        _isPressed = false;
        _controller.reverse();
      },
      onLongPressStart: (_) {
        _isPressed = true;
        _controller.forward();
        _timer.cancel();

        _timer = Timer(_conversation_duration, () {});

        widget.onLongPressStart?.call();
      },
      onLongPressUp: () {
        _isPressed = false;
        _controller.reverse();
        if (!_timer.isActive) {
          widget.onLongPressUp?.call();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                context.l10n.voiceAiInsufficientLength(
                  _conversation_duration.inSeconds,
                ),
              ),
            ),
          );
        }
      },
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Material(
                // color: Colors.transparent,
                elevation: _isPressed ? 4 : 8,
                shape: CircleBorder(),
                child: Opacity(opacity: _animation.value, child: child),
              );
            },
            child: LoadingLottie(size: context.sizeExtenstion.chatButton),
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Opacity(opacity: 1 - _animation.value, child: child);
            },
            child: ActiveChatLotties(size: context.sizeExtenstion.chatButton),
          ),
        ],
      ),
    );
  }
}
