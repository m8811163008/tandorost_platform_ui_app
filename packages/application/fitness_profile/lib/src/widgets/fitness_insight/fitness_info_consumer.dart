import 'package:domain_model/domain_model.dart';
import 'package:fitness_profile_app/src/cubit/fitness_profile_cubit.dart';
import 'package:fitness_profile_app/src/widgets/fitness_insight/fitness_info.dart';
import 'package:fitness_profile_app/src/widgets/fitness_insight/fitness_insight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tandorost_components/tandorost_components.dart';

class FitnessInfoConsumer extends StatelessWidget {
  const FitnessInfoConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FitnessProfileCubit, FitnessProfileState>(
      listenWhen:
          (previous, current) =>
              previous.readFitnessDataStatus != current.readFitnessDataStatus,
      listener: (context, state) {
        if (state.readUserImageGallaryStatus.isServerConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.readUserImageGallaryStatus.isServerConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        }
      },
      buildWhen:
          (previous, current) =>
              previous.readFitnessDataStatus != current.readFitnessDataStatus,
      builder:
          (context, state) => switch (state.readFitnessDataStatus) {
            AsyncProcessingStatus.inital => AppAsyncStatusCard.inital(),
            AsyncProcessingStatus.loading => AppAsyncStatusCard.loading(),
            AsyncProcessingStatus.serverConnectionError =>
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