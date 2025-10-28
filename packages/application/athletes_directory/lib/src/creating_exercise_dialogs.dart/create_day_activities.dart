import 'package:athletes_directory/athletes_directory.dart';
import 'package:athletes_directory/src/creating_exercise_dialogs.dart/select_exercise.dart';
import 'package:athletes_directory/src/creating_exercise_dialogs.dart/video_player_widget.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:image_repository/image_repository.dart';
import 'package:tandorost_components/tandorost_components.dart';

class CreateDayActivitiesRoute extends StatelessWidget {
  const CreateDayActivitiesRoute({super.key, required this.athleteDayIndex});
  final int athleteDayIndex;
  void _showExerciseDetail(
    BuildContext context,
    ExerciseDefinition exerciseDefinition,
  ) {
    final baseUri = ImageRepository.baseUriWithPath;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (exerciseDefinition.coverImageUrl != null)
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,

                    child: CarouselView(
                      itemExtent: MediaQuery.of(context).size.width,
                      children: exerciseDefinition.coverImageUrl!
                          .map(
                            (e) => Center(
                              child: Image.network(
                                '$baseUri/$e',
                                height: 180,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                const SizedBox(height: 12),
                Text(
                  exerciseDefinition.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                if (exerciseDefinition.videoUrls != null &&
                    exerciseDefinition.videoUrls!.isNotEmpty)
                  TextButton.icon(
                    icon: const Icon(Icons.play_circle),
                    label: Text(
                      context.l10n.exerciseDefenitionListTileWatchVideo,
                    ),
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (ctx) {
                          return Dialog(
                            insetPadding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  child: CarouselView(
                                    itemExtent: MediaQuery.of(
                                      context,
                                    ).size.width,
                                    children: exerciseDefinition.videoUrls!
                                        .map(
                                          (e) => AspectRatio(
                                            aspectRatio: 16 / 9,
                                            child: VideoPlayerWidget(
                                              videoUrl: Uri.parse(
                                                '$baseUri/$e',
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                                ...exerciseDefinition.videoUrls!.map(
                                  (e) => TextButton(
                                    onPressed: () async {
                                      if (!await launchUrl(
                                        Uri.parse('$baseUri/$e'),
                                      )) {
                                        if (context.mounted) {
                                          final content = context
                                              .l10n
                                              .videoPlayerWidgetHasErrorStatusLabel;
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(content: Text(content)),
                                          );
                                        }
                                      }
                                    },
                                    child: Text(
                                      context.l10n.videoPlayerWidgetViewOnline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                if (exerciseDefinition.preparationSteps.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${context.l10n.exerciseDefenitionListTilePreparationSteps}:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      ...exerciseDefinition.preparationSteps.map(
                        (step) => Text('• $step'),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                if (exerciseDefinition.executionSteps.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${context.l10n.exerciseDefenitionListTileExecutionSteps}:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      ...exerciseDefinition.executionSteps.map(
                        (step) => Text('• $step'),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                if (exerciseDefinition.keyTips.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${context.l10n.exerciseDefenitionListTileKeyTips}:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      ...exerciseDefinition.keyTips.map(
                        (tip) => Text('• $tip'),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                if (exerciseDefinition.focusAreas.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${context.l10n.exerciseDefenitionListTileFocusAreas}:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Wrap(
                        spacing: 8,
                        children: exerciseDefinition.focusAreas
                            .map(
                              (fa) => Chip(
                                label: Text(
                                  context.l10n.exerciseDefinitionFocusAreaValue(
                                    fa.name,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                Text(
                  '${context.l10n.exerciseDefenitionListTileEquipment}: ${context.l10n.traineeHistoryExerciseEquipmentValue(exerciseDefinition.equipment.name)}',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AthelteDirectoryCubit, AthelteDirectoryState>(
      buildWhen: (previous, current) =>
          previous.workoutPrograms != current.workoutPrograms ||
          previous.selectedWorkout != current.selectedWorkout,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.l10n.createDayActivitiesRouteTitle),
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
                  final athleteDay =
                      state.selectedWorkout!.days[athleteDayIndex]!;

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
                    state.selectedWorkout!.days,
                  );

                  newDays[athleteDayIndex] =
                      newAthleteDay; // Replace the old day with the new day

                  // 6. Create a NEW WorkoutProgram with the new list of days
                  // (Assuming WorkoutProgram has a copyWith method)
                  final newWorkout = state.selectedWorkout!.copyWith(
                    days: newDays,
                  );

                  // 7. Dispatch the change via the BLoC/Cubit method
                  cubit.onUpdateWorkoutProgram(newWorkout);
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
          body: BlocBuilder<AthelteDirectoryCubit, AthelteDirectoryState>(
            buildWhen: (previous, current) =>
                previous.workoutPrograms != current.workoutPrograms ||
                previous.selectedWorkout != current.selectedWorkout,
            builder: (context, state) {
              if (state.workoutPrograms.isEmpty) {
                return SizedBox();
              }
              return ReorderableListView(
                onReorder: (int oldIndex, int newIndex) {
                  final List<PrescribedExercise> activities = List.from(
                    state.selectedWorkout!.days[athleteDayIndex]!.activities!,
                  );
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final PrescribedExercise item = activities.removeAt(oldIndex);
                  activities.insert(newIndex, item);
                  final List<AthleteDay?> days = List.from(
                    state.selectedWorkout!.days,
                  );

                  days[athleteDayIndex] = days[athleteDayIndex]!.copyWith(
                    activities: activities,
                  );
                  context.read<AthelteDirectoryCubit>().onUpdateWorkoutProgram(
                    state.selectedWorkout!.copyWith(days: days),
                  );
                },
                padding: EdgeInsets.all(context.sizeExtenstion.medium),
                header: Text(context.l10n.createDayActivitiesRouteSubtitle),
                children: state.selectedWorkout!.days[athleteDayIndex]!.activities!.asMap().entries.map((
                  entry,
                ) {
                  final i = entry.key;
                  final e = entry.value;

                  //todo add exercises in the list
                  final exercisesDefinition = <ExerciseDefinition>[];
                  for (var id in e.exerciseDefinitionId!) {
                    final exercise = state.exercisesDefinition.singleWhere(
                      (ex) => id == ex.id!,
                    );
                    exercisesDefinition.add(exercise);
                  }

                  final widgets = <Widget>[];
                  for (var exerciseDefinition in exercisesDefinition) {
                    final baseUri = ImageRepository.baseUriWithPath;
                    final coverUri = baseUri.replace(
                      path:
                          '${baseUri.path}/${exerciseDefinition.coverImageUrl?.first}',
                    );
                    final widget = Padding(
                      key: ValueKey('day-exercise-${exerciseDefinition.id}'),
                      padding: EdgeInsets.symmetric(
                        vertical: context.sizeExtenstion.small,
                      ),
                      child: ListTile(
                        title: Text(exerciseDefinition.title),
                        subtitle: Text(
                          exerciseDefinition.focusAreas
                              .map(
                                (e) => context.l10n
                                    .exerciseDefinitionFocusAreaValue(e.name),
                              )
                              .join(' | '),
                        ),
                        leading: SizedBox(
                          width: 56 * 341 / 184,
                          height: 56,
                          child: GestureDetector(
                            onTap: () => _showExerciseDetail(
                              context,
                              exerciseDefinition,
                            ),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child:
                                      exerciseDefinition.coverImageUrl != null
                                      ? Image.network(
                                          coverUri.toString(),
                                          width: 56 * 341 / 184,
                                          height: 56,
                                          fit: BoxFit.cover,
                                        )
                                      : Container(
                                          width: 56,
                                          height: 56,
                                          color: Colors.grey[300],
                                          child: const Icon(
                                            Icons.image,
                                            size: 32,
                                          ),
                                        ),
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black54,
                                      shape: BoxShape.circle,
                                    ),
                                    padding: const EdgeInsets.all(4),
                                    child: const Icon(
                                      Icons.info_outline,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.copy),
                              onPressed: () {
                                List<PrescribedExercise> activities = List.from(
                                  state
                                      .selectedWorkout!
                                      .days[athleteDayIndex]!
                                      .activities!,
                                );
                                List<AthleteDay?> days = List.from(
                                  state.selectedWorkout!.days,
                                );

                                // Create a copy of the selected activity (assuming PrescribedExercise has a copyWith or similar)
                                final copiedActivity = e.copyWith();

                                // Insert the copied activity right after the original
                                activities.insert(i + 1, copiedActivity);

                                days[athleteDayIndex] = days[athleteDayIndex]!
                                    .copyWith(activities: activities);

                                final workout = state.selectedWorkout!.copyWith(
                                  days: days,
                                );

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
                                    title: context.l10n
                                        .createDayActivitiesRouteDeleteDialogTitle(
                                          // TODO add if this is rest or exercise
                                          true.toString(),
                                        ),
                                    contents: [
                                      Text(
                                        context
                                            .l10n
                                            .createDayActivitiesRouteDeleteDialogSubtile,
                                      ),
                                    ],
                                    submitButton: TextButton(
                                      onPressed: () {
                                        List<PrescribedExercise> activities =
                                            List.from(
                                              state
                                                  .selectedWorkout!
                                                  .days[athleteDayIndex]!
                                                  .activities!,
                                            );
                                        List<AthleteDay?> days = List.from(
                                          state.selectedWorkout!.days,
                                        );
                                        activities.remove(e);
                                        days[athleteDayIndex] =
                                            days[athleteDayIndex]!.copyWith(
                                              activities: activities,
                                            );
                                        final workout = state.selectedWorkout!
                                            .copyWith(days: days);

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
                        onTap: () async {
                          assert(e.sets != null);
                          final cubit = context.read<AthelteDirectoryCubit>();
                          final List<SetPrescription?>?
                          setPrescriptions = await showDialog(
                            context: context,
                            builder: (ctx2) {
                              // If this PrescribedExercise contains multiple exercises (superset/compound set)
                              if (e.exerciseDefinitionId != null &&
                                  e.exerciseDefinitionId!.length > 1) {
                                // Find all ExerciseDefinition objects for the IDs
                                final exercises = e.exerciseDefinitionId!
                                    .map(
                                      (id) => state.exercisesDefinition
                                          .firstWhere((ex) => ex.id == id),
                                    )
                                    .toList();

                                // final initialSets = e.sets != null
                                //     ? (e.sets!.length == exercises.length
                                //           ? e.sets!
                                //           : List.generate(
                                //               exercises.length,
                                //               (i) => e.sets!.length > i
                                //                   ? e.sets![i]
                                //                   : SetPrescription(
                                //                       restAfterSetSeconds: 30,
                                //                     ),
                                //             ))
                                //     : List.generate(
                                //         exercises.length,
                                //         (i) => SetPrescription(
                                //           restAfterSetSeconds: 30,
                                //         ),
                                //       );
                                return ActivitySetting(
                                  exercises: exercises,
                                  initialSetPrescriptions: e.sets!,
                                );
                              } else {
                                // Single exercise
                                final exerciseDefinition = state
                                    .exercisesDefinition
                                    .singleWhere(
                                      (ex) =>
                                          ex.id ==
                                          e.exerciseDefinitionId!.first,
                                    );
                                return ActivitySetting(
                                  exercises: [exerciseDefinition],
                                  initialSetPrescriptions: e.sets!,
                                );
                              }
                            },
                          );
                          if (setPrescriptions == null) {
                            return;
                          }
                          var prescribedExercise = e.copyWith(
                            sets: setPrescriptions,
                          );

                          // 2. Get the current, immutable day and activities
                          final currentWorkoutProgram = state.selectedWorkout!;
                          final athleteDay =
                              currentWorkoutProgram.days[athleteDayIndex]!;

                          // 3. Create a NEW list of activities by copying the old one and adding the new element
                          // This is the CRUCIAL step to avoid mutation.
                          List<PrescribedExercise> newActivities = List.from(
                            athleteDay.activities!,
                          );
                          final startIndex = newActivities.indexOf(
                            prescribedExercise,
                          );
                          newActivities.replaceRange(
                            startIndex,
                            startIndex + 1,
                            [prescribedExercise],
                          );

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
                      ),
                    );
                    widgets.add(widget);
                  }

                  return Column(key: ValueKey('column-$i'), children: widgets);
                }).toList(),
              );
            },
          ),
        );
      },
    );
  }
}
