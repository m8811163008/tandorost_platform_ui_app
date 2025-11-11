import 'package:athletes_directory/athletes_directory.dart';
import 'package:athletes_directory/src/creating_exercise_dialogs.dart/video_player_widget.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:image_repository/image_repository.dart';
import 'package:tandorost_components/tandorost_components.dart';

class SelectExercise extends StatefulWidget {
  const SelectExercise({super.key, this.actvitiyIndex});
  final int? actvitiyIndex;

  @override
  State<SelectExercise> createState() => _SelectExerciseState();
}

class _SelectExerciseState extends State<SelectExercise> {
  final Set<String> selectedExerciseIds = {};

  void _onCheckboxChanged(String id, bool selected) {
    setState(() {
      if (selected) {
        selectedExerciseIds.add(id);
      } else {
        selectedExerciseIds.remove(id);
      }
    });
  }

  void _onOkPressed(List<ExerciseDefinition> exercisesDefinition) async {
    final navigation = Navigator.of(context);

    final selectedExercises = exercisesDefinition
        .where((e) => selectedExerciseIds.contains(e.id))
        .toList();

    if (selectedExercises.length == 1) {
      // Single exercise: show set prescription dialog as before
      final setPrescriptions = await showDialog<List<SetPrescription?>?>(
        context: context,
        builder: (ctx2) => ActivitySetting(exercises: selectedExercises),
      );
      if (setPrescriptions == null) {
        navigation.pop();
        return;
      }
      navigation.pop(
        PrescribedExercise(
          sets: setPrescriptions,
          exerciseDefinitionId: [selectedExercises.first.id!],
        ),
      );
    } else if (selectedExercises.length > 1) {
      // Multiple exercises: show reorder dialog
      final reordered = await showDialog<List<ExerciseDefinition>>(
        context: context,
        builder: (ctx) => ReorderExercisesDialog(exercises: selectedExercises),
      );
      if (!mounted || reordered == null) {
        navigation.pop();
        return;
      }
      final setPrescriptions = await showDialog<List<SetPrescription?>>(
        context: context,
        builder: (ctx2) => ActivitySetting(exercises: reordered),
      );
      if (!mounted || setPrescriptions == null) {
        navigation.pop();
        return;
      }
      navigation.pop(
        PrescribedExercise(
          sets: setPrescriptions,
          exerciseDefinitionId: reordered.map((e) => e.id!).toList(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      AthelteDirectoryCubit,
      AthelteDirectoryState,
      List<ExerciseDefinition>
    >(
      selector: (state) => state.exercisesDefinition,
      builder: (context, exercisesDefinition) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.l10n.selectExerciseAppbarTitle),
            actions: [
              IconButton(onPressed: () async {}, icon: Icon(Icons.filter)),
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.sizeExtenstion.medium,
                  vertical: context.sizeExtenstion.small,
                ),
                child: SearchBar(
                  onChanged: (value) {
                    //TODO complete filter and this
                  },
                ),
              ),
              Expanded(
                child: ListView(
                  children: exercisesDefinition.map((exerciseDefinition) {
                    final isSelected = selectedExerciseIds.contains(
                      exerciseDefinition.id,
                    );
                    return Padding(
                      padding: EdgeInsets.all(context.sizeExtenstion.small),
                      child: ExerciseDefenitionListTile(
                        exerciseDefinition: exerciseDefinition,
                        showCheckbox: true,
                        isSelected: isSelected,
                        onCheckboxChanged: (selected) => _onCheckboxChanged(
                          exerciseDefinition.id!,
                          selected ?? false,
                        ),
                        onTap: selectedExerciseIds.isEmpty
                            ? () async {
                                final navigation = Navigator.of(context);

                                // Single exercise: show set prescription dialog as before
                                final setPrescriptions =
                                    await showDialog<List<SetPrescription?>?>(
                                      context: context,
                                      builder: (ctx2) => ActivitySetting(
                                        exercises: [exerciseDefinition],
                                      ),
                                    );
                                if (setPrescriptions == null) {
                                  navigation.pop();
                                  return;
                                }
                                navigation.pop(
                                  PrescribedExercise(
                                    sets: setPrescriptions,
                                    exerciseDefinitionId: [
                                      exerciseDefinition.id!,
                                    ],
                                  ),
                                );
                              }
                            : null,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          floatingActionButton: selectedExerciseIds.isNotEmpty
              ? FloatingActionButton.extended(
                  label: Text(context.l10n.choose),
                  icon: Icon(Icons.add),

                  onPressed: () => _onOkPressed(exercisesDefinition),
                )
              : null,
        );
      },
    );
  }
}

class ExerciseDefenitionListTile extends StatelessWidget {
  const ExerciseDefenitionListTile({
    super.key,
    required this.exerciseDefinition,
    this.onTap,
    this.showCheckbox = false,
    this.isSelected = false,
    this.onCheckboxChanged,
  });
  final ExerciseDefinition exerciseDefinition;
  final VoidCallback? onTap;
  final bool showCheckbox;
  final bool isSelected;
  final ValueChanged<bool?>? onCheckboxChanged;

  void _showExerciseDetail(BuildContext context) {
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
    final baseUri = ImageRepository.baseUriWithPath;
    final coverUri = baseUri.replace(
      path: '${baseUri.path}/${exerciseDefinition.coverImageUrl?.first}',
    );
    return ListTile(
      leading: SizedBox(
        width: 56 * 341 / 184,
        height: 56,
        child: GestureDetector(
          onTap: () => _showExerciseDetail(context),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: exerciseDefinition.coverImageUrl != null
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
          ),
        ),
      ),
      title: Text(exerciseDefinition.title),
      subtitle: Text(
        context.l10n.traineeHistoryExerciseEquipmentValue(
          exerciseDefinition.equipment.name,
        ),
      ),
      trailing: showCheckbox
          ? Checkbox(value: isSelected, onChanged: onCheckboxChanged)
          : null,
      onTap: onTap,
    );
  }
}

class ActivitySetting extends StatefulWidget {
  const ActivitySetting({
    super.key,
    required this.exercises,
    this.initialSetPrescriptions = const [],
  });
  final List<ExerciseDefinition> exercises;
  final List<SetPrescription?> initialSetPrescriptions;

  @override
  State<ActivitySetting> createState() => _ActivitySettingState();
}

class _ActivitySettingState extends State<ActivitySetting> {
  List<SetPrescription?> setPrescriptions = [];
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Initialize with one empty set on load
    if (widget.initialSetPrescriptions.isEmpty) {
      setPrescriptions = widget.exercises
          .map<SetPrescription?>(
            (e) => SetPrescription(restAfterSetSeconds: 30),
          )
          .toList();
    } else {
      setPrescriptions = widget.initialSetPrescriptions;
    }
  }

  void _addSet() {
    setState(() {
      final res = List<SetPrescription?>.generate(
        widget.exercises.length,
        (_) => SetPrescription(restAfterSetSeconds: 30),
      ).toList();
      setPrescriptions.addAll(res);
    });
  }

  void _removeSet(int setIndex) {
    setState(() {
      setPrescriptions[setIndex] = null;
    });
  }

  List<SetPrescriptionField> _getRelevantFields(ExerciseMetricType metricType) {
    switch (metricType) {
      case ExerciseMetricType.repsOnly:
        return [
          SetPrescriptionField.repetitions,
          SetPrescriptionField.restAfterSetSeconds,
        ];
      case ExerciseMetricType.percent1rmAndReps:
        return [
          SetPrescriptionField.percent1rm,
          SetPrescriptionField.repetitions,
          SetPrescriptionField.restAfterSetSeconds,
        ];
      case ExerciseMetricType.timeBased:
        return [
          SetPrescriptionField.durationSeconds,
          SetPrescriptionField.restAfterSetSeconds,
        ];
    }
  }

  final setRowKeys = <Key>[];

  @override
  Widget build(BuildContext context) {
    final columns = [];

    for (int setIndex = 0; setIndex < setPrescriptions.length; setIndex++) {
      final exercise = widget.exercises[setIndex % widget.exercises.length];
      if (setPrescriptions[setIndex] == null) continue;

      final relevantFields = _getRelevantFields(exercise.metricType);
      final setRowKey = Key('$setIndex');
      setRowKeys.add(setRowKey);
      final column = Column(
        children: [
          Text(
            context.l10n.setPrescriptionRowSetLabel(setIndex + 1),
            style: const TextStyle(fontSize: 16),
          ),
          SetPrescriptionRow(
            // TODO BUG: set clears when adding new set, why? refactor.
            key: setRowKey,
            setNumber: setIndex + 1,
            setPrescription: setPrescriptions[setIndex]!,
            relevantFields: relevantFields,
            exerciseTitle: exercise.title,
            onSetUpdated: (updatedSet) {
              setState(() {
                setPrescriptions[setIndex] = updatedSet;
              });
            },
            onRemove: setPrescriptions.length > 1
                ? () => _removeSet(setIndex)
                : null,
          ),
          const Divider(),
        ],
      );
      columns.add(column);
    }

    return Form(
      key: _formKey,
      child: AppDialog(
        title: context.l10n.activitySettingDialogTitle,
        contents: [
          ...columns,

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(context.l10n.activitySettingDialogAddSetLabel),
              IconButton(
                onPressed: _addSet,
                icon: const Icon(Icons.add_circle, color: Colors.green),
              ),
            ],
          ),
        ],
        submitButton: TextButton(
          onPressed: () {
            // Ensure all controllers are synced before saving
            // for (final key in setRowKeys) {
            //   key.currentState?.syncControllersToModel();
            // }
            if (_formKey.currentState!.validate()) {
              Navigator.of(context).pop(setPrescriptions);
            }
          },
          child: Text(context.l10n.save),
        ),
      ),
    );
  }
}

// =======================================================================
// SetPrescriptionField Enum and SetPrescriptionRow Widget
// =======================================================================

enum SetPrescriptionField {
  repetitions,
  durationSeconds,
  percent1rm,
  restAfterSetSeconds,
}

class SetPrescriptionRow extends StatefulWidget {
  final int setNumber;
  final SetPrescription setPrescription;
  final List<SetPrescriptionField> relevantFields;
  final ValueChanged<SetPrescription> onSetUpdated;
  final VoidCallback? onRemove;
  final String? exerciseTitle;

  const SetPrescriptionRow({
    super.key,
    required this.setNumber,
    required this.setPrescription,
    required this.relevantFields,
    required this.onSetUpdated,
    this.onRemove,
    this.exerciseTitle,
  });

  @override
  State<SetPrescriptionRow> createState() => _SetPrescriptionRowState();
}

class _SetPrescriptionRowState extends State<SetPrescriptionRow> {
  // Sync controllers to model before saving
  // void syncControllersToModel() {
  //   final reps = int.tryParse(repsController.text);
  //   final duration = int.tryParse(durationController.text);
  //   final percent = int.tryParse(percentController.text);
  //   final rest = int.tryParse(restController.text);
  //   widget.onSetUpdated(
  //     widget.setPrescription.copyWith(
  //       repetitions: () => reps,
  //       durationSeconds: () => duration,
  //       percent1rm: () => percent,
  //       restAfterSetSeconds: rest ?? widget.setPrescription.restAfterSetSeconds,
  //     ),
  //   );
  // }

  late TextEditingController repsController;
  late TextEditingController durationController;
  late TextEditingController percentController;
  late TextEditingController restController;

  @override
  void initState() {
    super.initState();
    repsController = TextEditingController(
      text: widget.setPrescription.repetitions?.toString() ?? '',
    );
    durationController = TextEditingController(
      text: widget.setPrescription.durationSeconds?.toString() ?? '',
    );
    percentController = TextEditingController(
      text: widget.setPrescription.percent1rm?.toString() ?? '',
    );
    restController = TextEditingController(
      text: widget.setPrescription.restAfterSetSeconds.toString(),
    );
  }

  // @override
  // void didUpdateWidget(covariant SetPrescriptionRow oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   repsController.text = widget.setPrescription.repetitions?.toString() ?? '';
  //   durationController.text =
  //       widget.setPrescription.durationSeconds?.toString() ?? '';
  //   percentController.text =
  //       widget.setPrescription.percent1rm?.toString() ?? '';
  //   restController.text = widget.setPrescription.restAfterSetSeconds.toString();
  // }

  @override
  void dispose() {
    repsController.dispose();
    durationController.dispose();
    percentController.dispose();
    restController.dispose();
    super.dispose();
  }

  Widget _buildMetricTextField(
    SetPrescriptionField field,
    BuildContext context,
  ) {
    String labelText;
    TextEditingController controller;
    Function(String) onChanged;

    switch (field) {
      case SetPrescriptionField.repetitions:
        labelText = context.l10n.setPrescriptionRepsLabel;
        controller = repsController;
        onChanged = (value) {
          widget.onSetUpdated(
            widget.setPrescription.copyWith(
              repetitions: () => int.tryParse(value),
            ),
          );
        };
        break;
      case SetPrescriptionField.durationSeconds:
        labelText = context.l10n.setPrescriptionDrationLabel;
        controller = durationController;
        onChanged = (value) {
          widget.onSetUpdated(
            widget.setPrescription.copyWith(
              durationSeconds: () => int.tryParse(value),
            ),
          );
        };
        break;
      case SetPrescriptionField.percent1rm:
        labelText =
            context.l10n.setPrescriptionPercentOneRepeatitionMaximumLabel;
        controller = percentController;
        onChanged = (value) {
          widget.onSetUpdated(
            widget.setPrescription.copyWith(
              percent1rm: () => int.tryParse(value),
            ),
          );
        };
        break;
      case SetPrescriptionField.restAfterSetSeconds:
        return Container();
    }

    return NumberTextField(
      controller: controller,
      keyboardType: TextInputType.number,
      label: labelText,
      textDirection: TextDirection.ltr,
      // decoration: InputDecoration(
      //   labelText: labelText,
      //   border: const OutlineInputBorder(),
      //   isDense: true,
      //   contentPadding: const EdgeInsets.all(8),
      // ),
      onChange: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return context.l10n.emptyFormFieldValidationError;
        }
        return null;
      },
    );
  }

  /// Predefined common rest durations.
  static const List<int> _restOptions = [
    10,
    15,
    20,
    25,
    30,
    45,
    60,
    90,
    120,
    150,
    180,
    240,
    300,
  ];
  Widget _buildRestDropdown(BuildContext context) {
    final int selectedRest = widget.setPrescription.restAfterSetSeconds;

    // Use a DropdownButtonFormField for better integration with forms
    return DropdownButtonFormField<int>(
      decoration: InputDecoration(
        labelText: context.l10n.setPrescriptionRowRestLabel,
        border: OutlineInputBorder(),
        isDense: true,
        contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
      ),
      value: _restOptions.contains(selectedRest)
          ? selectedRest
          : null, // Set value to null if current value isn't in options
      hint: const Text('Select duration'),
      items: _restOptions.map((int seconds) {
        return DropdownMenuItem<int>(
          value: seconds,
          child: Text(context.l10n.setPrescriptionTimeLeft(seconds)),
        );
      }).toList(),
      onChanged: (int? newValue) {
        if (newValue != null) {
          widget.onSetUpdated(
            widget.setPrescription.copyWith(restAfterSetSeconds: newValue),
          );
        }
      },
    );
  }
  // Depareted in favor of more focus centeric component when selecting like drop down
  // Widget _buildRestSelector(BuildContext context) {
  //   // Determine the current selected value from the setPrescription.
  //   final int selectedRest = widget.setPrescription.restAfterSetSeconds;

  //   // Find the closest option or default to the first one if the current
  //   // value isn't one of the predefined options, so it can be selected
  //   // in the SegmentedButton.
  //   final int initialSelection =
  //       _restOptions.map((e) => e.seconds).contains(selectedRest)
  //       ? selectedRest
  //       : _restOptions.first.seconds;

  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         // Optional: Add a label for clarity
  //         Text(
  //           'Rest Between Sets',
  //           style: Theme.of(context).textTheme.labelMedium,
  //         ),
  //         const SizedBox(height: 4.0),
  //         Center(
  //           child: SegmentedButton<int>(
  //             // The currently selected value(s). SegmentedButton uses a Set.
  //             selected: {initialSelection},

  //             // Map the RestOptions to ButtonSegments
  //             segments: _restOptions.map((option) {
  //               return ButtonSegment<int>(
  //                 value: option.seconds,
  //                 label: Text(option.label),
  //                 // The SegmentedButton handles tooltips automatically based on label
  //               );
  //             }).toList(),

  //             // Handle the selection change
  //             onSelectionChanged: (Set<int> newSelection) {
  //               // newSelection will only have one item because it's a single selection
  //               final int newRestSeconds = newSelection.first;

  //               // Call the update callback with the new rest value
  //               widget.onSetUpdated(
  //                 widget.setPrescription.copyWith(
  //                   restAfterSetSeconds: newRestSeconds,
  //                 ),
  //               );

  //               // Optional: Update the TextEditingController if you still want to
  //               // show the value in a separate display field (not shown here)
  //               // restController.text = newRestSeconds.toString();
  //             },

  //             // Ensure only one option can be selected at a time
  //             multiSelectionEnabled: false,
  //             emptySelectionAllowed: false, // Don't allow no selection
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  // Departed in favor of better ux
  // Widget _buildRestTextField(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //     child: TextField(
  //       controller: restController,
  //       keyboardType: TextInputType.number,
  //       textDirection: TextDirection.ltr,
  //       decoration: const InputDecoration(
  //         border: OutlineInputBorder(),
  //         isDense: true,
  //         contentPadding: EdgeInsets.all(8),
  //       ),
  //       onChanged: (value) {
  //         int? rest = int.tryParse(value);
  //         if (rest != null && rest >= 0) {
  //           widget.onSetUpdated(
  //             widget.setPrescription.copyWith(restAfterSetSeconds: rest),
  //           );
  //         }
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // ...existing code...
    // Replace the old build method with this one
    final metricFields = widget.relevantFields
        .where((field) => field != SetPrescriptionField.restAfterSetSeconds)
        .map(
          (field) => Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: _buildMetricTextField(field, context),
            ),
          ),
        )
        .toList();

    final restField = _buildRestDropdown(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (widget.exerciseTitle != null)
                Text(
                  widget.exerciseTitle!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              Text(
                context.l10n.setPrescriptionRowSetLabel(widget.setNumber),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              if (widget.onRemove != null)
                IconButton(
                  icon: const Icon(Icons.remove_circle, color: Colors.red),
                  onPressed: widget.onRemove,
                  tooltip: context.l10n.setPrescriptionRowRemoveSet,
                ),
            ],
          ),
          Row(children: metricFields),
          SizedBox(height: context.sizeExtenstion.medium),
          restField,
        ],
      ),
    );
  }
}

class ReorderExercisesDialog extends StatefulWidget {
  final List<ExerciseDefinition> exercises;
  const ReorderExercisesDialog({super.key, required this.exercises});

  @override
  State<ReorderExercisesDialog> createState() => _ReorderExercisesDialogState();
}

class _ReorderExercisesDialogState extends State<ReorderExercisesDialog> {
  late List<ExerciseDefinition> reordered;

  @override
  void initState() {
    super.initState();
    reordered = List.of(widget.exercises);
  }

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: context.l10n.reorderExercisesDialogTitle,
      contents: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Text(context.l10n.reorderExercisesDialogSubTitle),
              ReorderableListView(
                shrinkWrap: true,
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    if (newIndex > oldIndex) newIndex--;
                    final item = reordered.removeAt(oldIndex);
                    reordered.insert(newIndex, item);
                  });
                },
                children: [
                  for (final e in reordered)
                    Padding(
                      key: ValueKey(e.id),
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(e.title),
                        leading: Icon(Icons.reorder),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
      submitButton: TextButton(
        onPressed: () => Navigator.of(context).pop(reordered),
        child: Text(context.l10n.save),
      ),
    );
  }
}
