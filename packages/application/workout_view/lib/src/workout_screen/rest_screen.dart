import 'dart:async';

import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:image_repository/image_repository.dart';
import 'package:tandorost_components/tandorost_components.dart';
import 'package:workout_view/src/video_player_widget.dart';

class RestScreen extends StatefulWidget {
  const RestScreen({
    super.key,
    this.onResetTap,
    required this.title,
    required this.currentWorkoutCount,
    required this.workoutCount,
    required this.nextSetExerciseDefinition,
    required this.restInSeconds,
    this.onDoneTap,
  });
  final VoidCallback? onResetTap;
  final String title;
  final int workoutCount;
  final int currentWorkoutCount;
  final int restInSeconds;
  final ExerciseDefinition nextSetExerciseDefinition;
  final VoidCallback? onDoneTap;

  @override
  State<RestScreen> createState() => _RestScreenState();
}

class _RestScreenState extends State<RestScreen> {
  late int restTimeLeft;
  Timer? _timer;
  @override
  void initState() {
    restTimeLeft = widget.restInSeconds;
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        restTimeLeft--;
        if (restTimeLeft == 0) {
          _timer!.cancel();
          widget.onDoneTap?.call();
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: widget.onResetTap),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            _getExerciseCover(
              widget.nextSetExerciseDefinition.coverImageUrl,
              widget.nextSetExerciseDefinition.videoUrls,
            ),

            Text('${widget.currentWorkoutCount}/${widget.workoutCount}'),
            SizedBox(height: context.sizeExtenstion.medium),
            Text(context.l10n.restScreenWorkoutTitle),
            SizedBox(height: context.sizeExtenstion.small),
            Center(
              child: Text(
                widget.nextSetExerciseDefinition.title,
                style: context.textTheme.headlineSmall,
              ),
            ),
            SizedBox(height: context.sizeExtenstion.medium),
            Text(context.l10n.restScreenWorkoutRestTimeTitle),
            SizedBox(width: context.sizeExtenstion.small),
            Text(
              restTimeLeft.toString(),
              style: context.textTheme.displaySmall,
            ),
            SizedBox(height: context.sizeExtenstion.medium),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.sizeExtenstion.large,
              ),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          restTimeLeft += 20;
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: context.sizeExtenstion.medium,
                        ),
                      ),
                      child: Text(
                        context.l10n.restScreenAddRestElevatedButtonLabel(20),
                      ),
                    ),
                    SizedBox(height: context.sizeExtenstion.medium),
                    ElevatedButton(
                      onPressed: widget.onDoneTap,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: context.sizeExtenstion.medium,
                        ),
                      ),
                      child: Text(
                        context
                            .l10n
                            .workoutScreenDoneElevatedButtonExerciseTitle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack _getExerciseCover(List<String>? imageUrls, List<String>? videoUrl) {
    final baseUri = ImageRepository.baseUriWithPath;
    final exerciseDefinition = widget.nextSetExerciseDefinition;

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
            onPressed: () async {
              _timer?.cancel();
              await _showExerciseDetail();
              _timer = Timer.periodic(Duration(seconds: 1), (_) {
                setState(() {
                  restTimeLeft--;
                  if (restTimeLeft == 0) {
                    _timer!.cancel();
                    widget.onDoneTap?.call();
                  }
                });
              });
            },
            icon: Icon(Icons.info),
          ),
        ),
      ],
    );
  }

  Future<void> _showExerciseDetail() async {
    final baseUri = ImageRepository.baseUriWithPath;
    final exerciseDefinition = widget.nextSetExerciseDefinition;

    await showModalBottomSheet(
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
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 3,
                              child: CarouselView(
                                itemExtent: MediaQuery.of(context).size.width,
                                children: exerciseDefinition.videoUrls!
                                    .map(
                                      (e) => AspectRatio(
                                        aspectRatio: 16 / 9,
                                        child: VideoPlayerWidget(
                                          videoUrl: Uri.parse('$baseUri/$e'),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
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
