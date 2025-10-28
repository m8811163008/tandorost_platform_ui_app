import 'package:athletes_directory/athletes_directory.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class EditDialog extends StatelessWidget {
  const EditDialog({super.key, required this.dialog});
  final Widget dialog;

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      visualDensity: VisualDensity.compact,
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) {
            return BlocProvider.value(
              value: context.read<AthelteDirectoryCubit>(),
              child: dialog,
            );
          },
        );
      },
      icon: Icon(Icons.edit),
    );
  }
}
