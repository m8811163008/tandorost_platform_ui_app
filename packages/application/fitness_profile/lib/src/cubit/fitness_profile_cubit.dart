import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:domain_model/domain_model.dart';
import 'package:fitness_nutrition/fitness_nutrition.dart';
import 'package:image_repository/image_repository.dart';
import 'package:meta/meta.dart';

part 'fitness_profile_state.dart';

class FitnessProfileCubit extends Cubit<FitnessProfileState> {
  FitnessProfileCubit({
    required ImageRepository imageRepository,
    required FitnessNutrition fitnessNutrition,
  }) : _imageRepository = imageRepository,
       _fitnessNutrition = fitnessNutrition,
       super(FitnessProfileState()) {
    _initialize();
  }

  void _initialize() {
    readUserImageGallary();
    readFitnessData();
  }

  final ImageRepository _imageRepository;
  final FitnessNutrition _fitnessNutrition;

  void onEditImageComplete(Uint8List bytes, String fileName) async {
    final fileDetail = FileDetail(fileName: fileName, bytes: bytes);
    final userImage = UserImage(
      gallaryTag: GallaryTag.defaultTag,
      imageGallaryFiles: [fileDetail],
    );
    emit(state.copyWith(addUserImageStatus: AsyncProcessingStatus.loading));

    try {
      final userImagesDetail = await _imageRepository.addUserImages(userImage);
      // find new added image
      final result =
          userImagesDetail.toSet().difference(state.filesData.toSet()).single;
      // fetch image
      final fetchImageDetail = await _imageRepository.readImage(result);
      // update state
      final List<FileDetail> filesDetail = List.from(state.filesDetail);
      filesDetail.add(fetchImageDetail);
      emit(
        state.copyWith(
          addUserImageStatus: AsyncProcessingStatus.success,
          filesData: userImagesDetail,
          filesDetail: filesDetail.reversed.toList(),
        ),
      );
    } on InternetConnectionException {
      emit(
        state.copyWith(
          addUserImageStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      emit(
        state.copyWith(
          addUserImageStatus: AsyncProcessingStatus.serverConnectionError,
        ),
      );
    }
  }

  void onChangeGender(Gender? gender) {
    final updatedUserFitnessProfile = state.userPhysicalDataUpsert.copyWith(
      gender: () => gender,
    );
    emit(state.copyWith(userPhysicalDataUpsert: updatedUserFitnessProfile));
  }

  void onChangeBirthDay(DateTime birthday) {
    final updatedUserFitnessProfile = state.userPhysicalDataUpsert.copyWith(
      birthday: () => birthday,
    );
    emit(state.copyWith(userPhysicalDataUpsert: updatedUserFitnessProfile));
  }

  void onChangeHeight(double height) {
    final updatedUserFitnessProfile = state.userPhysicalDataUpsert.copyWith(
      height: () => height,
    );
    emit(state.copyWith(userPhysicalDataUpsert: updatedUserFitnessProfile));
  }

  void onChangeWeight(double weight) {
    final updatedUserFitnessProfile = state.userPhysicalDataUpsert.copyWith(
      weight: () => weight,
    );
    emit(state.copyWith(userPhysicalDataUpsert: updatedUserFitnessProfile));
  }

  void onChangeWaistCircumference(double waistCircumference) {
    final updatedUserFitnessProfile = state.userPhysicalDataUpsert.copyWith(
      waistCircumference: () => waistCircumference,
    );
    emit(state.copyWith(userPhysicalDataUpsert: updatedUserFitnessProfile));
  }

  void onChangeArmCircumference(double armCircumference) {
    final updatedUserFitnessProfile = state.userPhysicalDataUpsert.copyWith(
      armCircumference: () => armCircumference,
    );
    emit(state.copyWith(userPhysicalDataUpsert: updatedUserFitnessProfile));
  }

  void onChangeChestCircumference(double chestCircumference) {
    final updatedUserFitnessProfile = state.userPhysicalDataUpsert.copyWith(
      chestCircumference: () => chestCircumference,
    );
    emit(state.copyWith(userPhysicalDataUpsert: updatedUserFitnessProfile));
  }

  void onChangeThighCircumference(double thighCircumference) {
    final updatedUserFitnessProfile = state.userPhysicalDataUpsert.copyWith(
      thighCircumference: () => thighCircumference,
    );
    emit(state.copyWith(userPhysicalDataUpsert: updatedUserFitnessProfile));
  }

  void onChangeCalfMuscleCircumference(double calfMuscleCircumference) {
    final updatedUserFitnessProfile = state.userPhysicalDataUpsert.copyWith(
      calfMuscleCircumference: () => calfMuscleCircumference,
    );
    emit(state.copyWith(userPhysicalDataUpsert: updatedUserFitnessProfile));
  }

  void onChangeHipCircumference(double hipCircumference) {
    final updatedUserFitnessProfile = state.userPhysicalDataUpsert.copyWith(
      hipCircumference: () => hipCircumference,
    );
    emit(state.copyWith(userPhysicalDataUpsert: updatedUserFitnessProfile));
  }

  void onChangeActivityLevel(ActivityLevel activityLevel) {
    final updatedUserFitnessProfile = state.userPhysicalDataUpsert.copyWith(
      activityLevel: () => activityLevel,
    );
    emit(state.copyWith(userPhysicalDataUpsert: updatedUserFitnessProfile));
  }

  void readUserImageGallary() async {
    emit(
      state.copyWith(readUserImageGallaryStatus: AsyncProcessingStatus.loading),
    );

    try {
      final userImagesDetail = await _imageRepository.readUserImageGallary([
        GallaryTag.defaultTag,
      ]);
      final filesDetail = <FileDetail>[];
      for (var imageDetail in userImagesDetail) {
        final result = await _imageRepository.readImage(imageDetail);
        filesDetail.add(result);
      }
      emit(
        state.copyWith(
          readUserImageGallaryStatus: AsyncProcessingStatus.success,
          filesData: userImagesDetail,
          filesDetail: filesDetail.reversed.toList(),
        ),
      );
    } on InternetConnectionException {
      emit(
        state.copyWith(
          readUserImageGallaryStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      emit(
        state.copyWith(
          readUserImageGallaryStatus:
              AsyncProcessingStatus.serverConnectionError,
        ),
      );
    }
  }

  void readFitnessData() async {
    emit(state.copyWith(readFitnessDataStatus: AsyncProcessingStatus.loading));

    try {
      final fitnessData = await _fitnessNutrition.readFitnessData();
      emit(
        state.copyWith(
          readFitnessDataStatus: AsyncProcessingStatus.success,
          fitnessData: fitnessData,
        ),
      );
    } on InternetConnectionException {
      emit(
        state.copyWith(
          readFitnessDataStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      emit(
        state.copyWith(
          readFitnessDataStatus: AsyncProcessingStatus.serverConnectionError,
        ),
      );
    }
  }
}
