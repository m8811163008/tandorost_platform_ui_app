import 'dart:async';
import 'dart:io';

import 'package:athlete_repository/athlete_repository.dart';
import 'package:coach_repository/coach_repository.dart';
import 'package:domain_model/domain_model.dart';
import 'package:fitness_nutrition/fitness_nutrition.dart';
import 'package:flutter/foundation.dart';
import 'package:image_repository/image_repository.dart';
import 'package:profile/profile.dart';
import 'package:tandorost_components/tandorost_components.dart';

part 'athelte_directory_state.dart';

class AthelteDirectoryCubit extends Cubit<AthelteDirectoryState> {
  AthelteDirectoryCubit({
    required this.profileRepository,
    required this.coachRepository,
    required this.imageRepository,
    required this.athleteRepository,
    required this.fitnessNutrition,
  }) : super(AthelteDirectoryState()) {
    onReadCoachProfile();
    onReadExerciseDefinition();
    _coachProfilesubscription = profileRepository.userProfileStream.listen((
      coachProfile,
    ) {
      if (coachProfile == null) return;
      _enhancedEmit(state.copyWith(coachProfile: () => coachProfile));
    });
  }
  final ProfileRepository profileRepository;
  final CoachRepository coachRepository;
  final ImageRepository imageRepository;
  final AthleteRepository athleteRepository;
  final FitnessNutrition fitnessNutrition;
  late final StreamSubscription<UserProfile?> _coachProfilesubscription;

  @override
  Future<void> close() async {
    await _coachProfilesubscription.cancel();
    super.close();
  }

  void updateSelectedAthlete(UserProfile selectedAthelete) {
    _enhancedEmit(state.copyWith(selectedAthlete: selectedAthelete));
  }

  // call after navigating to detail
  void onReadAtheleteTrainingHistory() async {
    _enhancedEmit(
      state.copyWith(
        onReadAtheleteTrainingHistoryStatus: AsyncProcessingStatus.loading,
      ),
    );
    try {
      final selectedAtheleteTrainsHistory = await athleteRepository
          .readTraineeHistory(state.selectedAthlete!.id);
      _enhancedEmit(
        state.copyWith(
          onReadAtheleteTrainingHistoryStatus: AsyncProcessingStatus.success,
          selectedAtheleteTrainsHistory: selectedAtheleteTrainsHistory,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          onReadAtheleteTrainingHistoryStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          onReadAtheleteTrainingHistoryStatus:
              AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void onReadCoachEnrollments() async {
    _enhancedEmit(
      state.copyWith(
        onReadCoachEnrollmentsStatus: AsyncProcessingStatus.loading,
      ),
    );
    try {
      final coachEnrollments = await coachRepository.readEnrollments(
        coachId: state.coachProfile!.id,
      );
      _enhancedEmit(
        state.copyWith(
          onReadCoachEnrollmentsStatus: AsyncProcessingStatus.success,
          coachEnrollments: coachEnrollments,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          onReadCoachEnrollmentsStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          onReadCoachEnrollmentsStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void updateCoachAnalysis(String? value, String atheleteHistoryId) async {
    if (value == null) return;
    final history = state.selectedAtheleteTrainsHistory
        .singleWhere((e) => e.id == atheleteHistoryId)
        .copyWith(coachAnalysis: value);

    await athleteRepository.upsertTraineeHistory(history);
    onReadAtheleteTrainingHistory();
  }

  void onReadAthleteEnrollments() async {
    _enhancedEmit(
      state.copyWith(
        onReadAthleteEnrollmentsStatus: AsyncProcessingStatus.loading,
      ),
    );
    try {
      final athleteEnrollments = await coachRepository.readEnrollments(
        traineeId: state.selectedAthlete!.id,
      );
      _enhancedEmit(
        state.copyWith(
          onReadAthleteEnrollmentsStatus: AsyncProcessingStatus.success,
          athleteEnrollments: athleteEnrollments,
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

  void readAthleteFitnessData() async {
    _enhancedEmit(
      state.copyWith(readFitnessDataStatus: AsyncProcessingStatus.loading),
    );

    try {
      final fitnessData = await fitnessNutrition.readAthelteFitnessData(
        state.selectedAthlete!.id,
      );
      _enhancedEmit(
        state.copyWith(
          readFitnessDataStatus: AsyncProcessingStatus.success,

          fitnessData: fitnessData,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          readFitnessDataStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          readFitnessDataStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void onChangeChartType(ChartType chartType) {
    _enhancedEmit(state.copyWith(selectedChartType: chartType));
  }

  void readAthletePhysicalProfile() async {
    _enhancedEmit(
      state.copyWith(
        readUserPhysicalProfileStatus: AsyncProcessingStatus.loading,
      ),
    );
    try {
      final physicalProfile = await fitnessNutrition
          .readAtheletePhysicalProfile(state.selectedAthlete!.id);
      _enhancedEmit(
        state.copyWith(
          readUserPhysicalProfileStatus: AsyncProcessingStatus.success,
          userPhysicalProfile: physicalProfile,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          readUserPhysicalProfileStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          readUserPhysicalProfileStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void onReadCoachProfile() async {
    _enhancedEmit(
      state.copyWith(onReadCoachProfileStatus: AsyncProcessingStatus.loading),
    );
    try {
      await profileRepository.userProfile();
      _enhancedEmit(
        state.copyWith(onReadCoachProfileStatus: AsyncProcessingStatus.success),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          onReadCoachProfileStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          onReadCoachProfileStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void onReadCoachAthletesProfile() async {
    _enhancedEmit(
      state.copyWith(
        onReadAthletesUserProfileStatus: AsyncProcessingStatus.loading,
      ),
    );
    try {
      final coachAthletesprofiles = await coachRepository
          .readCoachAthletesProfile();
      _enhancedEmit(
        state.copyWith(
          onReadAthletesUserProfileStatus: AsyncProcessingStatus.success,
          athletesUserProfile: coachAthletesprofiles,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          onReadAthletesUserProfileStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          onReadAthletesUserProfileStatus:
              AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void readAthletesImages() async {
    _enhancedEmit(
      state.copyWith(onReadAthletesImagesStatus: AsyncProcessingStatus.loading),
    );
    try {
      final athletesImages = await imageRepository.readUsersImages(
        gallaryTags: GallaryTag.values,
        userIds: state.athletesUserProfile.map((e) => e.id).toList(),
      );
      final imagesDetail = <FileDetail>[];
      for (final image in athletesImages) {
        final imageDetail = await imageRepository.readImage(image);
        imagesDetail.add(imageDetail);
      }
      _enhancedEmit(
        state.copyWith(
          onReadAthletesImagesStatus: AsyncProcessingStatus.success,
          athletesImages: athletesImages,
          athletesImagesDetail: imagesDetail,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          onReadAthletesImagesStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          onReadAthletesImagesStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void onReadWorkoutProgram() async {
    // TODO add status
    final enrollment = state.athleteEnrollments.first;
    // TODO This is wronge, chek it to store history and engagments
    final coachPrograms = await coachRepository.readCoachProgramsById(
      enrollment.coachId,
    );
    final coachProgram = coachPrograms.singleWhere(
      (e) => e.id == state.athleteEnrollments.first.coachProgramId,
    );
    var workoutProgram = await coachRepository.readWorkoutProgram(
      workoutId: state.athleteEnrollments.first.workoutProgramId,
    );

    workoutProgram ??= WorkoutProgram.empty(coachProgram.durationWeeks * 7);

    _enhancedEmit(
      state.copyWith(
        coachPrograms: coachPrograms,
        workoutProgram: workoutProgram,
      ),
    );
  }

  void onReadExerciseDefinition() async {
    _enhancedEmit(
      state.copyWith(
        readExercisesDefinitionStatus: AsyncProcessingStatus.loading,
      ),
    );
    try {
      final exercisesDefinition = await coachRepository
          .readExerciseDefinition();
      _enhancedEmit(
        state.copyWith(
          readExercisesDefinitionStatus: AsyncProcessingStatus.success,
          exercisesDefinition: exercisesDefinition,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          readExercisesDefinitionStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          readExercisesDefinitionStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void onUpdateWorkoutProgram(WorkoutProgram workoutProgram) async {
    final updatedWorkoutProgram = await coachRepository.upsertWorkoutProgram(
      workoutProgram: workoutProgram,
    );
    _enhancedEmit(state.copyWith(workoutProgram: updatedWorkoutProgram));
  }

  void _enhancedEmit(AthelteDirectoryState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
