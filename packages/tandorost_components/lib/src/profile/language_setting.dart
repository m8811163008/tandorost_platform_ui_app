import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class LanguageSetting extends StatelessWidget {
  const LanguageSetting({
    super.key,
    required this.value,
    required this.onChangeLanguageDialog,
  });

  final Language value;

  final Widget onChangeLanguageDialog;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          context.l10n.languageSettingLabel,
          style: context.textTheme.titleMedium,
        ),
        SizedBox(width: context.sizeExtenstion.small),
        TextButton.icon(
          label: Text(value.name),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => onChangeLanguageDialog,
            );
          },
          icon: Icon(Icons.language),
        ),
      ],
    );
  }
}
