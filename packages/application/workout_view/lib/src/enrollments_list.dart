import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';
import 'package:workout_view/src/athlete_days_list.dart';
import 'package:workout_view/workout_view.dart';

class EnrollmentsList extends StatelessWidget {
  const EnrollmentsList({
    super.key,
    this.onNavigateToFitnessProfileAfterWorkout,
  });
  final VoidCallback? onNavigateToFitnessProfileAfterWorkout;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutViewCubit, WorkoutViewState>(
      buildWhen: (prev, curr) =>
          prev.onReadAthleteEnrollmentsStatus !=
              curr.onReadAthleteEnrollmentsStatus ||
          prev.onReadTraineeHistoriesStatus !=
              curr.onReadTraineeHistoriesStatus ||
          prev.onReadCoachesUserProfileStatus !=
              curr.onReadCoachesUserProfileStatus,
      builder: (context, state) {
        if (state.onReadAthleteEnrollmentsStatus.isLoading ||
            state.onReadTraineeHistoriesStatus.isLoading ||
            state.onReadCoachesUserProfileStatus.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.athleteEnrollments.isEmpty ||
            state.traineeHistories.isEmpty ||
            state.coachesUserProile.isEmpty) {
          // TODO navigate to register a program in empty state UX
          return Center(child: Text(context.l10n.enrollmentsListEmptyTitle));
        }
        return ListView(
          children: state.athleteEnrollments.map((e) {
            final history = state.traineeHistories.singleWhere(
              (element) => element.id! == e.traineeHistoryId,
            );
            final coachAnalysis = history.coachAnalysis;
            final coachFoodsInstructions = history.coachFoodsInstructions;
            final coachSupplementsInstruction =
                history.coachSupplementsInstruction;
            final coachProfile = state.coachesUserProile.singleWhere(
              (coachUserProfile) => coachUserProfile.id == e.coachId,
            );

            return AppCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _BuildRow(
                    label: context.l10n.enrollmentsListEnrollmentCardTitle,
                    text: e.enrollmentDate.formattedDate(context),
                  ),

                  if (coachAnalysis != null)
                    _BuildRow(
                      label: context
                          .l10n
                          .enrollmentsListEnrollmentCardCoachAnalysis,
                      text: coachAnalysis,
                    ),
                  if (coachFoodsInstructions != null)
                    _BuildRow(
                      label: context
                          .l10n
                          .enrollmentsListEnrollmentCardCoachFoodInstruction,
                      text: coachFoodsInstructions,
                    ),
                  if (coachSupplementsInstruction != null)
                    _BuildRow(
                      label: context
                          .l10n
                          .enrollmentsListEnrollmentCardCoachSupplementsInstruction,
                      text: coachSupplementsInstruction,
                    ),
                  if (coachProfile.fullName != null)
                    _BuildRow(
                      label: context
                          .l10n
                          .enrollmentsListEnrollmentCardCoachProfileName,
                      text: coachProfile.fullName!,
                    ),
                  if (coachProfile.phoneNumber != null)
                    _BuildIdentifierRow(
                      label: context
                          .l10n
                          .enrollmentsListEnrollmentCardCoachProfilePhoneNumber,
                      text: coachProfile.phoneNumber!,
                    ),
                  if (coachProfile.email != null)
                    _BuildIdentifierRow(
                      label: context
                          .l10n
                          .enrollmentsListEnrollmentCardCoachProfileEmail,
                      text: coachProfile.email!,
                      isEmail: true,
                    ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return AthleteDaysList(
                              workoutProgramId: e.workoutProgramId,
                              onNavigateToFitnessProfileAfterWorkout:
                                  onNavigateToFitnessProfileAfterWorkout,
                            );
                          },
                        ),
                      );
                    },
                    child: Text(
                      context
                          .l10n
                          .enrollmentsListEnrollmentCardElevatedButtonTitle,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class _BuildRow extends StatelessWidget {
  const _BuildRow({required this.label, required this.text});
  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          children: [
            Text(label, style: context.textTheme.labelMedium),
            Text(' : '),

            Text(text),
          ],
        ),
        Divider(),
      ],
    );
  }
}

class _BuildIdentifierRow extends StatelessWidget {
  const _BuildIdentifierRow({
    required this.label,
    required this.text,
    this.isEmail = true,
  });
  final String label;
  final String text;
  final bool isEmail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(label, style: context.textTheme.labelMedium),
            Text(' : '),
            if (isEmail)
              TextButton(
                onPressed: () async {
                  final Uri params = Uri(
                    scheme: 'mailto',
                    path: text,
                    queryParameters: {
                      // Todo add coachnames
                      'subject': context.l10n.contactCoachEmailSubject(''),
                      // 'body': 'Default body'
                    },
                  );

                  if (await canLaunchUrl(params)) {
                    launchUrl(params);
                  } else {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            context.l10n.lanchUriFailedSnackBarMessage,
                          ),
                        ),
                      );
                    }
                  }
                },
                child: Text(text),
              )
            else
              TextButton(
                onPressed: () async {
                  final call = Uri.parse('tel:$text');
                  if (await canLaunchUrl(call)) {
                    launchUrl(call);
                  } else {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            context.l10n.lanchUriFailedSnackBarMessage,
                          ),
                        ),
                      );
                    }
                  }
                },
                child: Text(text),
              ),
          ],
        ),
        Divider(),
      ],
    );
  }
}
