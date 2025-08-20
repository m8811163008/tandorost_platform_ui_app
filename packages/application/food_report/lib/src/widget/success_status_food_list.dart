import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:food_report_app/src/widget/food_tile.dart';
import 'package:tandorost_components/tandorost_components.dart';

class SuccessStatusFoodsList extends StatelessWidget {
  const SuccessStatusFoodsList({super.key, this.foods = const []});
  final List<Food> foods;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppCardHeader(title: context.l10n.foodReportFoodsListLabel),
          // todo use custom scrool view with slivers for performance
          ...List.generate(
            
            foods.length,
            (index) => Padding(
              padding: EdgeInsets.only(
                bottom:
                    index == foods.length - 1
                        ? 0
                        : context.sizeExtenstion.small,
              ),
              child: FoodTile(food: foods[index]),
            ),
          ),
        ],
      ),
    );
  }
}
