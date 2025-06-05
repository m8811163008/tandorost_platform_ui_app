import 'dart:io';
import 'dart:typed_data';

import 'package:domain_model/domain_model.dart';
import 'package:fitness_nutrition/fitness_nutrition.dart';
import 'package:image_repository/image_repository.dart';
import 'package:tandorost_components/tandorost_components.dart';

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
    readUserPhysicalProfile();
  }

  final ImageRepository _imageRepository;
  final FitnessNutrition _fitnessNutrition;

  void onEditImageComplete(Uint8List bytes, String fileName) async {
    final fileDetail = FileDetail(fileName: fileName, bytes: bytes);
    final userImage = UserImage(
      gallaryTag: GallaryTag.defaultTag,
      imageGallaryFiles: [fileDetail],
    );
    _enhancedEmit(
      state.copyWith(addUserImageStatus: AsyncProcessingStatus.loading),
    );

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
      _enhancedEmit(
        state.copyWith(
          addUserImageStatus: AsyncProcessingStatus.success,
          filesData: userImagesDetail,
          filesDetail: filesDetail.reversed.toList(),
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

  void onChangeGender(Gender? gender) {
    final updatedUserFitnessProfile = state.userPhysicalDataUpsert.copyWith(
      gender: () => gender,
    );
    _enhancedEmit(
      state.copyWith(userPhysicalDataUpsert: updatedUserFitnessProfile),
    );
  }

  void onChangeBirthDay(DateTime birthday) {
    final updatedUserFitnessProfile = state.userPhysicalDataUpsert.copyWith(
      birthday: () => birthday,
    );
    _enhancedEmit(
      state.copyWith(userPhysicalDataUpsert: updatedUserFitnessProfile),
    );
  }

  void onChangeHeight(double? height) {
    final updatedUserFitnessProfile = state.userPhysicalDataUpsert.copyWith(
      height: () => height,
    );
    _enhancedEmit(
      state.copyWith(userPhysicalDataUpsert: updatedUserFitnessProfile),
    );
  }

  void onChangeWeight(double? weight) {
    final updatedUserFitnessProfile = state.userPhysicalDataUpsert.copyWith(
      weight: () => weight,
    );
    _enhancedEmit(
      state.copyWith(userPhysicalDataUpsert: updatedUserFitnessProfile),
    );
  }

  void onChangeWaistCircumference(double? waistCircumference) {
    final updatedUserFitnessProfile = state.userPhysicalDataUpsert.copyWith(
      waistCircumference: () => waistCircumference,
    );
    _enhancedEmit(
      state.copyWith(userPhysicalDataUpsert: updatedUserFitnessProfile),
    );
  }

  void onChangeArmCircumference(double? armCircumference) {
    final updatedUserFitnessProfile = state.userPhysicalDataUpsert.copyWith(
      armCircumference: () => armCircumference,
    );
    _enhancedEmit(
      state.copyWith(userPhysicalDataUpsert: updatedUserFitnessProfile),
    );
  }

  void onChangeChestCircumference(double? chestCircumference) {
    final updatedUserFitnessProfile = state.userPhysicalDataUpsert.copyWith(
      chestCircumference: () => chestCircumference,
    );
    _enhancedEmit(
      state.copyWith(userPhysicalDataUpsert: updatedUserFitnessProfile),
    );
  }

  void onChangeThighCircumference(double? thighCircumference) {
    final updatedUserFitnessProfile = state.userPhysicalDataUpsert.copyWith(
      thighCircumference: () => thighCircumference,
    );
    _enhancedEmit(
      state.copyWith(userPhysicalDataUpsert: updatedUserFitnessProfile),
    );
  }

  void onChangeCalfMuscleCircumference(double? calfMuscleCircumference) {
    final updatedUserFitnessProfile = state.userPhysicalDataUpsert.copyWith(
      calfMuscleCircumference: () => calfMuscleCircumference,
    );
    _enhancedEmit(
      state.copyWith(userPhysicalDataUpsert: updatedUserFitnessProfile),
    );
  }

  void onChangeHipCircumference(double? hipCircumference) {
    final updatedUserFitnessProfile = state.userPhysicalDataUpsert.copyWith(
      hipCircumference: () => hipCircumference,
    );
    _enhancedEmit(
      state.copyWith(userPhysicalDataUpsert: updatedUserFitnessProfile),
    );
  }

  void onChangeActivityLevel(ActivityLevel? activityLevel) {
    final updatedUserFitnessProfile = state.userPhysicalDataUpsert.copyWith(
      activityLevel: () => activityLevel,
    );
    _enhancedEmit(
      state.copyWith(userPhysicalDataUpsert: updatedUserFitnessProfile),
    );
  }

  void readUserPhysicalProfile() async {
    _enhancedEmit(
      state.copyWith(
        readUserPhysicalProfileStatus: AsyncProcessingStatus.loading,
      ),
    );
    try {
      final userPhysicalProfile =
          await _fitnessNutrition.readUserPhysicalProfile();
      _enhancedEmit(
        state.copyWith(
          readUserPhysicalProfileStatus: AsyncProcessingStatus.success,
          userPhysicalProfile: userPhysicalProfile,
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

  void updateUserPhysicalData() async {
    _enhancedEmit(
      state.copyWith(
        updateUserPhysicalDataStatus: AsyncProcessingStatus.loading,
      ),
    );
    try {
      final userPhysicalProfile = await _fitnessNutrition
          .updateUserPhysicalData(state.userPhysicalDataUpsert);
      _enhancedEmit(
        state.copyWith(
          updateUserPhysicalDataStatus: AsyncProcessingStatus.success,
          userPhysicalProfile: userPhysicalProfile,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          updateUserPhysicalDataStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          updateUserPhysicalDataStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void onDeleteDataPoint(String dataPointId) async {
    _enhancedEmit(
      state.copyWith(
        deleteUserPhysicalDataPointStatus: AsyncProcessingStatus.loading,
      ),
    );
    try {
      await _fitnessNutrition.deleteUserPhysicalDataPoint(
        dataPointsId: dataPointId,
      );
      _enhancedEmit(
        state.copyWith(
          deleteUserPhysicalDataPointStatus: AsyncProcessingStatus.success,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          deleteUserPhysicalDataPointStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          deleteUserPhysicalDataPointStatus:
              AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void readUserImageGallary() async {
    _enhancedEmit(
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
      _enhancedEmit(
        state.copyWith(
          readUserImageGallaryStatus: AsyncProcessingStatus.success,
          filesData: userImagesDetail,
          filesDetail: filesDetail.reversed.toList(),
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

  void readFitnessData() async {
    _enhancedEmit(
      state.copyWith(readFitnessDataStatus: AsyncProcessingStatus.loading),
    );

    try {
      final fitnessData = await _fitnessNutrition.readFitnessData();
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

  void _enhancedEmit(FitnessProfileState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
