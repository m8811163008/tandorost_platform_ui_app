import 'package:domain_model/domain_model.dart';
import 'package:fitness_profile_app/src/cubit/fitness_profile_cubit.dart';
import 'package:fitness_profile_app/src/widgets/gallary/image_editor.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class EditImageScreen extends StatelessWidget {
  const EditImageScreen({super.key, required this.pickedFile});
  final FileDetail pickedFile;

  @override
  Widget build(BuildContext context) {
    return BlocListener<FitnessProfileCubit, FitnessProfileState>(
      listenWhen: (previous, current) =>
          previous.addUserImageStatus != current.addUserImageStatus,
      listener: (context, state) {
        if (state.addUserImageStatus.isConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.addUserImageStatus.isConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        }
      },
      child: Center(
        child: SizedBox.fromSize(
          size: MediaQuery.of(context).size,
          child: ImageEditor(
            bytes: pickedFile.bytes,
            onComplete: (editedBytes) {
              context.read<FitnessProfileCubit>().onEditImageComplete(
                editedBytes,
                pickedFile.fileName,
                pickedFile.uploadDate,
              );
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}
