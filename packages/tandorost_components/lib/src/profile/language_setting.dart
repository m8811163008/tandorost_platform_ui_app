import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class LanguageSetting extends StatelessWidget {
  const LanguageSetting({super.key, required this.groupValue,this.onLanguageChanged});
  final Language groupValue;
  final ValueSetter<Language>? onLanguageChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('language', style: context.textTheme.titleMedium),
        SizedBox(width: context.sizeExtenstion.small),
        TextButton.icon(
          label: Text(Language.persian.name),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return _buildAppDialog();
              },
            );
          },
          icon: Icon(Icons.language),
        ),
      ],
    );
  }

  AppDialog _buildAppDialog() {
    return AppDialog(
      title: 'ChangeLanguage',
      contents: [
        Row(
          children: [
            Text(Language.arabic.name),
            Radio(
              value: Language.arabic,
              groupValue: Language.bengali,
              onChanged: (value) {},
            ),
          ],
        ),
      ],
      submitButton: AppTextButton(label: 'ok'),
    );
  }
}
