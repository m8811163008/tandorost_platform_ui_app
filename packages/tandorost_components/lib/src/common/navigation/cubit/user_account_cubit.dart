import 'dart:io';

import 'package:domain_model/domain_model.dart';
import 'package:flutter/foundation.dart';
import 'package:image_repository/image_repository.dart';
import 'package:profile/profile.dart';
import 'package:tandorost_components/tandorost_components.dart';

part 'user_account_state.dart';

class UserAccountCubit extends Cubit<UserAccountState> {
  UserAccountCubit({
    required ImageRepository imageRepository,
    required ProfileRepository profileRepository,
  }) : _imageRepository = imageRepository,
       _profileRepository = profileRepository,
       super(UserAccountState()){
        _initialize();
       }
  final ImageRepository _imageRepository;
  final ProfileRepository _profileRepository;
  void _initialize(){
    readUserProfileImage();
    readUserProfile();
  }

  void readUserProfileImage() async {
    emit(
      state.copyWith(readUserProfileImageStatus: AsyncProcessingStatus.loading),
    );
    try {
      final profileImages = await _imageRepository.readUserProfileImage();
      final profileImage = await _imageRepository.readImage(profileImages.last);
      emit(
        state.copyWith(
          readUserProfileImageStatus: AsyncProcessingStatus.success,
          profileImage: () => profileImage,
        ),
      );
    } on InternetConnectionException {
      emit(
        state.copyWith(
          readUserProfileImageStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      emit(
        state.copyWith(
          readUserProfileImageStatus:
              AsyncProcessingStatus.serverConnectionError,
        ),
      );
    }
  }

  void readUserProfile() async {
    emit(state.copyWith(readUserProfileStatus: AsyncProcessingStatus.loading));
    try {
      final profile = await _profileRepository.userProfile();
      emit(
        state.copyWith(
          readUserProfileStatus: AsyncProcessingStatus.success,
          userProfile: () => profile,
        ),
      );
    } on InternetConnectionException {
      emit(
        state.copyWith(
          readUserProfileStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      emit(
        state.copyWith(
          readUserProfileStatus: AsyncProcessingStatus.serverConnectionError,
        ),
      );
    }
  }
}
