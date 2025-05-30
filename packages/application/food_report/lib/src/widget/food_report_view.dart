import 'package:flutter/material.dart';
import 'package:food_report_app/src/widget/food_list_consumer.dart';
import 'package:food_report_app/src/widget/food_report_consumer.dart';

class FoodReportView extends StatelessWidget {
  const FoodReportView({super.key, required this.foodListConsumer});
  final FoodListConsumer foodListConsumer;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [FoodReportStaticsConsumer(), foodListConsumer]),
    );
  }
}