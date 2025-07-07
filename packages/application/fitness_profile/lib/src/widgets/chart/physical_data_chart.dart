import 'package:domain_model/domain_model.dart';
import 'package:fitness_profile_app/src/cubit/fitness_profile_cubit.dart';
import 'package:fitness_profile_app/src/widgets/chart/chart.dart';
import 'package:fitness_profile_app/src/widgets/chart/delete_data_point_dialog.dart';
import 'package:fitness_profile_app/src/widgets/fitness_insight/no_data.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class PhysicalDataChart extends StatelessWidget {
  const PhysicalDataChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FitnessProfileCubit, FitnessProfileState>(
      buildWhen:
          (previous, current) =>
              previous.userPhysicalProfile != current.userPhysicalProfile ||
              previous.readUserPhysicalProfileStatus !=
                  current.readUserPhysicalProfileStatus ||
              previous.updateUserPhysicalDataStatus !=
                  current.updateUserPhysicalDataStatus ||
              previous.deleteUserPhysicalDataPointStatus !=
                  current.deleteUserPhysicalDataPointStatus ||
              previous.selectedChartType != current.selectedChartType,
      builder: (context, state) {
        final userPhysicalProfile = state.userPhysicalProfile;
        if (userPhysicalProfile == null) {
          return AppAsyncStatusCard.notFound();
        }
        final dataPoints = state.chartDataPoints.sublist(
          state.chartDataPoints.length > 10
              ? state.chartDataPoints.length - 10
              : 0,
        );
        // handle delete single data type
        // Todo handle edit data point and delete
        if (dataPoints.isEmpty) {
          context.read<FitnessProfileCubit>().onChangeChartType(
            ChartType.weight,
          );
          return NoDataFound(title: '');
        }
        return AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppCardHeader(title: context.l10n.fitnessProfilePhysicaDataChart),
              AppLineChart(
                dataPoints: dataPoints,

                onSpotLongPreesed: (index) async {
                  if (index >= dataPoints.length) {
                    return;
                  }
                  if (dataPoints.length == 1) {
                    // prevent delete weight an height which is needed for calculating data profile
                    if (state.selectedChartType.isHeight ||
                        state.selectedChartType.isWeight) {
                      return;
                    }
                  }

                  final dataPoint = dataPoints[index];
                  await showDialog(
                    context: context,
                    builder: (_) {
                      return BlocProvider.value(
                        value: context.read<FitnessProfileCubit>(),
                        child: DeleteDataPointDialog(id: dataPoint.dataPointId),
                      );
                    },
                  );
                },
              ),
              AppLineChartInputChips(
                chartTypes: state.supportedChartTypes,
                onSelected:
                    context.read<FitnessProfileCubit>().onChangeChartType,
                selectedChartType: state.selectedChartType,
              ),
            ],
          ),
        );
      },
    );
  }
}
