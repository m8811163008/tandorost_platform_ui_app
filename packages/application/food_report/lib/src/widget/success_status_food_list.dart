import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:food_report_app/src/widget/food_tile.dart';
import 'package:tandorost_components/tandorost_components.dart';

class SuccessStatusFoodsList extends StatelessWidget {
  const SuccessStatusFoodsList({super.key, this.foods = const []});
  final List<Food> foods;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppCardHeader(title: 'foods list'),
        ListView.separated(
          shrinkWrap: true,
          itemCount: foods.length,
          itemBuilder: (context, index) {
            return FoodTile(food: foods[index]);
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: context.sizeExtenstion.small);
          },
        ),
      ],
    );
  }
}