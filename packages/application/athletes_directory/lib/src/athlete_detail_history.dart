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
          current.onReadAtheleteTrainingHistoryStatus,
      builder: (context, state) {
        if (state.selectedAtheleteTrainsHistory.isEmpty) return SizedBox();
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
    return AppCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (history.illness.isNotEmpty)
              Text(
                'Illness: ${history.illness}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            if (history.inguries.isNotEmpty)
              Text('Injuries: ${history.inguries}'),
            if (history.disabilities.isNotEmpty)
              Text('Disabilities: ${history.disabilities}'),
            if (history.sportTrainingHistory.isNotEmpty)
              Text('Sport Training History: ${history.sportTrainingHistory}'),
            Text(
              'Practice Frequency/Week: ${history.currentPracticeFrequencyPerWeek}',
            ),
            if (history.excersiceGoal.isNotEmpty)
              Text('Exercise Goal: ${history.excersiceGoal}'),
            if (history.exerciseEquipment.isNotEmpty)
              Text('Exercise Equipment: ${history.exerciseEquipment}'),
            if (history.dailyActivityDesc != null &&
                history.dailyActivityDesc!.isNotEmpty)
              Text('Daily Activity: ${history.dailyActivityDesc}'),
            if (history.supplements != null && history.supplements!.isNotEmpty)
              Text('Supplements: ${history.supplements}'),
            if (history.coachAnalysis != null)
              Text('coachAnalisys: ${history.coachAnalysis}'),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return BlocProvider.value(
                      value: context.read<AthelteDirectoryCubit>(),
                      child: EditAnalysisDialog(history: history),
                    );
                  },
                );
              },
              icon: Icon(Icons.edit),
            ),

            ElevatedButton(
              onPressed: () {
                // to create or edit a program
                // fetch coach program
                context.read<AthelteDirectoryCubit>().onReadWorkoutProgram();
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => WorkoutProgramRoute(),
                  ),
                );
              },
              child: Text('edit/save program'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditAnalysisDialog extends StatefulWidget {
  const EditAnalysisDialog({super.key, required this.history});
  final TraineeHistory history;

  @override
  State<EditAnalysisDialog> createState() => _EditAnalysisDialogState();
}

class _EditAnalysisDialogState extends State<EditAnalysisDialog> {
  String? coachAnalysis;

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: 'edit analysis',
      contents: [
        RegullarTextField(
          label: 'edit analysis',
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
        child: Text('save it'),
      ),
    );
  }
}
