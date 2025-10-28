import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class SearchBodyLayoutHint extends StatelessWidget {
  const SearchBodyLayoutHint({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.sizeExtenstion.medium),
      child: Column(
        children: [
          _buildHint(context, context.l10n.aiChatButtonTitle),
          SizedBox(height: context.sizeExtenstion.small),
          _buildHint(context, context.l10n.aiChatButtonSubTitle),
        ],
      ),
    );
  }

  Widget _buildHint(BuildContext context, String title) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        title,
        // style: context.textTheme.bodySmall!.apply(
        //   color: context.themeData.colorScheme.tertiary.withAlpha(128),
        // ),
      ),
    );
  }
}
