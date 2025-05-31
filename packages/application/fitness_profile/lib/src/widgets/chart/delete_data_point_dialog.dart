import 'package:fitness_profile_app/src/cubit/fitness_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class DeleteDataPointDialog extends StatelessWidget {
  const DeleteDataPointDialog({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: context.l10n.fitnessProfileDeleteDataPointDialogLabel,
      contents: [
        Text(context.l10n.fitnessProfileDeleteDataPointDialogDescription),
      ],
      submitButton: BlocConsumer<FitnessProfileCubit, FitnessProfileState>(
        listenWhen:
            (previous, current) =>
                previous.deleteUserPhysicalDataPointStatus !=
                current.deleteUserPhysicalDataPointStatus,
        listener: (context, state) {
          if (state.deleteUserPhysicalDataPointStatus.isServerConnectionError) {
            final content = context.l10n.networkError;
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(content)));
          } else if (state
              .deleteUserPhysicalDataPointStatus
              .isServerConnectionError) {
            final content = context.l10n.internetConnectionError;
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(content)));
          } else if (state.deleteUserPhysicalDataPointStatus.isSuccess) {
            Navigator.of(context).pop();
            context.read<FitnessProfileCubit>().readFitnessData();
            context.read<FitnessProfileCubit>().readUserPhysicalProfile();
          }
        },
        buildWhen:
            (previous, current) =>
                previous.deleteUserPhysicalDataPointStatus !=
                current.deleteUserPhysicalDataPointStatus,
        builder: (context, state) {
          return state.deleteUserPhysicalDataPointStatus.isLoading
              ? AppTextButton.loading(label: context.l10n.delete)
              : AppTextButton(
                label: context.l10n.delete,
                onTap: () {
                  context.read<FitnessProfileCubit>().onDeleteDataPoint(id);
                },
              );
        },
      ),
    );
  }
}
