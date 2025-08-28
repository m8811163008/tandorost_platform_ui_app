import 'dart:async';
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
       super(UserAccountState()) {
    _initialize();
  }
  final ImageRepository _imageRepository;
  final ProfileRepository _profileRepository;
  late final StreamSubscription<UserProfile?> userProfileSubscription;
  void _initialize() {
    readUserProfileImage();
    readUserProfile();
    userProfileSubscription = _profileRepository.userProfileStream.listen((
      profile,
    ) {
      if (profile == null) return;
      _enhancedEmit(state.copyWith(userProfile: () => profile));
    });
  }

  @override
  Future<void> close() async {
    await userProfileSubscription.cancel();
    return super.close();
  }

  void readUserProfileImage() async {
    _enhancedEmit(
      state.copyWith(readUserProfileImageStatus: AsyncProcessingStatus.loading),
    );
    try {
      final profileImages = await _imageRepository.readUserProfileImage();
      _enhancedEmit(
        state.copyWith(
          readUserProfileImageStatus: AsyncProcessingStatus.success,
        ),
      );
      if (profileImages.isEmpty) return;

      final profileImage = await _imageRepository.readImage(profileImages.last);
      _enhancedEmit(state.copyWith(profileImage: () => profileImage));
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          readUserProfileImageStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          readUserProfileImageStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void readUserProfile() async {
    _enhancedEmit(
      state.copyWith(readUserProfileStatus: AsyncProcessingStatus.loading),
    );
    try {
      await _profileRepository.userProfile();
      _enhancedEmit(
        state.copyWith(readUserProfileStatus: AsyncProcessingStatus.success),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          readUserProfileStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          readUserProfileStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void _enhancedEmit(UserAccountState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
