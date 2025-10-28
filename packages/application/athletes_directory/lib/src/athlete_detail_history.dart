import 'package:athletes_directory/athletes_directory.dart';
import 'package:athletes_directory/src/creating_exercise_dialogs.dart/select_week_dialog.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class AthleteDetailHistory extends StatelessWidget {
  const AthleteDetailHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AthelteDirectoryCubit, AthelteDirectoryState>(
      buildWhen: (previous, current) =>
          previous.onReadAtheleteTrainingHistoryStatus !=
              current.onReadAtheleteTrainingHistoryStatus ||
          previous.onReadAthleteEnrollmentsStatus !=
              current.onReadAthleteEnrollmentsStatus,
      builder: (context, state) {
        if (state.selectedAtheleteTrainsHistory.isEmpty ||
            state.athleteEnrollments.isEmpty) {
          return Text(context.l10n.histoyListEmptyListlabel);
        }

        return ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: state.selectedAtheleteTrainsHistory.map((history) {
            return HistoryDetailAppCard(history: history);
          }).toList(),
        );
      },
    );
  }
}

class HistoryDetailAppCard extends StatelessWidget {
  const HistoryDetailAppCard({super.key, required this.history});
  final TraineeHistory history;

  @override
  Widget build(BuildContext context) {
    final exerciseEquipmentString = StringBuffer('');
    for (var i = 0; i < history.exerciseEquipment.length; i++) {
      exerciseEquipmentString.write(
        context.l10n.traineeHistoryExerciseEquipmentValue(
          history.exerciseEquipment.elementAt(i).name,
        ),
      );
      if (i != history.exerciseEquipment.length - 1) {
        exerciseEquipmentString.write(",");
      }
    }
    final excersiceGoalString = StringBuffer('');
    for (var i = 0; i < history.excersiceGoal.length; i++) {
      excersiceGoalString.write(
        context.l10n.athleteDetailRouteHistoryExerciseGoalValue(
          history.excersiceGoal.elementAt(i).name,
        ),
      );
      if (i != history.excersiceGoal.length - 1) {
        excersiceGoalString.write(",");
      }
    }
    final cubit = context.read<AthelteDirectoryCubit>();
    final enrollment = cubit.state.athleteEnrollments.singleWhere(
      (e) => e.traineeHistoryId == history.id,
    );
    final loginProfile = cubit.state.userProfile!;

    return AppCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppCardHeader(title: context.l10n.fitnessInfoAthleteHistoryTitle),

            Text(
              '${context.l10n.athleteDetailRouteEnrollmentDate} : ${enrollment.enrollmentDate.formattedDate(context)}',
            ),

            if (history.illness.isNotEmpty)
              Text(
                '${context.l10n.athleteDetailRouteHistoryIllness} : ${history.illness}',
              ),
            if (history.inguries.isNotEmpty)
              Text(
                '${context.l10n.athleteDetailRouteHistoryInjuries} : ${history.inguries}',
              ),
            if (history.disabilities.isNotEmpty)
              Text(
                '${context.l10n.athleteDetailRouteHistoryDisabilities} : ${history.disabilities}',
              ),
            if (history.sportTrainingHistory.isNotEmpty)
              Text(
                '${context.l10n.athleteDetailRouteHistorySportTrainingHistory} : ${history.sportTrainingHistory}',
              ),
            Text(
              '${context.l10n.athleteDetailRouteHistoryPracticeFrequencyPerWeek} : ${history.currentPracticeFrequencyPerWeek}',
            ),
            if (history.excersiceGoal.isNotEmpty)
              Text(
                '${context.l10n.athleteDetailRouteHistoryExerciseGoal} : $excersiceGoalString',
              ),
            if (history.exerciseEquipment.isNotEmpty)
              Text(
                '${context.l10n.athleteDetailRouteHistoryExerciseEquipment} : $exerciseEquipmentString',
              ),
            if (history.dailyActivityDesc != null &&
                history.dailyActivityDesc!.isNotEmpty)
              Text(
                '${context.l10n.athleteDetailRouteHistoryDailyActivity} : ${history.dailyActivityDesc}',
              ),
            if (history.supplements != null && history.supplements!.isNotEmpty)
              Text(
                '${context.l10n.athleteDetailRouteHistorySupplements} : ${history.supplements}',
              ),
            Divider(),

            BlocSelector<
              AthelteDirectoryCubit,
              AthelteDirectoryState,
              List<ProgramFeature>?
            >(
              selector: (state) {
                if (state.athleteEnrollments.isEmpty) return null;
                final athleteEnrollment = state.athleteEnrollments.singleWhere(
                  (ae) => ae.traineeHistoryId == history.id,
                );
                if (state.athleteCoachPrograms.isEmpty) return null;

                return state.athleteCoachPrograms
                    .singleWhere(
                      (e) => e.id! == athleteEnrollment.coachProgramId,
                    )
                    .features;
              },
              builder: (context, features) {
                features = features ?? [];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${context.l10n.athleteDetailRouteHistoryCoachAnalisys} : ${history.coachAnalysis ?? ''}',
                    ),
                    IconButton(
                      onPressed: loginProfile.id == enrollment.coachId
                          ? () {
                              showDialog(
                                context: context,
                                builder: (_) {
                                  return BlocProvider.value(
                                    value: context
                                        .read<AthelteDirectoryCubit>(),
                                    child: EditCoachAnalysisDialog(
                                      history: history,
                                    ),
                                  );
                                },
                              );
                            }
                          : null,
                      icon: Icon(Icons.edit),
                    ),
                    Divider(),
                    if (features.contains(
                      ProgramFeature.personalizedNutritionGuide,
                    )) ...[
                      Text(
                        '${context.l10n.athleteDetailRouteHistoryCoachFoodInstructions} : ${history.coachFoodsInstructions ?? ''}',
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return BlocProvider.value(
                                value: context.read<AthelteDirectoryCubit>(),
                                child: EditCoachFoodsInstructionDialog(
                                  history: history,
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.edit),
                      ),
                      Divider(),
                    ],
                    if (features.contains(
                      ProgramFeature.personalizedNutritionGuide,
                    )) ...[
                      Text(
                        '${context.l10n.athleteDetailRouteHistoryCoachSupplementsInstructions} : ${history.coachSupplementsInstruction ?? ''}',
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return BlocProvider.value(
                                value: context.read<AthelteDirectoryCubit>(),
                                child: EditCoachSupplementsInstructionDialog(
                                  history: history,
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.edit),
                      ),
                      Divider(),
                    ],
                  ],
                );
              },
            ),

            ElevatedButton(
              onPressed: () {
                final cubit = context.read<AthelteDirectoryCubit>();

                final enrollment = cubit.state.athleteEnrollments.singleWhere(
                  (e) => e.traineeHistoryId == history.id,
                );
                final workout = cubit.state.workoutPrograms.singleWhere(
                  (e) => e.id == enrollment.workoutProgramId,
                );

                context.read<AthelteDirectoryCubit>().onChangeSelectedWorkout(
                  workout,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => WorkoutProgramRoute(),
                  ),
                );
              },
              child: Text(
                context
                    .l10n
                    .athleteDetailRouteHistoryUpsertButtonWorkoutProgram,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EditCoachAnalysisDialog extends StatefulWidget {
  const EditCoachAnalysisDialog({super.key, required this.history});
  final TraineeHistory history;

  @override
  State<EditCoachAnalysisDialog> createState() =>
      _EditCoachAnalysisDialogState();
}

class _EditCoachAnalysisDialogState extends State<EditCoachAnalysisDialog> {
  String? coachAnalysis;

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: context.l10n.athleteDetailRouteHistoryEditAnalysisTitle,
      contents: [
        RegullarTextField(
          label: context.l10n.athleteDetailRouteHistoryEditAnalysisLabel,
          hintText: context.l10n.athleteDetailRouteHistoryEditAnalysisHint,
          initalValue: widget.history.coachAnalysis,
          onChange: (value) {
            coachAnalysis = value;
          },
        ),
      ],
      submitButton: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
          context.read<AthelteDirectoryCubit>().updateCoachAnalysis(
            coachAnalysis,
            widget.history.id!,
          );
        },
        child: Text(context.l10n.save),
      ),
    );
  }
}

class EditCoachFoodsInstructionDialog extends StatefulWidget {
  const EditCoachFoodsInstructionDialog({super.key, required this.history});
  final TraineeHistory history;

  @override
  State<EditCoachFoodsInstructionDialog> createState() =>
      _EditCoachFoodsInstructionDialogState();
}

class _EditCoachFoodsInstructionDialogState
    extends State<EditCoachFoodsInstructionDialog> {
  String? foodInstruction;

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: context.l10n.athleteDetailRouteHistoryEditFoodInstructionTitle,
      contents: [
        RegullarTextField(
          label: context.l10n.athleteDetailRouteHistoryEditFoodInstructionLabel,
          hintText:
              context.l10n.athleteDetailRouteHistoryEditFoodInstructionHint,
          initalValue: widget.history.coachFoodsInstructions,
          onChange: (value) {
            foodInstruction = value;
          },
        ),
      ],
      submitButton: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
          context.read<AthelteDirectoryCubit>().updateFoodInstructionAnalysis(
            foodInstruction,
            widget.history.id!,
          );
        },
        child: Text(context.l10n.save),
      ),
    );
  }
}

class EditCoachSupplementsInstructionDialog extends StatefulWidget {
  const EditCoachSupplementsInstructionDialog({
    super.key,
    required this.history,
  });
  final TraineeHistory history;

  @override
  State<EditCoachSupplementsInstructionDialog> createState() =>
      _EditCoachSupplementsInstructionDialogState();
}

class _EditCoachSupplementsInstructionDialogState
    extends State<EditCoachSupplementsInstructionDialog> {
  String? supplementsInstruction;

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: context.l10n.athleteDetailRouteHistoryEditFoodInstructionTitle,
      contents: [
        RegullarTextField(
          label: context.l10n.athleteDetailRouteHistoryEditFoodInstructionLabel,
          hintText:
              context.l10n.athleteDetailRouteHistoryEditFoodInstructionHint,
          initalValue: widget.history.coachSupplementsInstruction,
          onChange: (value) {
            supplementsInstruction = value;
          },
        ),
      ],
      submitButton: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
          context
              .read<AthelteDirectoryCubit>()
              .updateSupplementsInstructionAnalysis(
                supplementsInstruction,
                widget.history.id!,
              );
        },
        child: Text(context.l10n.save),
      ),
    );
  }
}
