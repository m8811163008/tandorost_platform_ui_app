import 'dart:io';

import 'package:coach_repository/coach_repository.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:image_repository/image_repository.dart';
import 'package:tandorost_components/tandorost_components.dart';

part 'coach_state.dart';

class CoachCubit extends Cubit<CoachState> {
  CoachCubit({required this.coachRepository, required this.imageRepository})
    : super(CoachState()) {
    readCoachesUserProfiles();
    readCoachesProfile();
  }

  final CoachRepository coachRepository;
  final ImageRepository imageRepository;

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
        final coachImages = await coachRepository.readCoachImages(
          activeCoach.userId,
        );
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

  void _enhancedEmit(CoachState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
