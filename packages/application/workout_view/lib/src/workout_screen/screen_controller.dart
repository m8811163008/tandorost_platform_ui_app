import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';
import 'package:workout_view/src/workout_screen/congratulation_screen.dart';
import 'package:workout_view/src/workout_screen/rest_screen.dart';
import 'package:workout_view/src/workout_screen/workout_screen.dart';
import 'package:workout_view/workout_view.dart';

class WorkoutScreenCotroller extends StatefulWidget {
  const WorkoutScreenCotroller({
    super.key,
    this.onNavigateToFitnessProfileAfterWorkout,
    this.prescribedExercises = const [],
    required this.selectedAthleteDay,
    required this.workoutId,
  });
  final List<PrescribedExercise> prescribedExercises;
  final AthleteDay selectedAthleteDay;
  final String workoutId;
  final VoidCallback? onNavigateToFitnessProfileAfterWorkout;

  @override
  State<WorkoutScreenCotroller> createState() => _WorkoutScreenCotrollerState();
}

class _WorkoutScreenCotrollerState extends State<WorkoutScreenCotroller> {
  late final PageController _pageController;
  @override
  void initState() {
    _pageController = PageController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_pageController.hasClients) {
        _pageController.jumpToPage(_pageController.initialPage);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use watch<Cubit>() for rebuilds on state change, or read<Cubit>() if you're
    // sure the exerciseDefinitions won't change after initial load.
    // Assuming the definitions are stable, sticking with read().
    final state = context.read<WorkoutViewCubit>().state;
    final allExerciseDefinitions = state.exercisesDefinition;

    // Local helper function to look up ExerciseDefinitions
    List<ExerciseDefinition> getPrescribedDefinitions(
      PrescribedExercise prescribedExercise,
    ) {
      // Safely check for null/empty list, though the model should enforce non-null
      final defIds = prescribedExercise.exerciseDefinitionId;
      if (defIds == null || defIds.isEmpty) return const [];

      return defIds.map((id) {
        // Use firstWhere for a clearer way to find a single element.
        // The .! after 'id' should be avoided if possible, but kept here
        // assuming the model guarantees non-null IDs in the definitions list.
        return allExerciseDefinitions.firstWhere(
          (element) => element.id == id,
          // The orElse is crucial for preventing a crash if a definition is missing.
          // Returning a placeholder or throwing an error is better than just crashing.
          orElse: () =>
              throw StateError('ExerciseDefinition with ID $id not found.'),
        );
      }).toList();
    }

    // --- Core Page Generation Logic ---
    final children = widget.prescribedExercises
        .asMap() // Use asMap for easy access to both index and value
        .entries
        .map((entry) {
          final prescribedExerciseIndex = entry.key;
          final prescribedExercise = entry.value;

          // 1. Get the definitions for the current PrescribedExercise (Superset/Compound)
          final prescribedDefinitions = getPrescribedDefinitions(
            prescribedExercise,
          );

          // Pre-calculate flags for the current PrescribedExercise
          final isLastPrescribedExercise =
              prescribedExerciseIndex == widget.prescribedExercises.length - 1;

          final result = <Widget>[];

          final sets = prescribedExercise.sets ?? [];
          // Loop through all sets within the current PrescribedExercise
          for (var i = 0; i < sets.length; i++) {
            final workoutSet = sets[i];

            // Skip null sets (if they are used as placeholders for rest or breaks)
            if (workoutSet == null) continue;

            // Determine the specific ExerciseDefinition for this set based on the superset index
            final exerciseDefinitionIndex = i % prescribedDefinitions.length;
            final exerciseDefinition =
                prescribedDefinitions[exerciseDefinitionIndex];

            // Pre-calculate flags for the current Set
            final isLastSetOfPrescribedExercise = i == sets.length - 1;

            // Callback to move to the next page
            void onDoneTap() {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            }

            // 2. Determine the Next Exercise Definition (for the Rest Screen)
            ExerciseDefinition? nextExerciseDefinitionForRest;

            // Helper to find the index of the next non-null set
            int getNextNonNullSetIndex() {
              for (var j = i + 1; j < sets.length; j++) {
                if (sets[j] != null) return j;
              }
              return -1; // Sentinel value if no next non-null set is found
            }

            // BOX: Logic Refactoring - Ad support for multiple null sets in a row
            final nextNonNullSetIndex = getNextNonNullSetIndex();

            if (!isLastSetOfPrescribedExercise && nextNonNullSetIndex != -1) {
              // Not the last set of the current PrescribedExercise AND there's a
              // next non-null set: next screen is the next exercise def in the superset/compound set.
              final nextExerciseDefinitionIndex =
                  nextNonNullSetIndex % prescribedDefinitions.length;
              nextExerciseDefinitionForRest =
                  prescribedDefinitions[nextExerciseDefinitionIndex];

              // If the next non-null set is the *last* set, and this set has rest,
              // the logic will naturally proceed to the next block after the rest.
            } else if (!isLastPrescribedExercise) {
              // Last set of the current PrescribedExercise (or last non-null set),
              // but not the last PrescribedExercise overall:
              // next screen is the first exercise def of the *next* PrescribedExercise.
              final nextPrescribedExercise =
                  widget.prescribedExercises[prescribedExerciseIndex + 1];
              final nextPrescribedDefinitions = getPrescribedDefinitions(
                nextPrescribedExercise,
              );

              // Check for empty definitions just in case (shouldn't happen with proper data)
              nextExerciseDefinitionForRest =
                  nextPrescribedDefinitions.isNotEmpty
                  ? nextPrescribedDefinitions.first
                  : null;
            } else {
              // Absolute last set of the entire workout: next screen is the 'Congrats' screen, so null.
              nextExerciseDefinitionForRest = null;
            }

            // 3. Determine if the RestScreen should be shown
            bool shouldShowRestScreen =
                workoutSet.restAfterSetSeconds > 0 &&
                !(isLastSetOfPrescribedExercise && isLastPrescribedExercise);

            // Add the WorkoutScreen
            result.add(
              WorkoutScreen(
                onResetTap: Navigator.of(context).pop,
                title: exerciseDefinition.title,
                exerciseDefinition: exerciseDefinition,
                onDoneTap: onDoneTap,
                workoutSet: workoutSet,
              ),
            );

            // Conditionally add the RestScreen
            if (shouldShowRestScreen && nextExerciseDefinitionForRest != null) {
              result.add(
                RestScreen(
                  onResetTap: Navigator.of(context).pop,
                  title: context.l10n.workoutScreenCotrollerRestTitle,
                  // These count properties seem off; it should be the current set/total sets,
                  // but maintaining the original logic for current/total prescribed exercises.
                  workoutCount: widget.prescribedExercises.length - 1,
                  currentWorkoutCount:
                      prescribedExerciseIndex + 1, // Use +1 for display index
                  nextSetExerciseDefinition: nextExerciseDefinitionForRest,
                  restInSeconds: workoutSet.restAfterSetSeconds,
                  onDoneTap: onDoneTap,
                ),
              );
            }
          }
          return result;
        })
        .expand((e) => e)
        .toList();

    // Add the final "Congrats" screen at the very end of the workout pages
    children.add(
      CongratulationScreen(
        onDoneTap: () {
          context.read<WorkoutViewCubit>().onToggleIdDoneWorkout(
            athleteDay: widget.selectedAthleteDay,
            workoutId: widget.workoutId,
          );
          widget.onNavigateToFitnessProfileAfterWorkout?.call();
        },
        onResetTap: () {
          context.read<WorkoutViewCubit>().onToggleIdDoneWorkout(
            athleteDay: widget.selectedAthleteDay,
            workoutId: widget.workoutId,
            isDone: false,
          );
          Navigator.of(context).pop();
        },
        title: context.l10n.congratulationScreenAppBarTitle,
      ),
    );

    return AppScaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: children,
      ),
    );
  }
}
