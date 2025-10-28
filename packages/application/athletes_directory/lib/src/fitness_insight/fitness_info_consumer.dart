import 'package:athletes_directory/athletes_directory.dart';
import 'package:athletes_directory/src/fitness_insight/fitness_insight.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class FitnessInfoConsumer extends StatelessWidget {
  const FitnessInfoConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AthelteDirectoryCubit, AthelteDirectoryState>(
      buildWhen: (previous, current) =>
          previous.readFitnessDataStatus != current.readFitnessDataStatus ||
          previous.fitnessData != current.fitnessData,
      builder: (context, state) => switch (state.readFitnessDataStatus) {
        AsyncProcessingStatus.inital => AppAsyncStatusCard.inital(),
        AsyncProcessingStatus.loading =>
          state.fitnessData == null
              ? AppAsyncStatusCard.loading()
              : FitnessInfo(fitnessData: state.fitnessData!),
        AsyncProcessingStatus.connectionError =>
          AppAsyncStatusCard.serverError(),
        AsyncProcessingStatus.internetConnectionError =>
          AppAsyncStatusCard.internetConnectionError(),
        AsyncProcessingStatus.success =>
          state.fitnessData == null
              ? NoDataFound(title: context.l10n.fitnessProfilePhysicalDataLabel)
              : FitnessInfo(fitnessData: state.fitnessData!),
      },
    );
  }
}
