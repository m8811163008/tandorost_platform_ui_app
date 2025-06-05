import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class AIChatButton extends StatefulWidget {
  const AIChatButton({super.key, this.onLongPressStart, this.onLongPressUp});
  final VoidCallback? onLongPressStart, onLongPressUp;

  @override
  State<AIChatButton> createState() => _AIChatButtonState();
}

class _AIChatButtonState extends State<AIChatButton> {
  Timer _timer = Timer(Duration.zero, () {});
  final Duration _conversationDuration = Duration(seconds: 2);
  bool _isPressed = false;

  late Widget _animatedSwitcherChild;

  Widget get _firstChild => Material(
    // elevation: _isPressed ? 4 : 8,
    shape: CircleBorder(),
    child: LoadingLottie(size: context.sizeExtenstion.chatButton),
  );
  Widget get _secondChild => Material(
    // elevation: _isPressed ? 4 : 8,
    shape: CircleBorder(),
    child: ActiveChatLotties(size: context.sizeExtenstion.chatButton),
  );

  @override
  void dispose() {
    // _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _animatedSwitcherChild = _firstChild;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _isPressed = true;
        // _controller.forward();
      },
      onTapUp: (_) {
        _isPressed = false;
        // _controller.reverse();
      },
      onLongPressStart: (_) {
        _isPressed = true;
        // _controller.forward();
        _timer.cancel();

        _timer = Timer(_conversationDuration, () {});

        widget.onLongPressStart?.call();
        setState(() {
          _animatedSwitcherChild = _secondChild;
        });
      },
      onLongPressUp: () {
        _isPressed = false;
        // _controller.reverse();
        if (!_timer.isActive) {
          setState(() {
            _animatedSwitcherChild = _firstChild;
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                context.l10n.voiceAiInsufficientLength(
                  _conversationDuration.inSeconds,
                ),
              ),
            ),
          );
        }
      },
      child: AnimatedSwitcher(
        duration: Duration(seconds: 2),
        reverseDuration: Duration(seconds: 1),
        child: _animatedSwitcherChild,
      ),
    );
  }
}
