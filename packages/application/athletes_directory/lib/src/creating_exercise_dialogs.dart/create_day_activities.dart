import 'package:athletes_directory/athletes_directory.dart';
import 'package:athletes_directory/src/creating_exercise_dialogs.dart/select_exercise.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class CreateDayActivitiesRoute extends StatelessWidget {
  const CreateDayActivitiesRoute({super.key, required this.athleteDayIndex});
  final int athleteDayIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AthelteDirectoryCubit, AthelteDirectoryState>(
      buildWhen: (previous, current) =>
          previous.workoutProgram != current.workoutProgram,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('select exercise or rest'),
            actions: [
              IconButton(
                onPressed: () async {
                  final cubit = context.read<AthelteDirectoryCubit>();

                  final PrescribedExercise? prescribedExercise =
                      await showDialog(
                        context: context,
                        builder: (_) {
                          return BlocProvider.value(
                            value: context.read<AthelteDirectoryCubit>(),
                            child: SelectExercise(),
                          );
                        },
                      );
                  if (prescribedExercise == null) {
                    return;
                  }

                  // 2. Get the current, immutable day and activities
                  final currentWorkoutProgram = state.workoutProgram!;
                  final athleteDay =
                      currentWorkoutProgram.days[athleteDayIndex]!;

                  // 3. Create a NEW list of activities by copying the old one and adding the new element
                  // This is the CRUCIAL step to avoid mutation.
                  List<PrescribedExercise> newActivities = List.from(
                    athleteDay.activities!,
                  )..add(prescribedExercise);

                  // 4. Create a NEW WorkoutDay with the new activities list
                  // (Assuming WorkoutDay has a copyWith method)
                  final newAthleteDay = athleteDay.copyWith(
                    activities: newActivities,
                  );

                  // 5. Create a NEW list of days. You must use List.from or a spread operator
                  // to copy the original list, then replace the specific day.
                  List<AthleteDay?> newDays = List.from(
                    currentWorkoutProgram.days,
                  );

                  newDays[athleteDayIndex] =
                      newAthleteDay; // Replace the old day with the new day

                  // 6. Create a NEW WorkoutProgram with the new list of days
                  // (Assuming WorkoutProgram has a copyWith method)
                  final newWorkout = currentWorkoutProgram.copyWith(
                    days: newDays,
                  );

                  // 7. Dispatch the change via the BLoC/Cubit method
                  cubit.onUpdateWorkoutProgram(newWorkout);
                },
                icon: Icon(Icons.add),
              ),
              IconButton(
                onPressed: () async {
                  var restActivity = PrescribedExercise(isRest: true);
                  final cubit = context.read<AthelteDirectoryCubit>();

                  // 2. Get the current, immutable day and activities
                  final currentWorkoutProgram = state.workoutProgram!;
                  final athleteDay =
                      currentWorkoutProgram.days[athleteDayIndex]!;

                  await showDialog(
                    context: context,
                    builder: (ctx2) {
                      return AppDialog(
                        title: 'add rest',
                        contents: [
                          NumberTextField(
                            label: 'rest time',
                            onChange: (value) {
                              if (value.isNotEmpty) {
                                restActivity = restActivity.copyWith(
                                  restPeriod: () => int.tryParse(value),
                                );
                              }
                            },
                          ),
                        ],
                        submitButton: TextButton(
                          onPressed: () {
                            Navigator.of(ctx2).pop();

                            // 3. Create a NEW list of activities by copying the old one and adding the new element
                            // This is the CRUCIAL step to avoid mutation.
                            List<PrescribedExercise> newActivities = List.from(
                              athleteDay.activities!,
                            )..add(restActivity);

                            // 4. Create a NEW WorkoutDay with the new activities list
                            // (Assuming WorkoutDay has a copyWith method)
                            final newAthleteDay = athleteDay.copyWith(
                              activities: newActivities,
                            );

                            // 5. Create a NEW list of days. You must use List.from or a spread operator
                            // to copy the original list, then replace the specific day.
                            List<AthleteDay?> newDays = List.from(
                              currentWorkoutProgram.days,
                            );
                            newDays[athleteDayIndex] =
                                newAthleteDay; // Replace the old day with the new day

                            // 6. Create a NEW WorkoutProgram with the new list of days
                            // (Assuming WorkoutProgram has a copyWith method)
                            final newWorkout = currentWorkoutProgram.copyWith(
                              days: newDays,
                            );
                            // 7. Dispatch the change via the BLoC/Cubit method
                            cubit.onUpdateWorkoutProgram(newWorkout);
                          },
                          child: Text('data'),
                        ),
                      );
                    },
                  );
                },
                icon: Icon(Icons.home),
              ),
            ],
          ),
          body: BlocBuilder<AthelteDirectoryCubit, AthelteDirectoryState>(
            buildWhen: (previous, current) =>
                previous.workoutProgram != current.workoutProgram,
            builder: (context, state) {
              if (state.workoutProgram == null) {
                return SizedBox();
              }
              return ReorderableListView(
                onReorder: (int oldIndex, int newIndex) {
                  final List<PrescribedExercise> activities = List.from(
                    state.workoutProgram!.days[athleteDayIndex]!.activities!,
                  );
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final PrescribedExercise item = activities.removeAt(oldIndex);
                  activities.insert(newIndex, item);
                  final List<AthleteDay?> days = List.from(
                    state.workoutProgram!.days,
                  );

                  days[athleteDayIndex] = days[athleteDayIndex]!.copyWith(
                    activities: activities,
                  );
                  context.read<AthelteDirectoryCubit>().onUpdateWorkoutProgram(
                    state.workoutProgram!.copyWith(days: days),
                  );
                },
                padding: EdgeInsets.all(context.sizeExtenstion.medium),
                header: Text('add 7 days'),
                children: state
                    .workoutProgram!
                    .days[athleteDayIndex]!
                    .activities!
                    .asMap()
                    .entries
                    .map((entry) {
                      final i = entry.key;
                      final e = entry.value;
                      return Padding(
                        key: ValueKey('day-${i}'),
                        padding: EdgeInsets.symmetric(
                          vertical: context.sizeExtenstion.small,
                        ),
                        child: ListTile(
                          title: Text('${e.isRest}'),
                          leading: Icon(Icons.reorder),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.copy),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (ctx2) => AppDialog(
                                      title: 'Delete Rest',
                                      contents: [
                                        Text(
                                          'Are you sure you want to delete this Rest?',
                                        ),
                                      ],
                                      submitButton: TextButton(
                                        onPressed: () {
                                          List<PrescribedExercise> activities =
                                              List.from(
                                                state
                                                    .workoutProgram!
                                                    .days[athleteDayIndex]!
                                                    .activities!,
                                              );
                                          List<AthleteDay?> days = List.from(
                                            state.workoutProgram!.days,
                                          );
                                          activities.remove(e);
                                          days[athleteDayIndex] =
                                              days[athleteDayIndex]!.copyWith(
                                                activities: activities,
                                              );
                                          final workout = state.workoutProgram!
                                              .copyWith(days: days);

                                          context
                                              .read<AthelteDirectoryCubit>()
                                              .onUpdateWorkoutProgram(workout);

                                          Navigator.of(ctx2).pop();
                                        },
                                        child: Text('Delete'),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                      );
                    })
                    .toList(),
              );
            },
          ),
        );
      },
    );
  }
}
