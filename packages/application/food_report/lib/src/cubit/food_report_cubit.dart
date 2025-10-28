import 'dart:async';
import 'dart:io';

import 'package:domain_model/domain_model.dart';
import 'package:fitness_nutrition/fitness_nutrition.dart';
import 'package:flutter/material.dart' hide State;
import 'package:food_report/food_report.dart';
import 'package:profile/profile.dart';
import 'package:tandorost_components/tandorost_components.dart';

part 'food_report_state.dart';

class FoodReportCubit extends Cubit<FoodReportState> {
  FoodReportCubit({
    required FoodReport foodReport,
    required FitnessNutrition fitnessNutrition,
    required ProfileRepository profileRepository,
  }) : _foodReport = foodReport,
       _fitnessNutrition = fitnessNutrition,
       _profileRepository = profileRepository,
       super(FoodReportState()) {
    _initialize();
  }
  final FoodReport _foodReport;
  final FitnessNutrition _fitnessNutrition;
  final ProfileRepository _profileRepository;
  late final StreamSubscription<NutritionRequirements?>
  _nutritionRequirementsSubscription;
  late final StreamSubscription<UserPhysicalProfile?>
  _userPhysicalProfileSubscription;
  late final StreamSubscription<UserProfile?> userProfileSubscription;
  void _initialize() async {
    readFoodsNutrition();
    readNutritionRequirements();
    readProfile();
    readPhysicalProfile();
    _checkCommitBazzarReview();
    _checkIsShowAddHomeWidgetDialog();
    _initiateSubscriptions();
  }

  @override
  Future<void> close() async {
    await Future.wait([
      _nutritionRequirementsSubscription.cancel(),
      _userPhysicalProfileSubscription.cancel(),
      userProfileSubscription.cancel(),
    ]);
    return super.close();
  }

  void readFoodsNutrition() async {
    _enhancedEmit(
      state.copyWith(readFoodsNutritionStatus: AsyncProcessingStatus.loading),
    );
    try {
      final foods = await _foodReport.readFoodsNutrition(
        DateTime.now().toUtc().add(Duration(days: 1)),
        DateTime.now().copyWith(hour: 0, minute: 0, second: 0).toUtc(),
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
          readFoodsNutritionStatus: AsyncProcessingStatus.connectionError,
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
          updateFoodsNutritionsStatus: AsyncProcessingStatus.connectionError,
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
          deleteFoodsNutritionsStatus: AsyncProcessingStatus.connectionError,
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
      await _fitnessNutrition.readNutritionRequirements();
      _enhancedEmit(
        state.copyWith(
          readNutritionRequirementsStatus: AsyncProcessingStatus.success,
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
              AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void readProfile() async {
    _enhancedEmit(
      state.copyWith(readProfileStatus: AsyncProcessingStatus.loading),
    );
    try {
      await _profileRepository.userProfile();
      _enhancedEmit(
        state.copyWith(readProfileStatus: AsyncProcessingStatus.success),
      );
    } on InternetConnectionException {
      _enhancedEmit(
        state.copyWith(
          readProfileStatus: AsyncProcessingStatus.internetConnectionError,
        ),
      );
    } on HttpException {
      _enhancedEmit(
        state.copyWith(
          readProfileStatus: AsyncProcessingStatus.connectionError,
        ),
      );
    }
  }

  void readPhysicalProfile() async {
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

  void _checkCommitBazzarReview() async {
    final isReviewed = await _profileRepository.isReviewedBazzar;
    _enhancedEmit(state.copyWith(isCommitReviewedOnCafeBazzar: isReviewed));
  }

  void onCommitedBazzarReview() async {
    _profileRepository.reviewedBazzar();
    final isReviewed = await _profileRepository.isReviewedBazzar;
    _enhancedEmit(state.copyWith(isCommitReviewedOnCafeBazzar: isReviewed));
  }

  void _checkIsShowAddHomeWidgetDialog() async {
    final isShowed = await _profileRepository.isShowAddHomeWidgetDialog;
    _enhancedEmit(state.copyWith(isShowAddHomeWidgetDialog: isShowed));
  }

  void onToggleIsShowAddHomeWidgetDialog() async {
    _profileRepository.toggleIsShowAddHomeWidgetDialog();
    final isShowed = await _profileRepository.isShowAddHomeWidgetDialog;
    _enhancedEmit(state.copyWith(isShowAddHomeWidgetDialog: isShowed));
  }

  void _enhancedEmit(FoodReportState state) {
    if (!isClosed) {
      emit(state);
    }
  }

  void _initiateSubscriptions() {
    _nutritionRequirementsSubscription = _fitnessNutrition
        .nutritionRequirementsStream
        .listen((nutritionRequirements) {
          if (nutritionRequirements != null) {
            _enhancedEmit(
              state.copyWith(
                nutritionRequirements: () => nutritionRequirements,
              ),
            );
          }
        });
    _userPhysicalProfileSubscription = _fitnessNutrition
        .userPhysicalProfileStream
        .listen((userPhysicalProfile) {
          _enhancedEmit(
            state.copyWith(userPhysicalProfile: userPhysicalProfile),
          );
        });

    userProfileSubscription = _profileRepository.userProfileStream.listen((
      profile,
    ) {
      if (profile == null) return;
      _enhancedEmit(state.copyWith(userProfile: profile));
    });
  }
}
