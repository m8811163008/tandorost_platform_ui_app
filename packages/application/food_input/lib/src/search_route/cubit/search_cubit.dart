import 'dart:io';

import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_input/food_input.dart';
import 'package:profile/profile.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({
    required this.foodInputRepository,
    required this.profileRepository,
  }) : super(SearchState()) {
    _init();
  }

  void _init() async {
    final language = await profileRepository.userSpokenLanguage;
    emit(state.copyWith(userSpokenLanguage: language));
  }

  final FoodInputRepository foodInputRepository;
  final ProfileRepository profileRepository;
  void onFoodSearchUnfocused() {
    if (state.foodName.isPure) {
      state.copyWith(foodName: TextInput.dirty(state.foodName.value));
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

  void onReadFoodsNutritionsByVoice(FileDetail fileDetail) async {
    emit(state.copyWith(searchFoodsStatus: AsyncProcessingStatus.loading));
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
