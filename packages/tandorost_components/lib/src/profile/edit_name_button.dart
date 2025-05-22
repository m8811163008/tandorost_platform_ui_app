import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class EditNameButton extends StatelessWidget {
  const EditNameButton({
    super.key,
    required this.initialValue,
    required this.submitButton,
  });
  final String initialValue;
  final Widget submitButton;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      visualDensity: VisualDensity.compact,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AppDialog(
              title: 'ChangeName',
              contents: [
                TextFormField(
                  initialValue: 'asd',
                  decoration: InputDecoration(labelText: 'data'),
                ),
              ],
              submitButton: AppTextButton(label: 'ok'),
            );
          },
        );
      },
      icon: Icon(Icons.edit),
    );
  }
}
