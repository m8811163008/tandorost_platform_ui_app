import 'package:athletes_directory/athletes_directory.dart';
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
      context.read<AthelteDirectoryCubit>().state.selectedWorkout!.copyWith(
        days: newDays,
      ),
    );

    cancelCopy();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AthelteDirectoryCubit, AthelteDirectoryState>(
      buildWhen: (previous, current) =>
          previous.workoutPrograms != current.workoutPrograms ||
          previous.selectedWorkout != current.selectedWorkout,
      builder: (context, state) {
        if (state.workoutPrograms.isEmpty) return SizedBox();
        final daysPerWeek = 7;
        final weeksCount = (state.selectedWorkout!.days.length / daysPerWeek)
            .ceil();

        return Scaffold(
          appBar: AppBar(title: Text('روزهای هفته')),
          body: ReorderableListView(
            onReorder: (int oldIndex, int newIndex) {
              final int daysPerWeek = 7;
              final workouts = List<AthleteDay?>.from(
                state.selectedWorkout!.days,
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
                state.selectedWorkout!.copyWith(days: workouts),
              );
              setState(() {});
            },
            padding: EdgeInsets.all(context.sizeExtenstion.medium),
            header: Text(context.l10n.workoutProgramRouteHeader),
            children: [
              for (int index = 0; index < weeksCount; index++)
                Padding(
                  key: Key('$index'),
                  padding: EdgeInsets.symmetric(
                    vertical: context.sizeExtenstion.small,
                  ),
                  child: ListTile(
                    title: Text(
                      context.l10n.workoutProgramRouteWeekTileLabel(index),
                    ),
                    onTap: () {
                      if (copySourceWeekIndex != null &&
                          copySourceWeekIndex != index) {
                        performCopy(index, state.selectedWorkout!.days);
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text('کپی شد')));
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (context) => SelectAthelteDayRoute(
                              startDayIndex: index * daysPerWeek,
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

class SelectAthelteDayRoute extends StatefulWidget {
  const SelectAthelteDayRoute({super.key, required this.startDayIndex});
  final int startDayIndex;

  @override
  State<SelectAthelteDayRoute> createState() => _SelectAthelteDayRouteState();
}

class _SelectAthelteDayRouteState extends State<SelectAthelteDayRoute> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AthelteDirectoryCubit, AthelteDirectoryState>(
      buildWhen: (previous, current) =>
          previous.workoutPrograms != current.workoutPrograms ||
          previous.selectedWorkout != current.selectedWorkout,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.l10n.selectAthelteDayRouteTitle),
            actions: [
              IconButton(
                onPressed: () {
                  final athleteDay = AthleteDay(
                    isRestDay: false,
                    activities: [],
                  );
                  WorkoutProgram workout = state.selectedWorkout!.copyWith(
                    days: List.from(state.selectedWorkout!.days),
                  );
                  final thisWeekWorkouts = workout.days.sublist(
                    widget.startDayIndex,
                    widget.startDayIndex + 7,
                  );
                  if (thisWeekWorkouts.where((e) => e != null).length == 7) {
                    return;
                  }
                  int firstNotNullIndex = thisWeekWorkouts.indexWhere(
                    (e) => e == null,
                  );

                  workout.days[widget.startDayIndex + firstNotNullIndex] =
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
                  WorkoutProgram workout = state.selectedWorkout!.copyWith(
                    days: List.from(state.selectedWorkout!.days),
                  );
                  final thisWeekWorkouts = workout.days.sublist(
                    widget.startDayIndex,
                    widget.startDayIndex + 7,
                  );
                  if (thisWeekWorkouts.where((e) => e != null).length == 7) {
                    return;
                  }
                  int firstNotNullIndex = thisWeekWorkouts.indexWhere(
                    (e) => e == null,
                  );

                  workout.days[widget.startDayIndex + firstNotNullIndex] =
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
                previous.workoutPrograms != current.workoutPrograms ||
                previous.selectedWorkout != current.selectedWorkout,
            builder: (context, state) {
              return ReorderableListView(
                onReorder: (int oldIndex, int newIndex) {
                  oldIndex = oldIndex + widget.startDayIndex;
                  newIndex = newIndex + widget.startDayIndex;
                  final List<AthleteDay?> workouts = List.from(
                    state.selectedWorkout!.days,
                  );
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final AthleteDay? item = workouts.removeAt(oldIndex);
                  workouts.insert(newIndex, item);
                  context.read<AthelteDirectoryCubit>().onUpdateWorkoutProgram(
                    state.selectedWorkout!.copyWith(days: workouts),
                  );
                  setState(() {});
                },
                padding: EdgeInsets.all(context.sizeExtenstion.medium),
                header: Text(context.l10n.selectAthelteDayRouteSubTitle),
                children: state.selectedWorkout!.days
                    .sublist(widget.startDayIndex, widget.startDayIndex + 7)
                    .asMap()
                    .entries
                    .map((entry) {
                      final i = entry.key;
                      final e = entry.value;
                      if (e == null) {
                        return Padding(
                          key: ValueKey('null-$i'),
                          padding: EdgeInsets.symmetric(
                            vertical: context.sizeExtenstion.small,
                          ),
                          child: ListTile(
                            title: Text(
                              context.l10n.selectAthelteDayRouteEmptyDay,
                            ),
                            leading: Icon(Icons.reorder),
                            tileColor: context
                                .themeData
                                .colorScheme
                                .surfaceContainerLow,
                          ),
                        );
                      }
                      return Padding(
                        key: ValueKey('day-${widget.startDayIndex + i}'),
                        padding: EdgeInsets.symmetric(
                          vertical: context.sizeExtenstion.small,
                        ),
                        child: ListTile(
                          title: Text(
                            e.isRestDay
                                ? context.l10n.selectAthelteDayRouteIsRestDay
                                : context
                                      .l10n
                                      .selectAthelteDayRouteIsExerciseDay,
                          ),
                          leading: Icon(Icons.reorder),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (context) => CreateDayActivitiesRoute(
                                  athleteDayIndex: widget.startDayIndex + i,
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
                                      .selectedWorkout!
                                      .days[widget.startDayIndex + i];
                                  final firstNullIndexInCurrentWeek =
                                      state.selectedWorkout!.days
                                          .sublist(
                                            widget.startDayIndex,
                                            widget.startDayIndex + 7,
                                          )
                                          .indexWhere(
                                            (athleteDay) => athleteDay == null,
                                          ) +
                                      widget.startDayIndex;
                                  if (firstNullIndexInCurrentWeek == -1) return;
                                  final days = List<AthleteDay?>.from(
                                    state.selectedWorkout!.days,
                                  );
                                  days[firstNullIndexInCurrentWeek] = copiedDay;

                                  final workout = state.selectedWorkout!
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
                                      title: context
                                          .l10n
                                          .selectAthelteDayRouteDeleteDialogTitle,
                                      contents: [
                                        Text(
                                          context
                                              .l10n
                                              .selectAthelteDayRouteDeleteDialogSubtile,
                                        ),
                                      ],
                                      submitButton: TextButton(
                                        onPressed: () {
                                          final workout = state.selectedWorkout!
                                              .copyWith(
                                                days:
                                                    List<AthleteDay?>.from(
                                                        state
                                                            .selectedWorkout!
                                                            .days,
                                                      )
                                                      ..[widget.startDayIndex +
                                                              i] =
                                                          null,
                                              );

                                          context
                                              .read<AthelteDirectoryCubit>()
                                              .onUpdateWorkoutProgram(workout);
                                          Navigator.of(ctx2).pop();
                                        },
                                        child: Text(context.l10n.delete),
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
