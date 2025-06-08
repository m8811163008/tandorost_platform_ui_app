import 'package:fitness_nutrition/fitness_nutrition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_report/food_report.dart';
import 'package:food_report_app/src/cubit/food_report_cubit.dart';

import 'package:food_report_app/src/widget/food_report_screen.dart';
import 'package:profile/profile.dart';

class FoodReportRoute extends StatelessWidget {
  const FoodReportRoute({
    super.key,
    this.goToFoodInputRoute,
    this.goToFitnessProfileRoute,
    this.onBottomNavigationChanged,
    required this.bottomNavigationIndex,
    this.onDrawerNavigationChanged,
    required this.drawerNavigationIndex,
  });

  final VoidCallback? goToFoodInputRoute;
  final VoidCallback? goToFitnessProfileRoute;
  final ValueChanged<int>? onBottomNavigationChanged;
  final int bottomNavigationIndex;
  final ValueChanged<int>? onDrawerNavigationChanged;
  final int drawerNavigationIndex;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) => FoodReportCubit(
            foodReport: RepositoryProvider.of<FoodReport>(context),
            fitnessNutrition: RepositoryProvider.of<FitnessNutrition>(context),
            profileRepository: RepositoryProvider.of<ProfileRepository>(context)
          ),
      lazy: false,
      child: FoodReportScreen(
        goToFoodInputRoute: goToFoodInputRoute,
        goToFitnessProfileRoute: goToFitnessProfileRoute,
        bottomNavigationIndex: bottomNavigationIndex,
        drawerNavigationIndex: drawerNavigationIndex,
        onBottomNavigationChanged: onBottomNavigationChanged,
        onDrawerNavigationChanged: onDrawerNavigationChanged,
      ),
    );
  }
}
