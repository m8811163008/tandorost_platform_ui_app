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
  late Timer _timer;
  final Duration _conversationDuration = Duration(seconds: 2);
  late CrossFadeState _crossFadeState;

  @override
  void initState() {
    _timer = Timer(Duration.zero, () {});
    _crossFadeState = CrossFadeState.showFirst;
    super.initState();
  }

  @override
  void dispose() {
    // _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (_) {
        _timer.cancel();

        _timer = Timer(_conversationDuration, () {});

        widget.onLongPressStart?.call();
        setState(() {
          _crossFadeState = CrossFadeState.showSecond;
        });
      },
      onLongPressUp: () {
        if (_timer.isActive) {
          if (mounted) {
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
        }
        setState(() {
          _crossFadeState = CrossFadeState.showFirst;
        });
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 1000),
        reverseDuration: const Duration(milliseconds: 700),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        child:
            _crossFadeState == CrossFadeState.showFirst
                ? Material(
                  key: const ValueKey('loading-lottie'),
                  elevation: 8,
                  shape: const CircleBorder(),
                  child: LoadingLottie(size: context.sizeExtenstion.chatButton),
                )
                : Material(
                  key: const ValueKey('active-chat-lottie'),
                  elevation: 4,
                  shape: const CircleBorder(),
                  child: ActiveChatLotties(
                    size: context.sizeExtenstion.chatButton,
                  ),
                ),
      ),
    );
  }
}
