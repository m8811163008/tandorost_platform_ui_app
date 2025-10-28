import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';
import 'package:workout_view/src/workouts_list.dart';
import 'package:workout_view/workout_view.dart';

class AthleteDaysList extends StatelessWidget {
  const AthleteDaysList({
    super.key,
    required this.workoutProgramId,
    this.onNavigateToFitnessProfileAfterWorkout,
  });
  final String workoutProgramId;
  final VoidCallback? onNavigateToFitnessProfileAfterWorkout;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutViewCubit, WorkoutViewState>(
      buildWhen: (prev, curr) =>
          prev.onReadWorkoutProgramStatus != curr.onReadWorkoutProgramStatus ||
          prev.onToggleIdDoneWorkoutStatus != curr.onToggleIdDoneWorkoutStatus,
      builder: (context, state) {
        return AppScaffold(
          appBar: AppBar(title: Text(context.l10n.athleteDaysListRouteTitle)),
          body: Padding(
            padding: EdgeInsets.symmetric(
              vertical: context.sizeExtenstion.medium,
              horizontal: context.sizeExtenstion.small,
            ),
            child: ListView(
              children: state.workoutProgram
                  .singleWhere((e) => e.id! == workoutProgramId)
                  .days
                  .map((athleteDay) {
                    if (athleteDay == null) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(
                            context.l10n.athleteDaysListListTileTitleNoPlan,
                          ),
                          tileColor:
                              context.themeData.colorScheme.primaryContainer,
                        ),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                          context.l10n.athleteDaysListListTileTitleWithPlan(
                            athleteDay.isRestDay.toString(),
                          ),
                        ),
                        tileColor: athleteDay.isDone
                            ? context.themeData.colorScheme.primary
                            : null,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return WorkoutsList(
                                  workoutProgramId: workoutProgramId,
                                  selectedAthleteDay: athleteDay,
                                  onNavigateToFitnessProfileAfterWorkout:
                                      onNavigateToFitnessProfileAfterWorkout,
                                );
                              },
                            ),
                          );
                        },
                      ),
                    );
                  })
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
