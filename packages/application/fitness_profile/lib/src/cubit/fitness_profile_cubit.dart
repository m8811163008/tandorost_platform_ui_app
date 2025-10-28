import 'dart:async';
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
    _initiateSubscriptions();
  }

  final ImageRepository _imageRepository;
  final FitnessNutrition _fitnessNutrition;
  late final StreamSubscription<UserPhysicalProfile?>
  _userPhysicalProfileSubscription;
  late final StreamSubscription<FitnessData?> _fitnessDataSubscription;

  @override
  Future<void> close() {
    _userPhysicalProfileSubscription.cancel();
    return super.close();
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
      birthday: () => birthday.toUtc(),
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
      await _fitnessNutrition.readUserPhysicalProfile();
      _enhancedEmit(
        state.copyWith(
          readUserPhysicalProfileStatus: AsyncProcessingStatus.success,
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
      await _fitnessNutrition.updateUserPhysicalData(
        state.userPhysicalDataUpsert,
      );
      _enhancedEmit(
        state.copyWith(
          updateUserPhysicalDataStatus: AsyncProcessingStatus.success,
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
      final userImagesDetail = await _imageRepository.addUserImages(userImage);
      // fetch image
      final fetchImageDetail = await _imageRepository.readImage(
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

  void readUserImageGallary() async {
    _enhancedEmit(
      state.copyWith(readUserImageGallaryStatus: AsyncProcessingStatus.loading),
    );

    try {
      final userImagesDetail = await _imageRepository
          .readUnarchivedUserImageGallary([GallaryTag.defaultTag]);

      final filesDetail = <FileDetail>[];
      for (var imageDetail in userImagesDetail) {
        final result = await _imageRepository.readImage(imageDetail);

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

  void readFitnessData() async {
    _enhancedEmit(
      state.copyWith(readFitnessDataStatus: AsyncProcessingStatus.loading),
    );

    try {
      await _fitnessNutrition.readFitnessData();
      _enhancedEmit(
        state.copyWith(readFitnessDataStatus: AsyncProcessingStatus.success),
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
      await _imageRepository.archiveUserImages(state.archiveImagesId);
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

    // empty archiveImagesId
  }

  void onChangeChartType(ChartType chartType) {
    _enhancedEmit(state.copyWith(selectedChartType: chartType));
  }

  void _enhancedEmit(FitnessProfileState state) {
    if (!isClosed) {
      emit(state);
    }
  }

  void _initiateSubscriptions() {
    _userPhysicalProfileSubscription = _fitnessNutrition
        .userPhysicalProfileStream
        .listen((userPhysicalProfile) {
          _enhancedEmit(
            state.copyWith(userPhysicalProfile: userPhysicalProfile),
          );
        });
    _fitnessDataSubscription = _fitnessNutrition.readFitnessDataStream.listen((
      fitnessData,
    ) {
      _enhancedEmit(state.copyWith(fitnessData: fitnessData));
    });
  }
}
