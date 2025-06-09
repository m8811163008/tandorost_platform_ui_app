import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class AiChatButtonBuilder extends StatelessWidget {
  const AiChatButtonBuilder({
    super.key,
    this.onLongPressStart,
    this.onLongPressUp,
  }) : isLoading = false;
  const AiChatButtonBuilder.loading({
    super.key,
    this.onLongPressStart,
    this.onLongPressUp,
  }) : isLoading = true;
  final void Function()? onLongPressUp;
  final void Function()? onLongPressStart;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final chatButton = AIChatButton(
      onLongPressStart: onLongPressStart,

      onLongPressUp: onLongPressUp,
    );
    return isLoading
        ? Stack(
          alignment: Alignment.center,
          children: [
            chatButton,
            GestureDetector(
              onLongPressStart: (_) async {
                onLongPressStart?.call();
              },
              onLongPressUp: onLongPressUp,
              child: SizedBox.fromSize(
                size: context.sizeExtenstion.chatButton,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        context.l10n.aiChatButtonTitle,
                        style: context.themeData.textTheme.bodyMedium,
                      ),
                      Text(
                        context.l10n.aiChatButtonSubTitle,
                        style: context.themeData.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
        : Stack(
          alignment: Alignment.center,
          children: [
            IgnorePointer(ignoring: true, child: chatButton),
            Material(
              color: context.themeData.colorScheme.primary.withAlpha(50),
              shape: const CircleBorder(),
              child: SizedBox.fromSize(
                size: context.sizeExtenstion.chatButton,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        context.l10n.foodInputChatButtonLoadingText1,
                        style: context.themeData.textTheme.bodyMedium,
                      ),
                      Text(
                        context.l10n.foodInputChatButtonLoadingText2,
                        style: context.themeData.textTheme.bodySmall,
                      ),
                      SizedBox(height: context.sizeExtenstion.extraSmall),
                      SizedBox(
                        width: context.sizeExtenstion.chatButton.width / 3,
                        child: LinearProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            context.themeData.colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
  }
}
