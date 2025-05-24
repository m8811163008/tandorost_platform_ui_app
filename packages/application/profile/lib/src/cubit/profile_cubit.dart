import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:domain_model/domain_model.dart';
import 'package:image_repository/image_repository.dart';
import 'package:meta/meta.dart';
import 'package:profile/profile.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profile, this._imageRepository) : super(ProfileState()) {
    readProfile();
    readImageProfile();
  }
  final ProfileRepository _profile;
  final ImageRepository _imageRepository;

  void readImageProfile() async {
    emit(state.copyWith(readProfileImageStatus: AsyncProcessingStatus.loading));
    try {
      final profileImage = await _imageRepository.readUserProfileImage();
      FileDetail? actualImage;
      if (profileImage.isNotEmpty) {
        actualImage = await _imageRepository.readImage(profileImage.last);
      }

      emit(
        state.copyWith(
          readProfileImageStatus: AsyncProcessingStatus.success,
          profileImage: actualImage,
        ),
      );
    } on InternetConnectionException {
      emit(
        state.copyWith(
          readProfileImageStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      emit(
        state.copyWith(
          readProfileImageStatus: AsyncProcessingStatus.serverConnectionError,
        ),
      );
    }
  }

  void updateImageProfile(FileDetail profileImage) async {
    emit(state.copyWith(updatingProfileStatus: AsyncProcessingStatus.loading));
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

      emit(
        state.copyWith(
          updatingProfileStatus: AsyncProcessingStatus.success,
          profileImage: actualImage,
        ),
      );
    } on InternetConnectionException {
      emit(
        state.copyWith(
          updatingProfileStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      emit(
        state.copyWith(
          updatingProfileStatus: AsyncProcessingStatus.serverConnectionError,
        ),
      );
    }
  }

  void readProfile() async {
    emit(state.copyWith(readProfileStatus: AsyncProcessingStatus.loading));
    try {
      final profile = await _profile.userProfile();
      emit(
        state.copyWith(
          name: profile.fullName,
          phoneNumber: profile.phoneNumber,
          changeWeightSpeed: profile.changeWeightSpeed,
          isTimeRestrictedEating: profile.isTimeRestrictedEating,
          userProfile: profile,
          language: profile.language,
        ),
      );
      emit(state.copyWith(readProfileStatus: AsyncProcessingStatus.success));
    } on InternetConnectionException {
      emit(
        state.copyWith(
          readProfileStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      emit(
        state.copyWith(
          readProfileStatus: AsyncProcessingStatus.serverConnectionError,
        ),
      );
    }
  }

  void onChangeName(String name) async {
    emit(state.copyWith(name: name));
  }

  void updateName() async {
    await updateProfile(state.userProfile!.copyWith(fullName: state.name));
  }

  void onChangeWeightSpeed(ChangeWeightSpeed speed) async {
    await updateProfile(state.userProfile!.copyWith(changeWeightSpeed: speed));
    emit(state.copyWith(changeWeightSpeed: speed));
  }

  void onChangeIsFasting(bool isTimeRestrictedEating) async {
    await updateProfile(
      state.userProfile!.copyWith(
        isTimeRestrictedEating: isTimeRestrictedEating,
      ),
    );
    emit(state.copyWith(isTimeRestrictedEating: isTimeRestrictedEating));
  }

  void onChangeLanguage(Language? language) async {
    emit(state.copyWith(language: language));
  }

  void updateLanguage() async {
    await updateProfile(state.userProfile!.copyWith(language: state.language));
  }

  Future<void> updateProfile(UserProfile updatedProfile) async {
    if (state.userProfile == null) return;
    emit(state.copyWith(updatingProfileStatus: AsyncProcessingStatus.loading));
    try {
      final profile = await _profile.updateProfile(updatedProfile);
      emit(state.copyWith(userProfile: profile));
      emit(
        state.copyWith(updatingProfileStatus: AsyncProcessingStatus.success),
      );
    } on InternetConnectionException {
      emit(
        state.copyWith(
          updatingProfileStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      emit(
        state.copyWith(
          updatingProfileStatus: AsyncProcessingStatus.serverConnectionError,
        ),
      );
    }
  }
}
