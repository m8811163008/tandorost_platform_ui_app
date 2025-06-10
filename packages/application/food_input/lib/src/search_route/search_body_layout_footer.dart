import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class SearchBodyLayoutFooter extends StatelessWidget {
  const SearchBodyLayoutFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHint(context, context.l10n.aiChatButtonTitle),
        _buildHint(context, context.l10n.aiChatButtonSubTitle),
      ],
    );
  }

  Widget _buildHint(BuildContext context, String title) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        context.l10n.aiChatButtonSubTitle,
        style: context.textTheme.bodySmall,
      ),
    );
  }
}
