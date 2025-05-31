import 'package:flutter/material.dart';
import 'package:profile_app/src/cubit/profile_cubit.dart';
import 'package:tandorost_components/tandorost_components.dart';

class EditNameDialog extends StatelessWidget {
  const EditNameDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    return BlocListener<ProfileCubit, ProfileState>(
      listenWhen:
          (previous, current) =>
              previous.updatingProfileStatus != current.updatingProfileStatus,
      listener: (context, state) {
        if (state.updatingProfileStatus.isServerConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.updatingProfileStatus.isServerConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.updatingProfileStatus.isSuccess) {
          Navigator.of(context).pop();
        }
      },
      child: AppDialog(
        title: context.l10n.dialogTitleChangeName,
        contents: [
          TextFormField(
            initialValue: cubit.state.name,
            decoration: InputDecoration(
              labelText: context.l10n.changeNameTextFieldLabel,
            ),
            onChanged: cubit.onChangeName,
          ),
        ],
        submitButton: BlocBuilder<ProfileCubit, ProfileState>(
          buildWhen:
              (previous, current) =>
                  previous.updatingProfileStatus !=
                  current.updatingProfileStatus,
          builder: (context, state) {
            final label = context.l10n.updateButton;
            return state.updatingProfileStatus.isLoading
                ? AppTextButton.loading(label: label)
                : AppTextButton(
                  label: label,
                  onTap: context.read<ProfileCubit>().updateName,
                );
          },
        ),
      ),
    );
  }
}
