import 'package:domain_model/domain_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fitness_profile_app/src/cubit/fitness_profile_cubit.dart';
import 'package:fitness_profile_app/src/widgets/gallary/gallary.dart';
import 'package:fitness_profile_app/src/widgets/gallary/image_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tandorost_components/tandorost_components.dart';

class AddImageButton extends StatelessWidget {
  const AddImageButton({super.key}) : isFilled = false;
  const AddImageButton.filled({super.key}) : isFilled = true;
  final bool isFilled;

  @override
  Widget build(BuildContext context) {
    final label = Text(context.l10n.fitnessProfileAddImageButton);
    final onPressed = () {
      onPress(context);
    };

    return isFilled
        ? ElevatedButton(onPressed: onPressed, child: label)
        : TextButton.icon(
          onPressed: onPressed,
          label: label,
          icon: Icon(Icons.image),
        );
  }

  Future<FileDetail?> onPickImage(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg', 'jpeg'],
      withData: true,
    );
    if (result == null || result.files.isEmpty) return null;

    final file = result.files.single;
    if (file.bytes == null) return null;

    return FileDetail(fileName: file.name, bytes: file.bytes!);
  }

  void onPress(BuildContext context) async {
    final naviagtor = Navigator.of(context);
    final result = await onPickImage(context);

    if (result == null) return;

    await naviagtor.push(
      MaterialPageRoute(
        builder:
            (_) => BlocProvider.value(
              value: context.read<FitnessProfileCubit>(),
              child: AppScaffold(
                // appBar: AppBar(title: Text('Edit Image')),
                body: EditImageScreen(pickedFile: result),
              ),
            ),
        fullscreenDialog: true,
      ),
    );
  }
}
