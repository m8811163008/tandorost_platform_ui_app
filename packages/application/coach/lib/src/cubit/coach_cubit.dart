import 'dart:io';
import 'dart:typed_data';

import 'package:athlete_repository/athlete_repository.dart';
import 'package:coach_repository/coach_repository.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:image_repository/image_repository.dart';
import 'package:profile/profile.dart';
import 'package:tandorost_components/tandorost_components.dart';

part 'coach_state.dart';

class CoachCubit extends Cubit<CoachState> {
  CoachCubit({
    required this.coachRepository,
    required this.imageRepository,
    required this.athleteRepository,
    required this.profileRepostiory,
  }) : super(CoachState()) {
    readCoachesUserProfiles();
    readCoachesProfile();
    readUserImageGallary();
    profileRepostiory.userProfile();
  }

  final CoachRepository coachRepository;
  final ImageRepository imageRepository;
  final AthleteRepository athleteRepository;
  final ProfileRepository profileRepostiory;

  Future<void> readCoachesUserProfiles() async {
    _enhancedEmit(
      state.copyWith(
        readCoachesUserProfileStatus: AsyncProcessingStatus.loading,
      ),
    );
    try {
      final coachesUserProfile = await coachRepository.readCoachesProfiles();
      _enhancedEmit(
        state.copyWith(
          readCoachesUserProfileStatus: AsyncProcessingStatus.success,
          coachesUserProfile: coachesUserProfile,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          readCoachesUserProfileStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          readCoachesUserProfileStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  Future<void> readCoachesProfile() async {
    _enhancedEmit(
      state.copyWith(readCoachesProfileStatus: AsyncProcessingStatus.loading),
    );

    try {
      final coaches = await coachRepository.readCoaches();
      _enhancedEmit(
        state.copyWith(
          readCoachesProfileStatus: AsyncProcessingStatus.success,
          coachesProfile: coaches,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          readCoachesProfileStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          readCoachesProfileStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void updateSelectedCoach({
    required UserProfile selectedCoacheUserProfile,
    required CoachProfile selectedCoachProfile,
  }) {
    _enhancedEmit(
      state.copyWith(
        selectedCoachProfile: selectedCoachProfile,
        selectedCoacheUserProfile: selectedCoacheUserProfile,
        //reset readCoachProgramsState
        readSelectedCoachProgramsStatus: AsyncProcessingStatus.inital,
      ),
    );
  }

  Future<void> readCoachProgramsById(String coachId) async {
    _enhancedEmit(
      state.copyWith(
        readSelectedCoachProgramsStatus: AsyncProcessingStatus.loading,
      ),
    );
    try {
      final coachPrograms = await coachRepository.readCoachProgramsById(
        coachId,
      );
      _enhancedEmit(
        state.copyWith(
          readSelectedCoachPrograms: () => coachPrograms,
          readSelectedCoachProgramsStatus: AsyncProcessingStatus.success,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          readSelectedCoachProgramsStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          readSelectedCoachProgramsStatus:
              AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void onChangeTraineeHistory(TraineeHistory traineeHistory) {
    _enhancedEmit(state.copyWith(traineeHistory: traineeHistory));
  }

  void upsertTraineeHistory() async {
    _enhancedEmit(
      state.copyWith(
        upsertingTraineeHistoryStatus: AsyncProcessingStatus.loading,
      ),
    );
    try {
      final traineeProfile = await profileRepostiory.userProfileStream.first;
      if (traineeProfile == null) {
        return;
      }
      final traineeHistory = state.traineeHistory!.copyWith(
        userId: traineeProfile.id,
      );
      final upsertedTraineeHistory = await athleteRepository
          .upsertTraineeHistory(traineeHistory);
      _enhancedEmit(
        state.copyWith(
          upsertingTraineeHistoryStatus: AsyncProcessingStatus.success,
          traineeHistory: upsertedTraineeHistory,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          upsertingTraineeHistoryStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          upsertingTraineeHistoryStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  Future<void> readCoachImages() async {
    _enhancedEmit(
      state.copyWith(readCoachImagesDataStatus: AsyncProcessingStatus.loading),
    );
    try {
      final activeCoaches = state.coachesProfile
          .where((coach) => coach.isActive)
          .toList();
      final coachesImagesData = <FileData>[];
      final coachesImageDetail = <FileDetail>[];
      for (final activeCoach in activeCoaches) {
        var coachImages = await coachRepository.readCoachImages(
          activeCoach.userId,
        );
        coachImages = coachImages
            .where(
              (image) => image.processingStatus == ProcessingStatus.approved,
            )
            .toList();
        coachesImagesData.addAll(coachImages);
        for (final imageData in coachImages) {
          final fileDetail = await imageRepository.readImage(imageData);
          coachesImageDetail.add(fileDetail);
        }
      }

      _enhancedEmit(
        state.copyWith(
          readCoachImagesDataStatus: AsyncProcessingStatus.success,
          readCoachImagesData: coachesImagesData,
          coachesImagesFilesDetail: coachesImageDetail,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          readCoachImagesDataStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          readCoachImagesDataStatus: AsyncProcessingStatus.connectionError,
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
          .readUnarchivedUserImageGallary([GallaryTag.defaultTag]);

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

  void onEditImageComplete(
    Uint8List bytes,
    String fileName, [
    DateTime? uploadDate,
  ]) async {
    final fileDetail = FileDetail(
      fileName: fileName,
      bytes: bytes,
      uploadDate: uploadDate,
    );
    final userImage = UserFile(
      gallaryTag: GallaryTag.defaultTag,
      imageGallaryFiles: [fileDetail],
      uploadDate: uploadDate,
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

  void insertOrDeleteFromArchiveImageList(String? imageId) {
    if (imageId == null) return;
    final imagesId = List<String>.from(state.archiveImagesId);
    state.archiveImagesId.contains(imageId)
        ? imagesId.remove(imageId)
        : imagesId.add(imageId);
    _enhancedEmit(state.copyWith(archiveImagesId: imagesId));
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

  void _enhancedEmit(CoachState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
