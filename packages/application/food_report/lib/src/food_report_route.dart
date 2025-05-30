import 'package:fitness_nutrition/fitness_nutrition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_report/food_report.dart';
import 'package:food_report_app/src/cubit/food_report_cubit.dart';

import 'package:food_report_app/src/widget/food_report_screen.dart';

class FoodReportRoute extends StatelessWidget {
  const FoodReportRoute({
    super.key,
    this.goToFoodInputRoute,
    this.goToFitnessProfileRoute,
  });
  static const String name = 'food_report';
  final VoidCallback? goToFoodInputRoute;
  final VoidCallback? goToFitnessProfileRoute;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) => FoodReportCubit(
            foodReport: RepositoryProvider.of<FoodReport>(context),
            fitnessNutrition: RepositoryProvider.of<FitnessNutrition>(context),
          ),
      lazy: false,
      child: FoodReportScreen(
        goToFoodInputRoute: goToFoodInputRoute,
        goToFitnessProfileRoute: goToFitnessProfileRoute,
      ),
    );
  }
}
