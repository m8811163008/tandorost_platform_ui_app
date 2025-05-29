import 'package:fitness_profile_app/src/cubit/fitness_profile_cubit.dart';
import 'package:fitness_profile_app/src/widgets/chart/chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tandorost_components/tandorost_components.dart';

class PhysicalDataChart extends StatelessWidget {
  const PhysicalDataChart({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: BlocBuilder<FitnessProfileCubit, FitnessProfileState>(
        builder: (context, state) {
          final userPhysicalProfile = state.userPhysicalProfile;
          if (userPhysicalProfile == null) {
            return AppAsyncStatusCard.notFound();
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppCardHeader(title: context.l10n.fitnessProfilePhysicaDataChart),
              AppLineChart(
                dataPoints: state.chartDataPoints.sublist(
                  userPhysicalProfile.weight.length > 10
                      ? userPhysicalProfile.weight.length - 10
                      : 0,
                ),
              ),
              AppLineChartInputChips(
                chartTypes: state.supportedChartTypes,
                onSelected:
                    context.read<FitnessProfileCubit>().onChangeChartType,
                selectedChartType: state.selectedChartType,
              ),
            ],
          );
        },
      ),
    );
  }
}
