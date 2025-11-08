import 'dart:io' show HttpException;

import 'package:authentication/authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:image_repository/image_repository.dart';

part 'coach_platform_status_state.dart';

class CoachPlatformStatusCubit extends Cubit<CoachPlatformStatusState> {
  CoachPlatformStatusCubit({
    required this.authenticationRepository,
    required this.imageRepository,
  }) : super(CoachPlatformStatusState()) {
    onReadVerifyVideos();
  }
  final AuthenticationRepository authenticationRepository;
  final ImageRepository imageRepository;

  void onVerifyByAi(XFile recordedFile) async {
    _enhancedEmit(
      state.copyWith(onVerifyByAiStatus: AsyncProcessingStatus.loading),
    );
    final bytes = await recordedFile.readAsBytes();
    final fileDetail = FileDetail(fileName: recordedFile.name, bytes: bytes);
    try {
      await authenticationRepository.onVerifyByAi(fileDetail);
      _enhancedEmit(
        state.copyWith(onVerifyByAiStatus: AsyncProcessingStatus.success),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          onVerifyByAiStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          onVerifyByAiStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void onChangeShowingStatus(CoachesListShowingStatus status) {
    _enhancedEmit(state.copyWith(showingStatus: status));
  }

  void onReadVerifyVideos() async {
    _enhancedEmit(
      state.copyWith(onReadVerifyVideosStatus: AsyncProcessingStatus.loading),
    );

    try {
      final filesData = await imageRepository.readUnarchivedUserImageGallary([
        GallaryTag.verification,
      ]);
      final filesDetail = <FileDetail>[];
      for (var fileData in filesData) {
        final fileDetail = await imageRepository.readImage(fileData);
        filesDetail.add(fileDetail);
      }

      _enhancedEmit(
        state.copyWith(
          videoFilesData: filesData,
          videoFilesDetail: filesDetail,
          onReadVerifyVideosStatus: AsyncProcessingStatus.success,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          onReadVerifyVideosStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          onReadVerifyVideosStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void _enhancedEmit(CoachPlatformStatusState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
