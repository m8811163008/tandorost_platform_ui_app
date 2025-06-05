import 'package:flutter/material.dart';
import 'package:tandorost_components/src/utility/build_context_l10n_extension.dart';
import 'package:tandorost_theme/tandorost_theme.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    required this.title,
    this.dialogHint,
    this.contents = const [],
    required this.submitButton,
  });
  final String title;
  final List<Widget> contents;
  final Widget submitButton;

  final Widget? dialogHint;

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(child: buildChild(context));
  }

  Widget buildChild(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title, style: context.textTheme.headlineSmall),
                      if (dialogHint != null) dialogHint!,
                    ],
                  ),
                  SizedBox(height: 16.0),
                  ...contents,
                  SizedBox(height: 16.0),
                ],
              ),
            ),
          ),

          Wrap(
            alignment: WrapAlignment.end,
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
    );
  }
}
