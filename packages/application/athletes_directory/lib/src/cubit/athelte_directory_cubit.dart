import 'dart:async';
import 'dart:io';

import 'package:athlete_repository/athlete_repository.dart';
import 'package:authentication/authentication.dart';
import 'package:coach_repository/coach_repository.dart';
import 'package:domain_model/domain_model.dart';
import 'package:fitness_nutrition/fitness_nutrition.dart';
import 'package:flutter/foundation.dart';
import 'package:image_repository/image_repository.dart';
import 'package:payment_repository/payment.dart';
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
    required this.authenticationRepositry,
    required this.paymentRepository,
  }) : super(AthelteDirectoryState()) {
    onReadCoachProfile();
    onReadExerciseDefinition();

    userProfileSubscription = profileRepository.userProfileStream.listen((
      profile,
    ) {
      if (profile == null) return;
      _enhancedEmit(
        state.copyWith(
          userProfile: () => profile,
          updatedUserProfile: () => state.updatedUserProfile ?? profile,
        ),
      );
    });
    coachProfileSubscription = coachRepository.coachProfileStream.listen((
      coachProfile,
    ) {
      if (coachProfile == null) return;
      _enhancedEmit(
        state.copyWith(
          coachProfile: () => coachProfile,
          updatedCoachProfile: () => state.updatedCoachProfile ?? coachProfile,
        ),
      );
    });
  }
  final ProfileRepository profileRepository;
  final CoachRepository coachRepository;
  final ImageRepository imageRepository;
  final AthleteRepository athleteRepository;
  final FitnessNutrition fitnessNutrition;
  final AuthenticationRepository authenticationRepositry;
  final PaymentRepository paymentRepository;

  late final StreamSubscription<UserProfile?> userProfileSubscription;
  late final StreamSubscription<CoachProfile?> coachProfileSubscription;

  @override
  Future<void> close() async {
    await Future.wait([
      userProfileSubscription.cancel(),
      coachProfileSubscription.cancel(),
    ]);
    return super.close();
  }

  void updateSelectedAthlete(UserProfile selectedAthelete) {
    _enhancedEmit(state.copyWith(selectedAthlete: () => selectedAthelete));
  }

  void updateCoachBiography() async {
    await updateCoachProfile(state.updatedCoachProfile!);
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
        coachId: state.userProfile!.id,
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

  void updateFoodInstructionAnalysis(
    String? value,
    String atheleteHistoryId,
  ) async {
    if (value == null) return;
    final history = state.selectedAtheleteTrainsHistory
        .singleWhere((e) => e.id == atheleteHistoryId)
        .copyWith(coachFoodsInstructions: value);

    await athleteRepository.upsertTraineeHistory(history);
    onReadAtheleteTrainingHistory();
  }

  void updateSupplementsInstructionAnalysis(
    String? value,
    String atheleteHistoryId,
  ) async {
    if (value == null) return;
    final history = state.selectedAtheleteTrainsHistory
        .singleWhere((e) => e.id == atheleteHistoryId)
        .copyWith(coachSupplementsInstruction: value);

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

  void insertOrDeleteFromArchiveImageList(String? imageId) {
    if (imageId == null) return;
    final imagesId = List<String>.from(state.archiveImagesId);
    state.archiveImagesId.contains(imageId)
        ? imagesId.remove(imageId)
        : imagesId.add(imageId);
    _enhancedEmit(state.copyWith(archiveImagesId: imagesId));
  }

  void onUpdateFinanceCardId(String value) async {
    final updatedProfileVar = state.userProfile!.copyWith(financeCardId: value);
    // await _coachRepository.clearCacheCoachProfile();
    await updateProfile(updatedProfileVar);
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

          fitnessData: () => fitnessData,
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
          userPhysicalProfile: () => physicalProfile,
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
      state.copyWith(onReadUserProfileStatus: AsyncProcessingStatus.loading),
    );
    try {
      await profileRepository.userProfile();
      _enhancedEmit(
        state.copyWith(onReadUserProfileStatus: AsyncProcessingStatus.success),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          onReadUserProfileStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          onReadUserProfileStatus: AsyncProcessingStatus.connectionError,
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
    _enhancedEmit(
      state.copyWith(onReadWorkoutProgramStatus: AsyncProcessingStatus.loading),
    );
    try {
      List<WorkoutProgram> workoutPrograms = [];
      List<CoachProgram> coachPrograms = [];
      for (var enrollment in state.athleteEnrollments) {
        var workoutProgram = await coachRepository.readWorkoutProgram(
          workoutId: enrollment.workoutProgramId,
        );
        assert(workoutProgram != null);

        workoutPrograms.add(workoutProgram!);

        final enrollmentCoachPrograms = await coachRepository
            .readCoachProgramsById(enrollment.coachId);
        final coachProgram = enrollmentCoachPrograms.singleWhere(
          (e) => e.id == enrollment.coachProgramId,
        );
        coachPrograms.add(coachProgram);
      }

      _enhancedEmit(
        state.copyWith(
          onReadWorkoutProgramStatus: AsyncProcessingStatus.success,
          workoutPrograms: workoutPrograms,
          athleteCoachPrograms: List.from(coachPrograms),
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
    // final enrollment = state.athleteEnrollments.singleWhere(
    //   (ae) => ae.traineeHistoryId == historyId,
    // );
    // TODO This is wronge, chek it to store history and engagments
    // final coachPrograms = await coachRepository.readCoachProgramsById(
    //   enrollment.coachId,
    // );
    // final coachProgram = coachPrograms.singleWhere(
    //   (e) => e.id == state.athleteEnrollments.first.coachProgramId,
    // );
  }

  void onChangeSelectedWorkout(WorkoutProgram workoutProgram) {
    _enhancedEmit(state.copyWith(selectedWorkout: () => workoutProgram));
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
    final workoutPrograms = state.workoutPrograms;
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
        workoutPrograms: workoutPrograms,
        selectedWorkout: () => updatedWorkoutProgram,
      ),
    );
  }

  void onChangeBodybuildingCoachRole(bool isBodybuildingCoach) async {
    final currentRoles = Set<Role>.from(state.userProfile!.role);
    isBodybuildingCoach
        ? currentRoles.add(Role.bodybuildingCoach)
        : currentRoles.remove(Role.bodybuildingCoach);
    final updatedProfileVar = state.userProfile!.copyWith(
      role: currentRoles.toList(),
    );
    // await _coachRepository.clearCacheCoachProfile();
    await updateProfile(updatedProfileVar);

    // _enhancedEmit(state.copyWith(updatedUserProfile: updatedProfileVar));
  }

  void onChangeIsCoachAvailable(bool isAvailable) async {
    final updatedProfileVar = state.updatedCoachProfile!.copyWith(
      isActive: isAvailable,
    );
    await updateCoachProfile(updatedProfileVar);
    _enhancedEmit(state.copyWith(updatedCoachProfile: () => updatedProfileVar));
  }

  Future<void> updateCoachProfile(CoachProfile updatedCoachProfile) async {
    if (state.coachProfile == null) return;
    _enhancedEmit(
      state.copyWith(updateCoachProfileStatus: AsyncProcessingStatus.loading),
    );
    try {
      await coachRepository.updateCoachProfile(updatedCoachProfile);

      _enhancedEmit(
        state.copyWith(updateCoachProfileStatus: AsyncProcessingStatus.success),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          updateCoachProfileStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          updateCoachProfileStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void readCoachProfile() async {
    _enhancedEmit(
      state.copyWith(readCoachProfileStatus: AsyncProcessingStatus.loading),
    );
    try {
      await coachRepository.readCoachProfile();

      _enhancedEmit(
        state.copyWith(readCoachProfileStatus: AsyncProcessingStatus.success),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          readCoachProfileStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          readCoachProfileStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  Future<void> updateProfile(UserProfile updatedProfile) async {
    if (state.userProfile == null) return;
    _enhancedEmit(
      state.copyWith(updatingProfileStatus: AsyncProcessingStatus.loading),
    );
    try {
      await profileRepository.updateProfile(updatedProfile);

      _enhancedEmit(
        state.copyWith(updatingProfileStatus: AsyncProcessingStatus.success),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          updatingProfileStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          updatingProfileStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void onChangeCoachBiography(String biography) async {
    _enhancedEmit(
      state.copyWith(
        updatedCoachProfile: () =>
            state.updatedCoachProfile!.copyWith(biography: biography),
      ),
    );
  }

  void onEditImageComplete(
    Uint8List bytes,
    String fileName,
    GallaryTag tag,
    String? description, [
    DateTime? uploadDate,
  ]) async {
    final fileDetail = FileDetail(
      fileName: fileName,
      bytes: bytes,
      uploadDate: uploadDate,
    );
    final userImage = UserFile(
      gallaryTag: tag,
      imageGallaryFiles: [fileDetail],
      uploadDate: uploadDate,
      description: description,
    );
    _enhancedEmit(
      state.copyWith(addUserImageStatus: AsyncProcessingStatus.loading),
    );

    try {
      final userImagesDetail = await imageRepository.addUserImages(userImage);
      // fetch image
      final fetchImageDetail = await imageRepository.readImage(
        userImagesDetail.first,
      );
      // update state
      final fileDetail = List<FileDetail>.from(state.filesDetail);
      final filesData = List<FileData>.from(state.filesData);

      fileDetail.add(fetchImageDetail);
      filesData.addAll(userImagesDetail);
      _enhancedEmit(
        state.copyWith(
          addUserImageStatus: AsyncProcessingStatus.success,
          filesData: filesData,
          filesDetail: fileDetail,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          addUserImageStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          addUserImageStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void readCoachPrograms() async {
    _enhancedEmit(
      state.copyWith(readingCoachProgram: AsyncProcessingStatus.loading),
    );

    try {
      final coachPrograms = await coachRepository.readCoachPrograms();
      _enhancedEmit(
        state.copyWith(
          readingCoachProgram: AsyncProcessingStatus.success,
          coachPrograms: coachPrograms,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          readingCoachProgram: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          readingCoachProgram: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void onChangeCoachProgram(CoachProgram coachProgram) {
    _enhancedEmit(state.copyWith(cacheCoachProgram: () => coachProgram));
  }

  void upsertCoachProgram() async {
    assert(state.cacheCoachProgram != null);
    _enhancedEmit(
      state.copyWith(updatingCoachProgram: AsyncProcessingStatus.loading),
    );

    try {
      await coachRepository.upsertCoachProgram(state.cacheCoachProgram!);

      _enhancedEmit(
        state.copyWith(
          cacheCoachProgram: null,
          updatingCoachProgram: AsyncProcessingStatus.success,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          updatingCoachProgram: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          updatingCoachProgram: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void deleteCoachProgram(String programId) async {
    _enhancedEmit(
      state.copyWith(deletingCoachProgram: AsyncProcessingStatus.loading),
    );

    try {
      await coachRepository.deleteCoachProgram(programId);
      // updat the stream
      // read programs
      _enhancedEmit(
        state.copyWith(deletingCoachProgram: AsyncProcessingStatus.success),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          deletingCoachProgram: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          deletingCoachProgram: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void readUserImageGallary() async {
    _enhancedEmit(
      state.copyWith(readUserImageGallaryStatus: AsyncProcessingStatus.loading),
    );

    try {
      final userImagesDetail = await imageRepository
          .readUnarchivedUserImageGallary([
            GallaryTag.achievement,
            GallaryTag.certificate,
          ]);

      final filesDetail = <FileDetail>[];
      for (var imageDetail in userImagesDetail) {
        final result = await imageRepository.readImage(imageDetail);

        filesDetail.add(result);
      }
      _enhancedEmit(
        state.copyWith(
          readUserImageGallaryStatus: AsyncProcessingStatus.success,
          filesData: userImagesDetail,
          filesDetail: filesDetail.toList(),
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          readUserImageGallaryStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          readUserImageGallaryStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void inviteTrainee(String identifier) async {
    _enhancedEmit(
      state.copyWith(onInviteTraineeStatus: AsyncProcessingStatus.loading),
    );

    try {
      await profileRepository.sendInvite(identifier);
      _enhancedEmit(
        state.copyWith(onInviteTraineeStatus: AsyncProcessingStatus.success),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          onInviteTraineeStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          onInviteTraineeStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void readReferralByInviterId() async {
    _enhancedEmit(
      state.copyWith(
        onReadReferralByInviterIdStatus: AsyncProcessingStatus.loading,
      ),
    );

    try {
      final referrals = await profileRepository.readReferralByInviterId();
      _enhancedEmit(
        state.copyWith(
          onReadReferralByInviterIdStatus: AsyncProcessingStatus.success,
          referralByInviterId: referrals,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          onReadReferralByInviterIdStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          onReadReferralByInviterIdStatus:
              AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void archiveImages() async {
    _enhancedEmit(
      state.copyWith(archivingImagesStatus: AsyncProcessingStatus.loading),
    );

    try {
      await imageRepository.archiveUserImages(state.archiveImagesId);
      _enhancedEmit(
        state.copyWith(
          archivingImagesStatus: AsyncProcessingStatus.success,
          archiveImagesId: [],
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          archivingImagesStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          archivingImagesStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void onReadSubscriptions() async {
    if (state.userProfile == null) return;
    _enhancedEmit(
      state.copyWith(onReadSubscriptionStatus: AsyncProcessingStatus.loading),
    );

    try {
      final subscription = await paymentRepository.readSubscriptionPayments(
        coachId: state.userProfile!.id,
      );
      _enhancedEmit(
        state.copyWith(
          onReadSubscriptionStatus: AsyncProcessingStatus.success,
          subscription: subscription,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          onReadSubscriptionStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          onReadSubscriptionStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void logout() => // log out to get new access token
      authenticationRepositry.logout();
  void _enhancedEmit(AthelteDirectoryState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
