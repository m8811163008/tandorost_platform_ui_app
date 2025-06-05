import 'package:flutter/material.dart';
import 'package:food_report_app/src/widget/food_list_consumer.dart';
import 'package:food_report_app/src/widget/food_report_consumer.dart';

class FoodReportView extends StatelessWidget {
  const FoodReportView({
    super.key,
    required this.foodListConsumer,
    this.goToFitnessProfileRoute,
  });
  final FoodListConsumer foodListConsumer;
  final VoidCallback? goToFitnessProfileRoute;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FoodReportStaticsConsumer(
          goToFitnessProfileRoute: goToFitnessProfileRoute,
        ),
        foodListConsumer,
      ],
    );
  }
}
