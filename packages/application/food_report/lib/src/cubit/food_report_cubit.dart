import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:domain_model/domain_model.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_nutrition/fitness_nutrition.dart';
import 'package:flutter/material.dart';
import 'package:food_report/food_report.dart';

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

  void readFoodsNutrition() async {
    emit(
      state.copyWith(readFoodsNutritionStatus: AsyncProcessingStatus.loading),
    );
    try {
      final foods = await _foodReport.readFoodsNutrition(
        DateTime.now(),
        DateTime.now().copyWith(hour: 0, minute: 0, second: 0),
      );
      emit(
        state.copyWith(
          readFoodsNutritionStatus: AsyncProcessingStatus.success,
          foods: foods,
        ),
      );
    } on InternetConnectionException {
      emit(
        state.copyWith(
          readFoodsNutritionStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      emit(
        state.copyWith(
          readFoodsNutritionStatus: AsyncProcessingStatus.serverConnectionError,
        ),
      );
    }
  }

  void updateFoodsNutritions(Food food) async {
    emit(state.copyWith(updateFoodsNutritionsStatus: AsyncProcessingStatus.loading));
    try {
      await _foodReport.updateFoodsNutritions(food);
      emit(state.copyWith(updateFoodsNutritionsStatus: AsyncProcessingStatus.success));
    } on InternetConnectionException {
      emit(
        state.copyWith(
          updateFoodsNutritionsStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      emit(
        state.copyWith(
          updateFoodsNutritionsStatus: AsyncProcessingStatus.serverConnectionError,
        ),
      );
    }
  }

  void deleteFoodsNutritions(List<String> foodIds) async {
    emit(state.copyWith(deleteFoodsNutritionsStatus: AsyncProcessingStatus.loading));
    try {
      await _foodReport.deleteFoodsNutritions(foodIds);
      emit(state.copyWith(deleteFoodsNutritionsStatus: AsyncProcessingStatus.success));
    } on InternetConnectionException {
      emit(
        state.copyWith(
          deleteFoodsNutritionsStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      emit(
        state.copyWith(
          deleteFoodsNutritionsStatus: AsyncProcessingStatus.serverConnectionError,
        ),
      );
    }
  }

  void readNutritionRequirements() async {
    emit(
      state.copyWith(
        readNutritionRequirementsStatus: AsyncProcessingStatus.loading,
      ),
    );
    try {
      final nutritionRequirements =
          await _fitnessNutrition.readNutritionRequirements();
      emit(
        state.copyWith(
          readNutritionRequirementsStatus: AsyncProcessingStatus.success,
          nutritionRequirements: () => nutritionRequirements,
        ),
      );
    } on InternetConnectionException {
      emit(
        state.copyWith(
          readNutritionRequirementsStatus:
              AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      emit(
        state.copyWith(
          readNutritionRequirementsStatus:
              AsyncProcessingStatus.serverConnectionError,
        ),
      );
    }
  }
}
