import 'package:flutter/material.dart';
import 'package:tandorost_components/src/utility/build_context_l10n_extension.dart';
import 'package:tandorost_theme/tandorost_theme.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    required this.title,
    this.contents = const [],
    required this.submitButton,
    this.fullscreen = false,
  });
  final String title;
  final List<Widget> contents;
  final TextButton submitButton;
  final bool fullscreen;

  @override
  Widget build(BuildContext context) {
    return fullscreen
        ? Dialog.fullscreen(child: buildChild(context))
        : Dialog(child: buildChild(context));
  }

  Widget buildChild(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: context.textTheme.headlineMedium),
            SizedBox(height: 16.0),
            ...contents,
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: Navigator.of(context).pop,
                  child: Text(context.l10n.cancle),
                ),
                SizedBox(width: 8),
                submitButton,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
