import 'dart:math';

import 'package:athletes_directory/athletes_directory.dart';
import 'package:athletes_directory/src/athlete_detail_history.dart';
import 'package:athletes_directory/src/creating_exercise_dialogs.dart/create_day_activities.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class WorkoutProgramRoute extends StatefulWidget {
  const WorkoutProgramRoute({super.key});

  @override
  State<WorkoutProgramRoute> createState() => _WorkoutProgramRouteState();
}

class _WorkoutProgramRouteState extends State<WorkoutProgramRoute> {
  int? copySourceWeekIndex;
  void startCopy(int weekIndex) {
    setState(() {
      copySourceWeekIndex = weekIndex;
    });
  }

  void cancelCopy() {
    setState(() {
      copySourceWeekIndex = null;
    });
  }

  void performCopy(int targetWeekIndex, List<AthleteDay?> days) {
    if (copySourceWeekIndex == null) return;
    final daysPerWeek = 7;
    final sourceStart = copySourceWeekIndex! * daysPerWeek;
    final sourceEnd = sourceStart + daysPerWeek;
    final targetStart = targetWeekIndex * daysPerWeek;

    final sourceWeek = days.sublist(sourceStart, sourceEnd);

    final newDays = List<AthleteDay?>.from(days);
    for (int i = 0; i < daysPerWeek; i++) {
      newDays[targetStart + i] = sourceWeek[i] == null
          ? null
          : AthleteDay.from(sourceWeek[i]!);
    }

    context.read<AthelteDirectoryCubit>().onUpdateWorkoutProgram(
      context.read<AthelteDirectoryCubit>().state.workoutProgram!.copyWith(
        days: newDays,
      ),
    );

    cancelCopy();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AthelteDirectoryCubit, AthelteDirectoryState>(
      buildWhen: (previous, current) =>
          previous.workoutProgram != current.workoutProgram,
      builder: (context, state) {
        if (state.workoutProgram == null) return SizedBox();
        final daysPerWeek = 7;
        final weeksCount = (state.workoutProgram!.days.length / daysPerWeek)
            .ceil();

        return Scaffold(
          appBar: AppBar(title: Text('abc')),
          body: ReorderableListView(
            onReorder: (int oldIndex, int newIndex) {
              final int daysPerWeek = 7;
              final workouts = List<AthleteDay?>.from(
                state.workoutProgram!.days,
              );

              if (oldIndex < newIndex) {
                newIndex -= 1;
              }

              // Calculate start and end indices for the week blocks
              final int oldStart = oldIndex * daysPerWeek;
              final int oldEnd = oldStart + daysPerWeek;
              final int newStart = newIndex * daysPerWeek;

              // Extract the week block to move
              final weekBlock = workouts.sublist(oldStart, oldEnd);

              // Remove the old week block
              workouts.removeRange(oldStart, oldEnd);

              // Insert the week block at the new position
              workouts.insertAll(newStart, weekBlock);

              context.read<AthelteDirectoryCubit>().onUpdateWorkoutProgram(
                state.workoutProgram!.copyWith(days: workouts),
              );
            },
            padding: EdgeInsets.all(context.sizeExtenstion.medium),
            header: Text('select between weeks'),
            children: [
              for (int index = 0; index < weeksCount; index++)
                Padding(
                  key: Key('$index'),
                  padding: EdgeInsets.symmetric(
                    vertical: context.sizeExtenstion.small,
                  ),
                  child: ListTile(
                    title: Text('$index week'),
                    onTap: () {
                      if (copySourceWeekIndex != null &&
                          copySourceWeekIndex != index) {
                        performCopy(index, state.workoutProgram!.days);
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (context) => SelectAthelteDayRoute(
                              currentDayIndex: index * daysPerWeek,
                            ),
                          ),
                        );
                      }
                    },
                    leading: Icon(Icons.reorder),
                    trailing: IconButton(
                      icon: Icon(Icons.copy),
                      color: copySourceWeekIndex == index ? Colors.blue : null,
                      onPressed: () {
                        if (copySourceWeekIndex == index) {
                          cancelCopy();
                        } else {
                          startCopy(index);
                        }
                      },
                    ),
                    tileColor:
                        copySourceWeekIndex != null &&
                            copySourceWeekIndex != index
                        ? Colors.yellow.withAlpha(50)
                        : null,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class SelectAthelteDayRoute extends StatelessWidget {
  const SelectAthelteDayRoute({super.key, required this.currentDayIndex});
  final int currentDayIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AthelteDirectoryCubit, AthelteDirectoryState>(
      buildWhen: (previous, current) =>
          previous.workoutProgram != current.workoutProgram,
      builder: (context, state) {
        final workoutLength = state.workoutProgram!.days.length;

        return Scaffold(
          appBar: AppBar(
            title: Text('select days in the week plan'),
            actions: [
              IconButton(
                onPressed: () {
                  final athleteDay = AthleteDay(
                    isRestDay: false,
                    activities: [],
                  );
                  WorkoutProgram workout = state.workoutProgram!.copyWith(
                    days: List.from(state.workoutProgram!.days),
                  );
                  final thisWeekWorkouts = workout.days.sublist(
                    currentDayIndex,
                    currentDayIndex + 7,
                  );
                  if (thisWeekWorkouts.where((e) => e != null).length == 7) {
                    return;
                  }
                  int firstNotNullIndex = thisWeekWorkouts.indexWhere(
                    (e) => e == null,
                  );

                  workout.days[currentDayIndex + firstNotNullIndex] =
                      athleteDay;

                  context.read<AthelteDirectoryCubit>().onUpdateWorkoutProgram(
                    workout,
                  );
                },
                icon: Icon(Icons.add),
              ),
              IconButton(
                onPressed: () {
                  final athleteDay = AthleteDay(
                    isRestDay: true,
                    activities: [],
                  );
                  WorkoutProgram workout = state.workoutProgram!.copyWith(
                    days: List.from(state.workoutProgram!.days),
                  );
                  final thisWeekWorkouts = workout.days.sublist(
                    currentDayIndex,
                    currentDayIndex + 7,
                  );
                  if (thisWeekWorkouts.where((e) => e != null).length == 7) {
                    return;
                  }
                  int firstNotNullIndex = thisWeekWorkouts.indexWhere(
                    (e) => e == null,
                  );

                  workout.days[currentDayIndex + firstNotNullIndex] =
                      athleteDay;

                  context.read<AthelteDirectoryCubit>().onUpdateWorkoutProgram(
                    workout,
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
              return ReorderableListView(
                onReorder: (int oldIndex, int newIndex) {
                  oldIndex = oldIndex + currentDayIndex;
                  newIndex = newIndex + currentDayIndex;
                  final List<AthleteDay?> workouts = List.from(
                    state.workoutProgram!.days,
                  );
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final AthleteDay? item = workouts.removeAt(oldIndex);
                  workouts.insert(newIndex, item);
                  context.read<AthelteDirectoryCubit>().onUpdateWorkoutProgram(
                    state.workoutProgram!.copyWith(days: workouts),
                  );
                },
                padding: EdgeInsets.all(context.sizeExtenstion.medium),
                header: Text('add 7 days'),
                children: state.workoutProgram!.days
                    .sublist(currentDayIndex, currentDayIndex + 7)
                    .asMap()
                    .entries
                    .map((entry) {
                      final i = entry.key;
                      final e = entry.value;
                      if (e == null) {
                        return Center(
                          key: ValueKey('null-$i'),
                          child: Text('null'),
                        );
                      }
                      return Padding(
                        key: ValueKey('day-${currentDayIndex + i}'),
                        padding: EdgeInsets.symmetric(
                          vertical: context.sizeExtenstion.small,
                        ),
                        child: ListTile(
                          title: Text('${e.isRestDay}'),
                          leading: Icon(Icons.reorder),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (context) => CreateDayActivitiesRoute(
                                  athleteDayIndex: currentDayIndex + i,
                                ),
                              ),
                            );
                          },
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.copy),
                                onPressed: () {
                                  final copiedDay = state
                                      .workoutProgram!
                                      .days[currentDayIndex + i];
                                  final firstNullIndexInCurrentWeek =
                                      state.workoutProgram!.days
                                          .sublist(
                                            currentDayIndex,
                                            currentDayIndex + 7,
                                          )
                                          .indexWhere(
                                            (athleteDay) => athleteDay == null,
                                          ) +
                                      currentDayIndex;
                                  if (firstNullIndexInCurrentWeek == -1) return;
                                  final days = List<AthleteDay?>.from(
                                    state.workoutProgram!.days,
                                  );
                                  days[firstNullIndexInCurrentWeek] = copiedDay;

                                  final workout = state.workoutProgram!
                                      .copyWith(days: days);

                                  context
                                      .read<AthelteDirectoryCubit>()
                                      .onUpdateWorkoutProgram(workout);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (ctx2) => AppDialog(
                                      title: 'Delete Day',
                                      contents: [
                                        Text(
                                          'Are you sure you want to delete this workout day?',
                                        ),
                                      ],
                                      submitButton: TextButton(
                                        onPressed: () {
                                          final workout = state.workoutProgram!
                                              .copyWith(
                                                days: List<AthleteDay?>.from(
                                                  state.workoutProgram!.days,
                                                )..[currentDayIndex + i] = null,
                                              );

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
