import 'dart:async';

import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:image_repository/image_repository.dart';
import 'package:tandorost_components/tandorost_components.dart';
import 'package:workout_view/src/video_player_widget.dart';
import 'package:workout_view/src/workouts_list.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({
    super.key,
    this.onResetTap,
    required this.title,
    required this.exerciseDefinition,
    this.onDoneTap,
    required this.workoutSet,
  });
  final VoidCallback? onResetTap;
  final String title;
  final ExerciseDefinition exerciseDefinition;
  final VoidCallback? onDoneTap;
  final SetPrescription workoutSet;

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  Timer? _preparationTimer;
  Timer? _timer;
  int timeLeftSecond = 3;
  @override
  void initState() {
    if (widget.workoutSet.type == ExerciseMetricType.timeBased) {
      _preparationTimer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          timeLeftSecond--;
        });
        if (timeLeftSecond == 0) {
          _preparationTimer!.cancel();
          assert(!_preparationTimer!.isActive);
          setState(() {
            timeLeftSecond = widget.workoutSet.durationSeconds!;
          });
          _timer = Timer.periodic(Duration(seconds: 1), (timer2) {
            setState(() {
              if (timeLeftSecond != 0) {
                timeLeftSecond--;
              } else {
                timer2.cancel();
              }
            });
          });
        }
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _preparationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: widget.onResetTap),
        title: Text(widget.title),
      ),
      body: Material(
        color: context.themeData.colorScheme.tertiaryContainer,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _getExerciseCover(
                widget.exerciseDefinition.coverImageUrl,
                widget.exerciseDefinition.videoUrls,
              ),
              SizedBox(height: context.sizeExtenstion.medium),
              Text(context.l10n.workoutScreenWorkoutTitle),
              SizedBox(height: context.sizeExtenstion.small),
              Center(
                child: Text(
                  widget.exerciseDefinition.title,
                  style: context.textTheme.headlineSmall,
                ),
              ),

              SizedBox(height: context.sizeExtenstion.medium),

              _getExerciseSet(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.sizeExtenstion.large,
                  ),
                  child: Center(
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: widget.onDoneTap,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: context.sizeExtenstion.medium,
                          ),
                          foregroundColor:
                              context.themeData.colorScheme.primary,
                          backgroundColor:
                              context.themeData.colorScheme.primary,
                          textStyle: context.textTheme.bodyMedium!.copyWith(
                            color: context.themeData.colorScheme.onPrimary,
                          ),
                        ),
                        child: Text(
                          context
                              .l10n
                              .workoutScreenDoneElevatedButtonExerciseTitle,
                          style: context.textTheme.bodyMedium!.copyWith(
                            color: context.themeData.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stack _getExerciseCover(List<String>? imageUrls, List<String>? videoUrl) {
    final baseUri = ImageRepository.baseUriWithPath;
    final exerciseDefinition = widget.exerciseDefinition;

    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3,
          child: CarouselView(
            itemExtent: MediaQuery.of(context).size.width,
            children: [
              if (exerciseDefinition.coverImageUrl?.isNotEmpty ?? false)
                ...imageUrls!.map((e) => Image.network('$baseUri/$e')),
              if (exerciseDefinition.videoUrls?.isNotEmpty ?? false)
                ...videoUrl!.map(
                  (e) => VideoPlayerWidget(videoUrl: Uri.parse('$baseUri/$e')),
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton.filledTonal(
            onPressed: _showExerciseDetail,
            icon: Icon(Icons.info),
          ),
        ),
      ],
    );
  }

  Widget _getExerciseSet() {
    switch (widget.exerciseDefinition.metricType) {
      case ExerciseMetricType.repsOnly:
        return Text(
          'X ${widget.workoutSet.repetitions!}',
          style: context.textTheme.displaySmall,
        );

      case ExerciseMetricType.percent1rmAndReps:
        return Text(
          'X ${widget.workoutSet.repetitions!} * %${widget.workoutSet.percent1rm!}RM',
          style: context.textTheme.displaySmall,
        );

      case ExerciseMetricType.timeBased:
        return Text(
          context.l10n.setPtescribedDialogTimeBasedLabel(timeLeftSecond),
          style: context.textTheme.displaySmall,
        );
    }
  }

  void _showExerciseDetail() {
    final baseUri = ImageRepository.baseUriWithPath;
    final exerciseDefinition = widget.exerciseDefinition;

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
