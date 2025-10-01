import 'package:athletes_directory/athletes_directory.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class SelectExercise extends StatelessWidget {
  const SelectExercise({super.key, this.actvitiyIndex});
  final int? actvitiyIndex;

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
            title: Text('select exercise'),
            actions: [
              IconButton(onPressed: () async {}, icon: Icon(Icons.filter)),
            ],
          ),
          body: ListView(
            children: exercisesDefinition
                .map(
                  (exerciseDefinition) => ExerciseDefenitionListTile(
                    exerciseDefinition: exerciseDefinition,
                    onTap: () async {
                      final navigator = Navigator.of(context);
                      final List<SetPrescription>? setPrescriptions =
                          await showDialog(
                            context: context,
                            builder: (ctx2) {
                              return ActivitySetting(
                                metricType: exerciseDefinition.metricType,
                              );
                            },
                          );
                      if (setPrescriptions == null) {
                        return navigator.pop();
                      }
                      var prescribedExercise = PrescribedExercise(
                        isRest: false,
                        sets: setPrescriptions,
                        exerciseDefinitionId: exerciseDefinition.id,
                      );
                      navigator.pop(prescribedExercise);
                    },
                  ),
                )
                .toList(),
          ),
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
  });
  final ExerciseDefinition exerciseDefinition;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(exerciseDefinition.title), onTap: onTap);
  }
}

class ActivitySetting extends StatefulWidget {
  const ActivitySetting({super.key, required this.metricType});
  final ExerciseMetricType metricType;

  @override
  State<ActivitySetting> createState() => _ActivitySettingState();
}

class _ActivitySettingState extends State<ActivitySetting> {
  List<SetPrescription> setPrescriptions = [];

  @override
  void initState() {
    super.initState();
    // Initialize with one empty set on load
    _addSet();
  }

  void _addSet() {
    setState(() {
      // Add a new SetPrescription with a default rest time (e.g., 30 seconds)
      setPrescriptions.add(SetPrescription(restAfterSetSeconds: 30));
    });
  }

  void _removeSet(int index) {
    setState(() {
      setPrescriptions.removeAt(index);
    });
  }

  // Helper to determine the relevant fields based on ExerciseMetricType
  List<SetPrescriptionField> _getRelevantFields() {
    switch (widget.metricType) {
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

  @override
  Widget build(BuildContext context) {
    final relevantFields = _getRelevantFields();

    return AppDialog(
      title: 'Select Exercise Setting',
      contents: [
        ...setPrescriptions.asMap().entries.map((entry) {
          int index = entry.key;
          SetPrescription set = entry.value;
          return SetPrescriptionRow(
            key: ValueKey(set), // Use a unique key for list item stability
            setNumber: index + 1,
            setPrescription: set,
            relevantFields: relevantFields,
            onSetUpdated: (updatedSet) {
              // Update the list when a row's data changes
              setPrescriptions[index] = updatedSet;
            },
            onRemove: setPrescriptions.length > 1
                ? () => _removeSet(index)
                : null, // Allow removal only if more than 1 set exists
          );
        }),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Add Set'),
            IconButton(
              onPressed: _addSet,
              icon: const Icon(Icons.add_circle, color: Colors.green),
            ),
          ],
        ),
      ],
      submitButton: TextButton(
        onPressed: () {
          // Return the List<SetPrescription> sets with pop
          // Note: The list can be empty if the user removes all sets.
          Navigator.of(context).pop(setPrescriptions);
        },
        child: const Text('Save'),
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

class SetPrescriptionRow extends StatelessWidget {
  final int setNumber;
  final SetPrescription setPrescription;
  final List<SetPrescriptionField> relevantFields;
  final ValueChanged<SetPrescription> onSetUpdated;
  final VoidCallback? onRemove;

  const SetPrescriptionRow({
    super.key,
    required this.setNumber,
    required this.setPrescription,
    required this.relevantFields,
    required this.onSetUpdated,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    // Generate text fields for the relevant metrics
    final metricFields = relevantFields
        .where(
          (field) => field != SetPrescriptionField.restAfterSetSeconds,
        ) // Handle rest separately
        .map(
          (field) => Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: _buildMetricTextField(field, context),
            ),
          ),
        )
        .toList();

    // Text field for rest
    final restField = _buildRestTextField(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Set $setNumber',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              if (onRemove != null)
                IconButton(
                  icon: const Icon(Icons.remove_circle, color: Colors.red),
                  onPressed: onRemove,
                  tooltip: 'Remove Set',
                ),
            ],
          ),
          // Row for Metric Input(s)
          Row(children: metricFields),
          // Row for Rest Input
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                const SizedBox(width: 8),
                const Text('Rest (s):'),
                Expanded(child: restField),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget _buildMetricTextField(
    SetPrescriptionField field,
    BuildContext context,
  ) {
    String labelText;
    int? initialValue;
    Function(String) onChanged;

    switch (field) {
      case SetPrescriptionField.repetitions:
        labelText = 'Reps';
        initialValue = setPrescription.repetitions;
        onChanged = (value) {
          onSetUpdated(
            setPrescription.copyWith(repetitions: () => int.tryParse(value)),
          );
        };
        break;
      case SetPrescriptionField.durationSeconds:
        labelText = 'Duration (s)';
        initialValue = setPrescription.durationSeconds;
        onChanged = (value) {
          onSetUpdated(
            setPrescription.copyWith(
              durationSeconds: () => int.tryParse(value),
            ),
          );
        };
        break;
      case SetPrescriptionField.percent1rm:
        labelText = '% 1RM';
        initialValue = setPrescription.percent1rm;
        onChanged = (value) {
          onSetUpdated(
            setPrescription.copyWith(percent1rm: () => int.tryParse(value)),
          );
        };
        break;
      case SetPrescriptionField.restAfterSetSeconds:
        // This is handled by _buildRestTextField
        return Container();
    }

    return TextField(
      controller: TextEditingController(text: initialValue?.toString() ?? ''),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        isDense: true,
        contentPadding: const EdgeInsets.all(8),
      ),
      onChanged: onChanged,
    );
  }

  Widget _buildRestTextField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        controller: TextEditingController(
          text: setPrescription.restAfterSetSeconds.toString(),
        ),
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          // labelText: 'Rest (s)',
          border: OutlineInputBorder(),
          isDense: true,
          contentPadding: EdgeInsets.all(8),
        ),
        onChanged: (value) {
          int? rest = int.tryParse(value);
          if (rest != null && rest >= 0) {
            onSetUpdated(setPrescription.copyWith(restAfterSetSeconds: rest));
          }
        },
      ),
    );
  }
}
