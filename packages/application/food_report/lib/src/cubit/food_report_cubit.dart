import 'dart:io';

import 'package:domain_model/domain_model.dart';
import 'package:fitness_nutrition/fitness_nutrition.dart';
import 'package:flutter/material.dart' hide State;
import 'package:food_report/food_report.dart';
import 'package:tandorost_components/tandorost_components.dart';

part 'food_report_state.dart';

class FoodReportCubit extends Cubit<FoodReportState> {
  FoodReportCubit({
    required FoodReport foodReport,
    required FitnessNutrition fitnessNutrition,
  }) : _foodReport = foodReport,
       _fitnessNutrition = fitnessNutrition,
       super(FoodReportState()) {
    _initialize();
  }
  final FoodReport _foodReport;
  final FitnessNutrition _fitnessNutrition;
  void _initialize() async {
    readFoodsNutrition();
    readNutritionRequirements();
  }

  @override
  Future<void> close() {
    // TODO: implement close
    return super.close();
  }

  void readFoodsNutrition() async {
    _enhancedEmit(
      state.copyWith(readFoodsNutritionStatus: AsyncProcessingStatus.loading),
    );
    try {
      final foods = await _foodReport.readFoodsNutrition(
        DateTime.now(),
        DateTime.now().copyWith(hour: 0, minute: 0, second: 0),
      );
      _enhancedEmit(
        state.copyWith(
          readFoodsNutritionStatus: AsyncProcessingStatus.success,
          foods: foods,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          readFoodsNutritionStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          readFoodsNutritionStatus: AsyncProcessingStatus.serverConnectionError,
        ),
      );
    }
  }

  void updateFoodsNutritions(Food food) async {
    _enhancedEmit(
      state.copyWith(
        updateFoodsNutritionsStatus: AsyncProcessingStatus.loading,
      ),
    );
    try {
      await _foodReport.updateFoodsNutritions(food);
      _enhancedEmit(
        state.copyWith(
          updateFoodsNutritionsStatus: AsyncProcessingStatus.success,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          updateFoodsNutritionsStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          updateFoodsNutritionsStatus:
              AsyncProcessingStatus.serverConnectionError,
        ),
      );
    }
  }

  void deleteFoodsNutritions(List<String> foodIds) async {
    _enhancedEmit(
      state.copyWith(
        deleteFoodsNutritionsStatus: AsyncProcessingStatus.loading,
      ),
    );
    try {
      await _foodReport.deleteFoodsNutritions(foodIds);
      _enhancedEmit(
        state.copyWith(
          deleteFoodsNutritionsStatus: AsyncProcessingStatus.success,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          deleteFoodsNutritionsStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          deleteFoodsNutritionsStatus:
              AsyncProcessingStatus.serverConnectionError,
        ),
      );
    }
  }

  void readNutritionRequirements() async {
    _enhancedEmit(
      state.copyWith(
        readNutritionRequirementsStatus: AsyncProcessingStatus.loading,
      ),
    );
    try {
      final nutritionRequirements =
          await _fitnessNutrition.readNutritionRequirements();
      _enhancedEmit(
        state.copyWith(
          readNutritionRequirementsStatus: AsyncProcessingStatus.success,
          nutritionRequirements: () => nutritionRequirements,
        ),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          readNutritionRequirementsStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          readNutritionRequirementsStatus:
              AsyncProcessingStatus.serverConnectionError,
        ),
      );
    }
  }

  void onSelectedFoodsChange(Food food) {
    final slectedFoods = List<Food>.from(state.selectedFoods);
    final isFoodSelectedBefore = slectedFoods.contains(food);
    if (!isFoodSelectedBefore) {
      slectedFoods.add(food);
    } else {
      slectedFoods.remove(food);
    }
    _enhancedEmit(state.copyWith(selectedFoods: slectedFoods));
  }

  void resetSelectedFoods() {
    _enhancedEmit(state.copyWith(selectedFoods: []));
  }

  void onChangeTab(SelectedTab selectedTab) {
    _enhancedEmit(state.copyWith(selectedTab: selectedTab));
  }

  void _enhancedEmit(FoodReportState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
