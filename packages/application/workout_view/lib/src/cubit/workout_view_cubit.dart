import 'dart:async';
import 'dart:io';

import 'package:athlete_repository/athlete_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:coach_repository/coach_repository.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:profile/profile.dart';

part 'workout_view_state.dart';

class WorkoutViewCubit extends Cubit<WorkoutViewState> {
  WorkoutViewCubit({
    required this.coachRepository,
    required this.profileRepository,
    required this.athleteRepository,
  }) : super(WorkoutViewState()) {
    athleteProfileSubscription = profileRepository.userProfileStream.listen((
      athleteProfile,
    ) {
      if (athleteProfile == null) return;
      _enhancedEmit(state.copyWith(athleteProfile: () => athleteProfile));
    });
    onReadProfile();
    onReadExeriseDefinitions();
  }
  final CoachRepository coachRepository;
  final ProfileRepository profileRepository;
  final AthleteRepository athleteRepository;
  late final StreamSubscription<UserProfile?> athleteProfileSubscription;
  void onReadExeriseDefinitions() async {
    _enhancedEmit(
      state.copyWith(
        onReadExercisesDefinitionStatus: AsyncProcessingStatus.loading,
      ),
    );
    try {
      final definitions = await coachRepository.readExerciseDefinition();
      _enhancedEmit(
        state.copyWith(
          exercisesDefinition: definitions,
          onReadExercisesDefinitionStatus: AsyncProcessingStatus.success,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          onReadExercisesDefinitionStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          onReadExercisesDefinitionStatus:
              AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void onReadProfile() async {
    _enhancedEmit(
      state.copyWith(onReadAthelteProfileStatus: AsyncProcessingStatus.loading),
    );
    try {
      await profileRepository.userProfile();
      _enhancedEmit(
        state.copyWith(
          onReadAthelteProfileStatus: AsyncProcessingStatus.success,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          onReadAthelteProfileStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          onReadAthelteProfileStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void onReadAthleteEnrollments() async {
    if (state.athleteProfile == null) return;
    _enhancedEmit(
      state.copyWith(
        onReadAthleteEnrollmentsStatus: AsyncProcessingStatus.loading,
      ),
    );
    try {
      final enrollments = await coachRepository.readEnrollments(
        traineeId: state.athleteProfile!.id,
      );
      _enhancedEmit(
        state.copyWith(
          onReadAthleteEnrollmentsStatus: AsyncProcessingStatus.success,
          athleteEnrollments: enrollments,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          onReadAthleteEnrollmentsStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          onReadAthleteEnrollmentsStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void onReadTraineeHistories() async {
    if (state.athleteProfile == null) return;
    _enhancedEmit(
      state.copyWith(
        onReadTraineeHistoriesStatus: AsyncProcessingStatus.loading,
      ),
    );
    try {
      final histories = await athleteRepository.readTraineeHistory(
        state.athleteProfile!.id,
      );
      _enhancedEmit(
        state.copyWith(
          onReadTraineeHistoriesStatus: AsyncProcessingStatus.success,
          traineeHistories: histories,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          onReadTraineeHistoriesStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          onReadTraineeHistoriesStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void onReadWorkoutProgram() async {
    if (state.athleteProfile == null) return;
    _enhancedEmit(
      state.copyWith(onReadWorkoutProgramStatus: AsyncProcessingStatus.loading),
    );
    try {
      final workouts = <WorkoutProgram>[];
      for (var enrollment in state.athleteEnrollments) {
        var workoutProgram = await coachRepository.readWorkoutProgram(
          workoutId: enrollment.workoutProgramId,
        );
        if (workoutProgram == null) return;
        workouts.add(workoutProgram);
      }
      _enhancedEmit(
        state.copyWith(
          workoutProgram: workouts,
          onReadWorkoutProgramStatus: AsyncProcessingStatus.success,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          onReadWorkoutProgramStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          onReadWorkoutProgramStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void onReadCoaches() async {
    if (state.athleteEnrollments.isEmpty) return;
    _enhancedEmit(
      state.copyWith(
        onReadCoachesUserProfileStatus: AsyncProcessingStatus.loading,
      ),
    );
    try {
      final coachUserprofiles = await coachRepository.readCoachProfiles();
      _enhancedEmit(
        state.copyWith(
          coachesUserProile: coachUserprofiles,
          onReadCoachesUserProfileStatus: AsyncProcessingStatus.success,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          onReadCoachesUserProfileStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          onReadCoachesUserProfileStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  onToggleIdDoneWorkout({
    required AthleteDay athleteDay,
    required String workoutId,
    bool isDone = true,
  }) async {
    _enhancedEmit(
      state.copyWith(
        onToggleIdDoneWorkoutStatus: AsyncProcessingStatus.loading,
      ),
    );
    try {
      final updatedAtheletDay = athleteDay.copyWith(isDone: isDone);
      final workoutProgram = state.workoutProgram.singleWhere(
        (e) => e.id == workoutId,
      );

      final days = List<AthleteDay?>.from(workoutProgram.days);
      final startIndex = days.indexOf(athleteDay);
      days.replaceRange(startIndex, startIndex + 1, [updatedAtheletDay]);
      final updatedWorkoutProgram = await coachRepository.upsertWorkoutProgram(
        workoutProgram: workoutProgram.copyWith(days: days),
      );
      final workoutPrograms = state.workoutProgram;
      final updatedWorkoutProgramIndex = workoutPrograms.indexWhere(
        (e) => e.id == updatedWorkoutProgram.id,
      );
      workoutPrograms.replaceRange(
        updatedWorkoutProgramIndex,
        updatedWorkoutProgramIndex + 1,
        [updatedWorkoutProgram],
      );

      _enhancedEmit(
        state.copyWith(
          workoutProgram: workoutPrograms,
          onToggleIdDoneWorkoutStatus: AsyncProcessingStatus.success,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          onToggleIdDoneWorkoutStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          onToggleIdDoneWorkoutStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void _enhancedEmit(WorkoutViewState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
