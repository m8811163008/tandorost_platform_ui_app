import 'dart:async';
import 'dart:io';

import 'package:domain_model/domain_model.dart';
import 'package:flutter/foundation.dart';
import 'package:image_repository/image_repository.dart';

import 'package:profile/profile.dart';
import 'package:tandorost_components/tandorost_components.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profile, this._imageRepository) : super(ProfileState()) {
    readProfile();
    readImageProfile();
  }
  final ProfileRepository _profile;
  final ImageRepository _imageRepository;

  void readImageProfile() async {
    _enhancedEmit(
      state.copyWith(readProfileImageStatus: AsyncProcessingStatus.loading),
    );
    try {
      final profileImage = await _imageRepository.readUserProfileImage();
      FileDetail? actualImage;
      if (profileImage.isNotEmpty) {
        actualImage = await _imageRepository.readImage(profileImage.last);
      }

      _enhancedEmit(
        state.copyWith(
          readProfileImageStatus: AsyncProcessingStatus.success,
          profileImage: actualImage,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          readProfileImageStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          readProfileImageStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void updateImageProfile(FileDetail profileImage) async {
    _enhancedEmit(
      state.copyWith(updatingProfileStatus: AsyncProcessingStatus.loading),
    );
    try {
      final userImage = UserImage(
        gallaryTag: GallaryTag.profileImage,
        imageGallaryFiles: [profileImage],
      );
      final updatedProfileImage = await _imageRepository.addUserImages(
        userImage,
      );
      final actualImage = await _imageRepository.readImage(
        updatedProfileImage.last,
      );

      _enhancedEmit(
        state.copyWith(
          updatingProfileStatus: AsyncProcessingStatus.success,
          profileImage: actualImage,
        ),
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

  void readProfile() async {
    _enhancedEmit(
      state.copyWith(readProfileStatus: AsyncProcessingStatus.loading),
    );
    try {
      final profile = await _profile.userProfile();
      _enhancedEmit(
        state.copyWith(
          name: profile.fullName,
          phoneNumber: profile.phoneNumber,
          changeWeightSpeed: profile.changeWeightSpeed,
          isTimeRestrictedEating: profile.isTimeRestrictedEating,
          userProfile: profile,
          language: profile.language,
        ),
      );
      _enhancedEmit(
        state.copyWith(readProfileStatus: AsyncProcessingStatus.success),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          readProfileStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          readProfileStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void onChangeName(String name) async {
    _enhancedEmit(state.copyWith(name: name));
  }

  void updateName() async {
    await updateProfile(state.userProfile!.copyWith(fullName: state.name));
  }

  void onChangeWeightSpeed(ChangeWeightSpeed speed) async {
    await updateProfile(state.userProfile!.copyWith(changeWeightSpeed: speed));
    _enhancedEmit(state.copyWith(changeWeightSpeed: speed));
  }

  void onChangeIsFasting(bool isTimeRestrictedEating) async {
    await updateProfile(
      state.userProfile!.copyWith(
        isTimeRestrictedEating: isTimeRestrictedEating,
      ),
    );
    _enhancedEmit(
      state.copyWith(isTimeRestrictedEating: isTimeRestrictedEating),
    );
    
  }

  void onChangeLanguage(Language? language) async {
    _enhancedEmit(state.copyWith(language: language));
  }

  void updateLanguage() async {
    await updateProfile(state.userProfile!.copyWith(language: state.language));
  }

  Future<void> updateProfile(UserProfile updatedProfile) async {
    if (state.userProfile == null) return;
    _enhancedEmit(
      state.copyWith(updatingProfileStatus: AsyncProcessingStatus.loading),
    );
    try {
      final profile = await _profile.updateProfile(updatedProfile);
      _enhancedEmit(state.copyWith(userProfile: profile));
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

  void _enhancedEmit(ProfileState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
