import 'dart:io';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_input/food_input.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:path_provider/path_provider.dart';
import 'package:profile/profile.dart';
import 'package:record/record.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({
    required this.foodInputRepository,
    required this.profileRepository,
  }) : recorder = AudioRecorder(),
       super(SearchState()) {
    _init();
  }

  @override
  Future<void> close() async {
    await recorder.dispose();
    super.close();
  }

  void _init() async {
    final language = await profileRepository.userSpokenLanguage;
    emit(state.copyWith(userSpokenLanguage: language));
  }

  final FoodInputRepository foodInputRepository;
  final ProfileRepository profileRepository;
  final AudioRecorder recorder;
  void onFoodSearchUnfocused() {
    if (state.foodName.isPure) {
      state.copyWith(foodName: TextInput.dirty(state.foodName.value));
    }
  }

  Future<bool> get isPremissionAllowed => recorder.hasPermission();

  void onSearchByVoicePressedDown() async {
    // To fix first time getting permission.
    if (await isPremissionAllowed) {
      String path = '';
      if (!kIsWeb) {
        final tempDir = await getTemporaryDirectory();
        path = '${tempDir.path}/record.wav';
      }
      await recorder.start(const RecordConfig(), path: path);
    }
  }

  void onFoodSearchChanged(String value) {
    final foodInput =
        state.foodName.isPure ? TextInput.pure(value) : TextInput.dirty(value);
    emit(state.copyWith(foodName: foodInput));
  }

  void onChangeLanguage(Language? language) async {
    if (language != null) {
      emit(state.copyWith(userSpokenLanguage: language));
      await profileRepository.upsertUserSpokenLanguage(language);
    }
  }

  void onSearchByVoicePressedUp() async {
    final out = await recorder.stop();
    if (out == null) {
      return;
    }
    emit(state.copyWith(searchFoodsStatus: AsyncProcessingStatus.loading));
    late Uint8List bytes;
    if (!kIsWeb) {
      final file = File(out);
      bytes = await file.readAsBytes();
    } else {
      final file = PickedFile(out);
      bytes = await file.readAsBytes();
    }
    final fileDetail = FileDetail(fileName: 'user_voice_foods.wav', bytes: bytes);
    await onReadFoodsNutritionsByVoice(fileDetail);
  }

  Future<void> onReadFoodsNutritionsByVoice(FileDetail fileDetail) async {
    try {
      final userLanguage = await profileRepository.userLanguage.first;
      await foodInputRepository.readFoodsNutritionsByVoice(
        prompt: fileDetail,
        userSpokenLanguage: state.userSpokenLanguage ?? userLanguage,
      );
      emit(state.copyWith(searchFoodsStatus: AsyncProcessingStatus.success));
    } on InternetConnectionException {
      emit(
        state.copyWith(
          searchFoodsStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      emit(
        state.copyWith(
          searchFoodsStatus: AsyncProcessingStatus.serverConnectionError,
        ),
      );
    }
  }

  void readFoodsNutritionsByText() async {
    if (state.foodName.isValid) {
      emit(state.copyWith(searchFoodsStatus: AsyncProcessingStatus.loading));
      try {
        await foodInputRepository.readFoodsNutritionsByText(
          state.foodName.value,
        );
        emit(state.copyWith(searchFoodsStatus: AsyncProcessingStatus.success));
      } on InternetConnectionException {
        emit(
          state.copyWith(
            searchFoodsStatus: AsyncProcessingStatus.internetConnectionError,
          ),
        );
      } on HttpException {
        emit(
          state.copyWith(
            searchFoodsStatus: AsyncProcessingStatus.serverConnectionError,
          ),
        );
      }
    }
  }
}
