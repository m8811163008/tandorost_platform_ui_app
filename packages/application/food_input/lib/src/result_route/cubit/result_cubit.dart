import 'dart:async';
import 'dart:io';


import 'package:domain_model/domain_model.dart';
import 'package:flutter/foundation.dart';
import 'package:food_input/food_input.dart';
import 'package:tandorost_components/tandorost_components.dart';


part 'result_state.dart';

class ResultCubit extends Cubit<ResultState> {
  ResultCubit({required this.foodInputRepository}) : super(ResultState()) {
    _subscription = foodInputRepository.foodList.listen((foodList) {
      emit(state.copyWith(foods: foodList));
    });
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }

  final FoodInputRepository foodInputRepository;
  late final StreamSubscription<List<Food>> _subscription;
  void updateFood(Food food) async {
    emit(state.copyWith(updatingStatus: AsyncProcessingStatus.loading));
    try {
      await foodInputRepository.updateFoodsNutritions(food);
      emit(state.copyWith(updatingStatus: AsyncProcessingStatus.success));
    } on InternetConnectionException {
      emit(
        state.copyWith(
          updatingStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      emit(
        state.copyWith(
          updatingStatus: AsyncProcessingStatus.serverConnectionError,
        ),
      );
    }
  }
  void deleteFood(List<String> foodIds) async {
    emit(state.copyWith(deletingStatus: AsyncProcessingStatus.loading));
    try {
      await foodInputRepository.deleteFoodsNutritions(foodIds);
      emit(state.copyWith(deletingStatus: AsyncProcessingStatus.success));
    } on InternetConnectionException {
      emit(
        state.copyWith(
          deletingStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      emit(
        state.copyWith(
          deletingStatus: AsyncProcessingStatus.serverConnectionError,
        ),
      );
    }
  }
}
