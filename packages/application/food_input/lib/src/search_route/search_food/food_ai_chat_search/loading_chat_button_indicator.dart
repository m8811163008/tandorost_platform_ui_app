import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class LoadingChatButtonIndicator extends StatelessWidget {
  const LoadingChatButtonIndicator({super.key, required this.chatButton});
  final Widget chatButton;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
