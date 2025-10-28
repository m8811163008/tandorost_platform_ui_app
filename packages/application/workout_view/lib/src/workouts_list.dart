import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:image_repository/image_repository.dart';
import 'package:tandorost_components/tandorost_components.dart';
import 'package:workout_view/src/video_player_widget.dart';
import 'package:workout_view/src/workout_screen/screen_controller.dart';
import 'package:workout_view/workout_view.dart';

class WorkoutsList extends StatelessWidget {
  const WorkoutsList({
    super.key,
    this.onNavigateToFitnessProfileAfterWorkout,
    required this.workoutProgramId,
    required this.selectedAthleteDay,
  });
  final String workoutProgramId;
  final AthleteDay selectedAthleteDay;
  final VoidCallback? onNavigateToFitnessProfileAfterWorkout;

  @override
  Widget build(BuildContext context) {
    final state = context.read<WorkoutViewCubit>().state;
    final workoutProgram = state.workoutProgram.singleWhere(
      (e) => e.id! == workoutProgramId,
    );
    final prescribedExercises = workoutProgram.days
        .where((e) => e == selectedAthleteDay)
        .first!
        .activities;

    assert(prescribedExercises != null);

    final exerciseDefinitions = state.exercisesDefinition;

    return AppScaffold(
      appBar: AppBar(title: Text(context.l10n.workoutsListRouteTitle)),
      body: Padding(
        padding: EdgeInsets.all(context.sizeExtenstion.medium),
        child: ListView.builder(
          itemCount: prescribedExercises!.length,
          itemBuilder: (context, index) {
            final prescribedExercise = prescribedExercises[index];
            final prescribedExercisesDefinition = exerciseDefinitions.where(
              (element) => prescribedExercise.exerciseDefinitionId!.contains(
                element.id!,
              ),
            );

            return Column(
              children: prescribedExercisesDefinition.map((e) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(e.title),
                    tileColor: prescribedExercisesDefinition.length == 1
                        ? null
                        : context.themeData.colorScheme.surfaceContainerHigh,

                    subtitle: Text(
                      e.focusAreas
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
                        onTap: () => _showExerciseDetail(context, e),
                        child: WorkoutLeadingListTile(exerciseDefinition: e),
                      ),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          if (prescribedExercise.sets == null) {
                            return SizedBox();
                          } else {
                            return SetPtescribedDialog(
                              setPrescription: prescribedExercise.sets!,
                            );
                          }
                        },
                      );
                    },
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
      fab: FloatingActionButton.extended(
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return WorkoutScreenCotroller(
                  prescribedExercises: prescribedExercises,
                  selectedAthleteDay: selectedAthleteDay,
                  workoutId: workoutProgramId,
                  onNavigateToFitnessProfileAfterWorkout:
                      onNavigateToFitnessProfileAfterWorkout,
                );
              },
            ),
          );
        },
        label: Text(context.l10n.workoutsListFABTitle),
        icon: Icon(Icons.start),
      ),
    );
  }

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
}

extension SetPrescriptionX on SetPrescription {
  ExerciseMetricType get type {
    if (percent1rm != null) {
      return ExerciseMetricType.percent1rmAndReps;
    } else if (repetitions != null) {
      return ExerciseMetricType.repsOnly;
    } else if (durationSeconds != null) {
      return ExerciseMetricType.timeBased;
    } else {
      //BUG User can delete all sets in sets prescription screen and we have error here
      throw Exception('Some parameters of SetPrescription is null');
    }
  }
}

class SetPtescribedDialog extends StatelessWidget {
  const SetPtescribedDialog({super.key, this.setPrescription = const []});
  final List<SetPrescription?> setPrescription;

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: context.l10n.setPtescribedDialogTitle,
      contents: setPrescription
          .where((e) => e != null)
          .cast<SetPrescription>()
          .map((e) {
            late Text title;
            Text subtitle = Text(
              context.l10n.setPtescribedDialogRestAfterExerciseLabel(
                e.restAfterSetSeconds,
              ),
            );
            switch (e.type) {
              case ExerciseMetricType.repsOnly:
                title = Text(
                  context.l10n.setPtescribedDialogRepsOnlyLabel(e.repetitions!),
                );

              case ExerciseMetricType.percent1rmAndReps:
                title = Text(
                  context.l10n.setPtescribedDialogPercent1rmAndRepsLabel(
                    e.repetitions!,
                    e.percent1rm! / 100,
                  ),
                );

              case ExerciseMetricType.timeBased:
                title = Text(
                  context.l10n.setPtescribedDialogTimeBasedLabel(
                    e.durationSeconds!,
                  ),
                );
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(title: title, subtitle: subtitle),
            );
          })
          .toList(),
    );
  }
}

class WorkoutLeadingListTile extends StatelessWidget {
  const WorkoutLeadingListTile({super.key, required this.exerciseDefinition});

  final ExerciseDefinition exerciseDefinition;

  @override
  Widget build(BuildContext context) {
    final baseUri = ImageRepository.baseUriWithPath;
    final coverUri = baseUri.replace(
      path: '${baseUri.path}/${exerciseDefinition.coverImageUrl?.first}',
    );
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child:
              exerciseDefinition.coverImageUrl != null ||
                  exerciseDefinition.coverImageUrl!.isNotEmpty
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
                  child: const Icon(Icons.image, size: 32),
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
    );
  }
}
