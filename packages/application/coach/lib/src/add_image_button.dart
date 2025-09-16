import 'dart:math';

import 'package:coach/coach.dart';
import 'package:coach/src/edit_image_screen.dart';
import 'package:domain_model/domain_model.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class AddImageButton extends StatelessWidget {
  const AddImageButton({super.key, required this.side, this.uploadDate});

  final PhotoSide side;
  final DateTime? uploadDate;

  @override
  Widget build(BuildContext context) {
    // final label = Text(context.l10n.fitnessProfileAddImageButton);
    onPressed() {
      onPress(context);
    }

    return IconButton.filledTonal(
      onPressed: onPressed,
      // label: label,
      icon: Icon(Icons.add_a_photo),
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
    final randomString = Random().nextInt(99999) + 10000;
    final fileName = '${side.name}_${randomString}_${file.name}';
    return FileDetail(
      fileName: fileName,
      bytes: file.bytes!,
      uploadDate: uploadDate,
    );
  }

  void onPress(BuildContext context) async {
    final naviagtor = Navigator.of(context);
    final result = await onPickImage(context);

    if (result == null) return;

    await naviagtor.push(
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: context.read<CoachCubit>(),
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
