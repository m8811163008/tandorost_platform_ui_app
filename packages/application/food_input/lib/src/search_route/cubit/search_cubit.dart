import 'dart:io';

import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_input/food_input.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.foodInputRepository}) : super(SearchState());
  final FoodInputRepository foodInputRepository;
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

  void readFoodsNutritionsByText() async {
    if (state.foodName.isValid) {
      emit(state.copyWith(searchFoodsStatus: AsyncProcessingStatus.loading));
      try {
        await foodInputRepository.readFoodsNutritionsByText(
          state.foodName.value,
        );
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
