import 'package:fitness_nutrition/fitness_nutrition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_report/food_report.dart';
import 'package:food_report_app/src/cubit/food_report_cubit.dart';
import 'package:tandorost_components/tandorost_components.dart';

class FoodReportRoute extends StatelessWidget {
  const FoodReportRoute({super.key});
  static const String name = 'food_report';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) => FoodReportCubit(
            foodReport: RepositoryProvider.of<FoodReport>(context),
            fitnessNutrition: RepositoryProvider.of<FitnessNutrition>(context),
          ),
      lazy: false,
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: AppScaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.monitor_heart)),
                Tab(icon: Icon(Icons.sports)),
              ],
            ),
          ),
          body: const TabBarView(
            children: <Widget>[
              FoodReportRestDayView(),
              FoodReportExcerciseDayView(),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodReportRestDayView extends StatelessWidget {
  const FoodReportRestDayView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: SizedBox());
  }
}

class FoodReportExcerciseDayView extends StatelessWidget {
  const FoodReportExcerciseDayView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: SizedBox());
  }
}
