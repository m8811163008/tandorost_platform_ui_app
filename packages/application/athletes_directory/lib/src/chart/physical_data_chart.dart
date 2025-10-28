import 'package:athletes_directory/athletes_directory.dart';
import 'package:athletes_directory/src/chart/chart.dart';
import 'package:athletes_directory/src/fitness_insight/fitness_insight.dart';
import 'package:domain_model/domain_model.dart';

import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class PhysicalDataChart extends StatelessWidget {
  const PhysicalDataChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AthelteDirectoryCubit, AthelteDirectoryState>(
      buildWhen: (previous, current) =>
          previous.userPhysicalProfile != current.userPhysicalProfile ||
          previous.readUserPhysicalProfileStatus !=
              current.readUserPhysicalProfileStatus ||
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
          context.read<AthelteDirectoryCubit>().onChangeChartType(
            ChartType.weight,
          );
          return NoDataFound(title: '');
        }
        return AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppCardHeader(
                title: context.l10n.fitnessInfoAthletePhysicaDataChart,
              ),
              AppLineChart(dataPoints: dataPoints),
              AppLineChartInputChips(
                chartTypes: state.supportedChartTypes,
                onSelected: context
                    .read<AthelteDirectoryCubit>()
                    .onChangeChartType,
                selectedChartType: state.selectedChartType,
              ),
            ],
          ),
        );
      },
    );
  }
}
