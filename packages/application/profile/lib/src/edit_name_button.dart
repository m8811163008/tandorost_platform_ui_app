import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_app/src/cubit/profile_cubit.dart';
import 'package:tandorost_components/tandorost_components.dart';

class EditNameButton extends StatelessWidget {
  const EditNameButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      visualDensity: VisualDensity.compact,
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) {
            return BlocProvider.value(
              value: context.read<ProfileCubit>(),

              child: EditNameDialog(),
            );
          },
        );
      },
      icon: Icon(Icons.edit),
    );
  }
}

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
        title: 'ChangeName',
        contents: [
          TextFormField(
            initialValue: cubit.state.name,
            decoration: InputDecoration(labelText: 'name'),
            onChanged: cubit.onChangeName,
          ),
        ],
        submitButton: BlocBuilder<ProfileCubit, ProfileState>(
          buildWhen:
              (previous, current) =>
                  previous.updatingProfileStatus !=
                  current.updatingProfileStatus,
          builder: (context, state) {
            return state.updatingProfileStatus.isLoading
                ? AppTextButton.loading(label: 'update name')
                : AppTextButton(
                  label: 'update name',
                  onTap: context.read<ProfileCubit>().updateName,
                );
          },
        ),
      ),
    );
  }
}
