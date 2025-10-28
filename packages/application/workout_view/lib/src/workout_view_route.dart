import 'package:domain_model/domain_model.dart';

import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';
import 'package:workout_view/src/cubit/workout_view_cubit.dart';
import 'package:workout_view/src/enrollments_list.dart';

class WorkoutViewRoute extends StatelessWidget {
  const WorkoutViewRoute({
    super.key,
    this.onBottomNavigationChanged,
    required this.bottomNavigationIndex,
    this.onDrawerNavigationChanged,
    required this.drawerNavigationIndex,
    this.goToAthleteDetailRoute,
    this.onNavigateToFitnessProfileAfterWorkout,
  });
  final ValueChanged<int>? onBottomNavigationChanged;
  final int bottomNavigationIndex;
  final ValueChanged<int>? onDrawerNavigationChanged;
  final int drawerNavigationIndex;
  final VoidCallback? goToAthleteDetailRoute;
  final VoidCallback? onNavigateToFitnessProfileAfterWorkout;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.appRoutesName(RoutesNames.athleteWorkoutView.name),
        ),
      ),
      body: WorkoutViewRouteListener(
        onNavigateToFitnessProfileAfterWorkout:
            onNavigateToFitnessProfileAfterWorkout,
      ),
      drawer: NavigationDrawer(
        onDestinationSelected: onDrawerNavigationChanged,
        selectedIndex: drawerNavigationIndex,
        children: AppNavigation.getDrawerChildren(context),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onBottomNavigationChanged,
        currentIndex: bottomNavigationIndex,
        items: AppNavigation.bottomNavigationItems(context),
      ),
    );
  }
}

class WorkoutViewRouteListener extends StatelessWidget {
  const WorkoutViewRouteListener({
    super.key,
    this.onNavigateToFitnessProfileAfterWorkout,
  });
  final VoidCallback? onNavigateToFitnessProfileAfterWorkout;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<WorkoutViewCubit, WorkoutViewState>(
          listenWhen: (previous, current) =>
              previous.onReadAthelteProfileStatus !=
              current.onReadAthelteProfileStatus,
          listener: (context, state) {
            if (state.onReadAthelteProfileStatus.isConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state.onReadAthelteProfileStatus.isConnectionError) {
              final content = context.l10n.internetConnectionError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state.onReadAthelteProfileStatus.isSuccess) {
              final cubit = context.read<WorkoutViewCubit>();
              cubit.onReadAthleteEnrollments();
              cubit.onReadTraineeHistories();
            }
          },
        ),
        BlocListener<WorkoutViewCubit, WorkoutViewState>(
          listenWhen: (previous, current) =>
              previous.onReadAthleteEnrollmentsStatus !=
              current.onReadAthleteEnrollmentsStatus,
          listener: (context, state) {
            if (state.onReadAthleteEnrollmentsStatus.isConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state.onReadAthleteEnrollmentsStatus.isConnectionError) {
              final content = context.l10n.internetConnectionError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state.onReadAthleteEnrollmentsStatus.isSuccess) {
              context.read<WorkoutViewCubit>().onReadWorkoutProgram();
              context.read<WorkoutViewCubit>().onReadCoaches();
            }
          },
        ),
        BlocListener<WorkoutViewCubit, WorkoutViewState>(
          listenWhen: (previous, current) =>
              previous.onReadWorkoutProgramStatus !=
              current.onReadWorkoutProgramStatus,
          listener: (context, state) {
            if (state.onReadWorkoutProgramStatus.isConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state.onReadWorkoutProgramStatus.isConnectionError) {
              final content = context.l10n.internetConnectionError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            }
          },
        ),
      ],
      child: EnrollmentsList(
        onNavigateToFitnessProfileAfterWorkout:
            onNavigateToFitnessProfileAfterWorkout,
      ),
    );
  }
}
